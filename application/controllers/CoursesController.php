<?php
/**
 * @since 4/21/09
 * @package catalog.controllers
 * 
 * @copyright Copyright &copy; 2009, Middlebury College
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License (GPL)
 */ 

/**
 * A controller for working with courses
 * 
 * @since 4/21/09
 * @package catalog.controllers
 * 
 * @copyright Copyright &copy; 2009, Middlebury College
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License (GPL)
 */
class CoursesController
	extends AbstractCatalogController
{
	
	/**
     * Initialize object
     *
     * Called from {@link __construct()} as final step of object instantiation.
     *
     * @return void
     */
    public function init() {
		$this->alternateType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:alternates');

		parent::init();
	}
	
	/**
	 * Print out a list of all courses
	 * 
	 * @return void
	 * @access public
	 * @since 4/21/09
	 */
	public function listAction () {
		if ($this->_getParam('catalog')) {
			$catalogId = $this->_helper->osidId->fromString($this->_getParam('catalog'));
			$lookupSession = $this->_helper->osid->getCourseManager()->getCourseLookupSessionForCatalog($catalogId);
			$this->view->title = 'Courses in '.$lookupSession->getCourseCatalog()->getDisplayName();
		} else {
			$lookupSession = $this->_helper->osid->getCourseManager()->getCourseLookupSession();
			$this->view->title = 'Courses in All Catalogs';
		}
		$lookupSession->useFederatedCourseCatalogView();
		
		$this->view->courses = $lookupSession->getCourses();
		
		$this->setSelectedCatalogId($lookupSession->getCourseCatalogId());
		$this->view->headTitle($this->view->title);
		
		$this->view->menuIsCourses = true;
	}
	
	/**
	 * View a catalog details
	 * 
	 * @return void
	 * @access public
	 * @since 4/21/09
	 */
	public function viewAction () {
		$id = $this->_helper->osidId->fromString($this->_getParam('course'));
		$lookupSession = $this->_helper->osid->getCourseManager()->getCourseLookupSession();
		$lookupSession->useFederatedCourseCatalogView();
		$this->view->course = $lookupSession->getCourse($id);
		
		// Load the topics into our view
 		$this->loadTopics($this->view->course->getTopics());
		
		// Set the selected Catalog Id.
		$catalogSession = $this->_helper->osid->getCourseManager()->getCourseCatalogSession();
		$catalogIds = $catalogSession->getCatalogIdsByCourse($id);
		if ($catalogIds->hasNext()) {
			$this->setSelectedCatalogId($catalogIds->getNextId());
		}
		
		// Set the title
		$this->view->title = $this->view->course->getDisplayName();
		$this->view->headTitle($this->view->title);
		
		$this->view->menuIsCourses = true;
		
		// Alternates
 		if ($this->view->course->hasRecordType($this->alternateType)) {
 			$record = $this->view->course->getCourseRecord($this->alternateType);
 			if ($record->hasAlternates()) {
 				$this->view->alternates = $record->getAlternates();
 			}
 		}
				
		// Term
		if ($this->_getParam('term')) {
			$termId = $this->_helper->osidId->fromString($this->_getParam('term'));
			$termLookupSession = $this->_helper->osid->getCourseManager()->getTermLookupSession();
			$termLookupSession->useFederatedCourseCatalogView();
			$this->view->term = $termLookupSession->getTerm($termId);
			
			$allParams = array();
			$allParams['course'] = $this->_getParam('course');
			if ($this->getSelectedCatalogId())
				$allParams['catalog'] = $this->_helper->osidId->toString($this->getSelectedCatalogId());
			$this->view->offeringsForAllTermsUrl = $this->_helper->url('view', 'courses', null, $allParams);
		} else {
			$this->view->linkTermId = $this->_helper->osidTerms->getCurrentTermId($this->getSelectedCatalogId());
		}
		
		// Bookmarked Courses and Schedules
 		$this->view->bookmarks_CourseId = $this->view->course->getId(); 
		
		$this->render();
		
		// offerings
		$this->view->offeringsTitle = "Sections";
		$offeringLookupSession = $this->_helper->osid->getCourseManager()->getCourseOfferingLookupSession();
		$offeringLookupSession->useFederatedCourseCatalogView();
		if (isset($this->view->term)) {
			$this->view->offerings = $offeringLookupSession->getCourseOfferingsByTermForCourse(
				$this->view->term->getId(),
				$id
			);
		} else {
			$this->view->offerings = $offeringLookupSession->getCourseOfferingsForCourse($id);
		}
 		$this->render('offerings', null, true);
	}
	
	/**
	 * Search for courses
	 * 
	 * @return void
	 * @access public
	 * @since 6/15/09
	 */
	public function searchxmlAction () {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		if (!$this->_getParam('catalog')) {
			header('HTTP/1.1 400 Bad Request');
			print "A catalog must be specified.";
			exit;
		}
		try {
			$catalogId = $this->_helper->osidId->fromString($this->_getParam('catalog'));
			$searchSession = $this->_helper->osid->getCourseManager()->getCourseOfferingSearchSessionForCatalog($catalogId);
		} catch (osid_InvalidArgumentException $e) {
			header('HTTP/1.1 400 Bad Request');
			print "The catalog id specified was not of the correct format.";
			exit;
		} catch (osid_NotFoundException $e) {
			header('HTTP/1.1 404 Not Found');
			print "The catalog id specified was not found.";
			exit;
		}
		
		$keywords = trim($this->_getParam('keywords'));
		$searchUrl = $this->_helper->pathAsAbsoluteUrl($this->_helper->url('search', 'offerings', null, array('catalog' => $this->_getParam('catalog'), 'keywords' => $keywords, 'submit' => 'Search')));
		
		header('Content-Type: text/xml');
		print '<?xml version="1.0" encoding="utf-8" ?>
<rss version="2.0">
	<channel>
		<title>Course Search: "'.htmlspecialchars($keywords).'"</title>
		<link>'.$searchUrl.'</link>
		<description></description>
		<lastBuildDate>'.date('r').'</lastBuildDate>
		<generator>Course Catalog</generator>
		<docs>http://blogs.law.harvard.edu/tech/rss</docs>
		
';
		$courses = array();
		// Fetch courses
		if (strlen($keywords)) {
			// For now we will do an offering search and return courses
			// only from it. If a course search session is available, it would
			// be preferable to use that.
			$query = $searchSession->getCourseOfferingQuery();
			$query->matchKeyword(
				$keywords,
				new phpkit_type_URNInetType("urn:inet:middlebury.edu:search:wildcard"),
				true);
			$offerings = $searchSession->getCourseOfferingsByQuery($query);
			
			while ($offerings->hasNext() && count($courses) <= 20) {
				$offering = $offerings->getNextCourseOffering();
				$courseIdString = $this->_helper->osidId->toString($offering->getCourseId());
				if (!isset($courses[$courseIdString])) {
					try {
						$courses[$courseIdString] = $offering->getCourse();
					} catch (osid_OperationFailedException $e) {
// 						print "\n<item><title>Failure on ".$offering->getDisplayName()."</title><description><![CDATA[<pre>OfferingId:\n".print_r($offering->getId(), true)."\n\nCourseId:\n".print_r($offering->getCourseId(), true)."</pre>]]></description></item>";
					}
				}
			}
		}
		
		// Print out courses as items.
		foreach ($courses as $courseIdString => $course) {
			print "\n\t\t<item>";
			
			print "\n\t\t\t<title>";
			print htmlspecialchars($course->getDisplayName().' - '.$course->getTitle());
			print "</title>";
			
			print "\n\t\t\t<link>";
			print $this->_helper->pathAsAbsoluteUrl($this->_helper->url('view', 'courses', null, array('catalog' => $this->_getParam('catalog'), 'course' => $courseIdString)));
			print "</link>";
			
			print "\n\t\t\t<guid isPermaLink='true'>";
			print $this->_helper->pathAsAbsoluteUrl($this->_helper->url('view', 'courses', null, array('catalog' => $this->_getParam('catalog'), 'course' => $courseIdString)));
			print "</guid>";
			
			print "\n\t\t\t<description><![CDATA[";
			print $course->getDescription();
			print "]]></description>";
			
			print "\n\t\t</item>";
		}
		
		print '
	</channel>
</rss>';

		exit;
	}
	
	
	/**
	 * Search for courses
	 * 
	 * @return void
	 * @access public
	 * @since 6/15/09
	 */
	public function topicxmlAction () {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		if (!$this->_getParam('catalog')) {
			header('HTTP/1.1 400 Bad Request');
			print "A catalog must be specified.";
			exit;
		}
		try {
			$catalogId = $this->_helper->osidId->fromString($this->_getParam('catalog'));
			$searchSession = $this->_helper->osid->getCourseManager()->getCourseSearchSessionForCatalog($catalogId);
			
			$this->termLookupSession = $this->_helper->osid->getCourseManager()->getTermLookupSessionForCatalog($catalogId);
		} catch (osid_InvalidArgumentException $e) {
			header('HTTP/1.1 400 Bad Request');
			print "The catalog id specified was not of the correct format.";
			exit;
		} catch (osid_NotFoundException $e) {
			header('HTTP/1.1 404 Not Found');
			print "The catalog id specified was not found.";
			exit;
		}
		
		if (!$this->_getParam('topic')) {
			header('HTTP/1.1 400 Bad Request');
			print "A topic must be specified.";
			exit;
		}
		
		$topicsIds = array();
		if (is_array($this->_getParam('topic'))) {
			foreach ($this->_getParam('topic') as $idString) {
				$topicIds[] = $this->_helper->osidId->fromString($idString);
			}
		} else {
			$topicIds[] = $this->_helper->osidId->fromString($this->_getParam('topic'));
		}
		
		$searchUrl = $this->_helper->pathAsAbsoluteUrl($this->_helper->url('search', 'offerings', null, array()));
		
		// Fetch courses
		$query = $searchSession->getCourseQuery();
		
		$topicRecord = $query->getCourseQueryRecord(new phpkit_type_URNInetType("urn:inet:middlebury.edu:record:topic"));
		foreach ($topicIds as $topicId) {
			$topicRecord->matchTopicId($topicId, true);
		}
		
		// Limit by location
		$locationIds = array();
		if (is_array($this->_getParam('location'))) {
			foreach ($this->_getParam('location') as $idString) {
				$locationIds[] = $this->_helper->osidId->fromString($idString);
			}
		} else if ($this->_getParam('location')) {
			$locationIds[] = $this->_helper->osidId->fromString($this->_getParam('location'));
		}
		$locationRecord = $query->getCourseQueryRecord(new phpkit_type_URNInetType("urn:inet:middlebury.edu:record:location"));
		foreach ($locationIds as $locationId) {
			$locationRecord->matchLocationId($locationId, true);
		}
		
		// Limit to just active courses
		$query->matchGenusType(new phpkit_type_URNInetType("urn:inet:middlebury.edu:status-active"), true);
		
		$courses = $searchSession->getCoursesByQuery($query);
		
		$topicLookup = $this->_helper->osid->getCourseManager()->getTopicLookupSession();
		$topicLookup->useFederatedCourseCatalogView();
		$topic = $topicLookup->getTopic($topicId);
		
		$recentCourses = new Helper_RecentCourses_Department($courses);
		$this->outputCourseFeed($recentCourses, htmlentities('Courses in  '.$topic->getDisplayName()), $searchUrl);
		
	}
	
	/**
	 * Search for courses
	 * 
	 * @return void
	 * @access public
	 * @since 6/15/09
	 */
	public function instructorxmlAction () {
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
		
		if (!$this->_getParam('catalog')) {
			$searchSession = $this->_helper->osid->getCourseManager()->getCourseSearchSession();
			$searchSession->useFederatedCourseCatalogView();
			$offeringSearchSession = $this->_helper->osid->getCourseManager()->getCourseOfferingSearchSession();
			$offeringSearchSession->useFederatedCourseCatalogView();
			
			// Allow term current/past to be limited to a certain catalog while courses are fetched from many
			if ($this->_getParam('term_catalog')) {
				$catalogId = $this->_helper->osidId->fromString($this->_getParam('term_catalog'));
				$this->termLookupSession = $this->_helper->osid->getCourseManager()->getTermLookupSessionForCatalog($catalogId);
			} 
			// fall back to terms from any catalog.
			else {
				$this->termLookupSession = $this->_helper->osid->getCourseManager()->getTermLookupSession();
				$this->termLookupSession->useFederatedCourseCatalogView();
			}
		} else {
			try {
				$catalogId = $this->_helper->osidId->fromString($this->_getParam('catalog'));
				$searchSession = $this->_helper->osid->getCourseManager()->getCourseSearchSessionForCatalog($catalogId);
				$offeringSearchSession = $this->_helper->osid->getCourseManager()->getCourseOfferingSearchSessionForCatalog($catalogId);
				
				$this->termLookupSession = $this->_helper->osid->getCourseManager()->getTermLookupSessionForCatalog($catalogId);
			} catch (osid_InvalidArgumentException $e) {
				throw new osid_InvalidArgumentException("The catalog id specified was not of the correct format.");
			} catch (osid_NotFoundException $e) {
				throw new osid_NotFoundException("The catalog id specified was not found.");
				exit;
			}
		}
		
		$instructor = trim($this->_getParam('instructor'));
		
		if (!$instructor || !strlen($instructor)) {
			// Make sure that this error response is cacheable.
			$this->setCacheControlHeaders();
			$this->getResponse()->sendHeaders();
			
			throw new InvalidArgumentException("An instructor must be specified.");
		}
		
		$instructorId = $this->_helper->osidId->fromString('resource/person/'.$instructor);
		$searchUrl = $this->_helper->pathAsAbsoluteUrl($this->_helper->url('view', 'resources', null, array('catalog' => $this->_getParam('catalog'), 'resource' => 'resouce/person/'.$instructor)));
		
		// Fetch courses
		$query = $searchSession->getCourseQuery();
		
		$instrctorRecord = $query->getCourseQueryRecord(new phpkit_type_URNInetType("urn:inet:middlebury.edu:record:instructors"));
		$instrctorRecord->matchInstructorId($instructorId, true);
		
		$courses = $searchSession->getCoursesByQuery($query);
		
		$resourceLookup = $this->_helper->osid->getCourseManager()->getResourceManager()->getResourceLookupSession();
		try {
			$instructorResource = $resourceLookup->getResource($instructorId);
		} catch (osid_NotFoundException $e) {
			// Make sure that this error response is cacheable.
			$this->setCacheControlHeaders();
			$this->getResponse()->sendHeaders();
			
			throw $e;
		}
		
		$recentCourses = new Helper_RecentCourses_Instructor($courses, $offeringSearchSession, $instructorId);
		$this->outputCourseFeed($recentCourses, 'Courses taught by '.$instructorResource->getDisplayName(), $searchUrl);
		
	}
	
	/**
	 * Output an RSS feed of courses from results
	 * 
	 * @param Helper_RecentCourses_Abstract $recentCourses
	 * @param string $title
	 * @param string $url
	 * @return void
	 * @access protected
	 * @since 10/19/09
	 */
	protected function outputCourseFeed (Helper_RecentCourses_Abstract $recentCourses, $title, $url) {		
		// Set our cache-control headers since we will be flushing content soon.
		$this->setCacheControlHeaders();
		$this->getResponse()->sendHeaders();
		
		// Close the session before we send headers and content.
		session_write_close();
		
		
		header('Content-Type: text/xml');
		print '<?xml version="1.0" encoding="utf-8" ?>
<rss version="2.0" xmlns:catalog="http://www.middlebury.edu/course_catalog">
	<channel>
		<title>'.htmlspecialchars($title).'</title>
		<link>'.$url.'</link>
		<description></description>
		<lastBuildDate>'.date('r').'</lastBuildDate>
		<generator>Course Catalog</generator>
		<docs>http://blogs.law.harvard.edu/tech/rss</docs>
		
';
		
		while (ob_get_level()) {
			ob_end_flush();
		}
		flush();

		// Set the next and previous terms
		$currentTermId = $this->_helper->osidTerms->getCurrentTermId($this->termLookupSession->getCourseCatalogId());
		$currentTerm = $this->termLookupSession->getTerm($currentTermId);
		$currentEndTime = $this->DateTime_getTimestamp($currentTerm->getEndTime());
		
// 		print "<description><![CDATA[";
// 		print ($courses->debug());
// 		print "]]></description>";
		
		$catalogSession = $this->_helper->osid->getCourseManager()->getCourseCatalogSession();
		$termsType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:record:terms");
		
// 		foreach ($groups as $key => $group) {
// 			print "\n$key";
// 			foreach ($group as $course) {
// 				print "\n\t".$this->_helper->osidId->toString($course->getId());
// 			}
// 		}
		
		foreach ($recentCourses->getPrimaryCourses() as $course) {
			$courseIdString = $this->_helper->osidId->toString($course->getId());
						
			print "\n\t\t<item>";
			
			print "\n\t\t\t<title>";
			$alternates = $recentCourses->getAlternatesForCourse($course);
			$name = $course->getDisplayName();
			foreach ($alternates as $alt) {
				$name .= ' / '. $alt->getDisplayName();
			}
			print htmlspecialchars($name.' - '.$course->getTitle());
			print "</title>";
			
			print "\n\t\t\t<link>";
			$catalog = $catalogSession->getCatalogIdsByCourse($course->getId());
			if ($catalog->hasNext())
				$catalogIdString = $this->_helper->osidId->toString($catalog->getNextId());
			else
				$catalogIdString = null;
			print $this->_helper->pathAsAbsoluteUrl($this->_helper->url('view', 'courses', null, array('catalog' => $catalogIdString, 'course' => $courseIdString)));
			print "</link>";
			
			print "\n\t\t\t<guid isPermaLink='true'>";
			print $this->_helper->pathAsAbsoluteUrl($this->_helper->url('view', 'courses', null, array('catalog' => $catalogIdString, 'course' => $courseIdString)));
			print "</guid>";
			
			print "\n\t\t\t<description><![CDATA[";
			print $course->getDescription();
			
			print "]]></description>";
			
			$recentTerms = $recentCourses->getTermsForCourse($course);
			if (count($recentTerms)) {
				$termStrings = array();
				foreach ($recentTerms as $term) {
					print "\n\t\t\t<catalog:term id=\"".$this->_helper->osidId->toString($term->getId())."\"";
					if ($term->getId()->isEqual($currentTermId)) {
						print ' type="current"';
					} else if ($currentEndTime < $this->DateTime_getTimestamp($term->getEndTime())) {
						print ' type="future"';
					} else {
						print ' type="past"';
					}
					print ">".$term->getDisplayName()."</catalog:term>";
				}
			}
			
			$allTopics = $this->_helper->topics->topicListAsArray($course->getTopics());
			$topicType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/department");
			$topicTypeString = $this->_helper->osidType->toString($topicType);
			$topics = $this->_helper->topics->filterTopicsByType($allTopics, $topicType);
			foreach ($topics as $topic) {
				$topicParams['topic'] = $this->_helper->osidId->toString($topic->getId());
				print "\n\t\t\t<catalog:topic type=\"".$topicTypeString."\" id=\"".$this->_helper->osidId->toString($topic->getId())."\" href=\"".$this->_helper->pathAsAbsoluteUrl($this->view->url($topicParams))."\">";
				print $this->view->escape($topic->getDisplayName());
				print "</catalog:topic> ";
			}
			
			$topicType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/requirement");
			$topicTypeString = $this->_helper->osidType->toString($topicType);
			$topics = $this->_helper->topics->filterTopicsByType($allTopics, $topicType);
			foreach ($topics as $topic) {
				$topicParams['topic'] = $this->_helper->osidId->toString($topic->getId());
				print "\n\t\t\t<catalog:topic type=\"".$topicTypeString."\" id=\"".$this->_helper->osidId->toString($topic->getId())."\" href=\"".$this->_helper->pathAsAbsoluteUrl($this->view->url($topicParams))."\">";
				print $this->view->escape($topic->getDisplayName());
				print "</catalog:topic> ";
			}
			
			$topicType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/level");
			$topicTypeString = $this->_helper->osidType->toString($topicType);
			$topics = $this->_helper->topics->filterTopicsByType($allTopics, $topicType);
			foreach ($topics as $topic) {
				$topicParams['topic'] = $this->_helper->osidId->toString($topic->getId());
				print "\n\t\t\t<catalog:topic type=\"".$topicTypeString."\" id=\"".$this->_helper->osidId->toString($topic->getId())."\" href=\"".$this->_helper->pathAsAbsoluteUrl($this->view->url($topicParams))."\">";
				print $this->view->escape($topic->getDisplayName());
				print "</catalog:topic> ";
			}
			
			print "\n\t\t</item>";
			flush();
		}
		
		print '
	</channel>
</rss>';
		exit;
	}
	
	/**
	 * Answer a list of all recent courses
	 * 
	 * @return void
	 * @access public
	 * @since 6/15/09
	 */
	public function allrecentcoursesAction () {
		$this->_helper->viewRenderer->setNoRender();
		
		if (!$this->_getParam('catalog')) {
			header('HTTP/1.1 400 Bad Request');
			print "A catalog must be specified.";
			exit;
		}
		try {
			$catalogId = $this->_helper->osidId->fromString($this->_getParam('catalog'));
			$this->courseSearchSession = $this->_helper->osid->getCourseManager()->getCourseSearchSessionForCatalog($catalogId);
			$this->offeringSearchSession = $this->_helper->osid->getCourseManager()->getCourseOfferingSearchSessionForCatalog($catalogId);

			$this->termLookupSession = $this->_helper->osid->getCourseManager()->getTermLookupSessionForCatalog($catalogId);
		} catch (osid_InvalidArgumentException $e) {
			header('HTTP/1.1 400 Bad Request');
			print "The catalog id specified was not of the correct format.";
			exit;
		} catch (osid_NotFoundException $e) {
			header('HTTP/1.1 404 Not Found');
			print "The catalog id specified was not found.";
			exit;
		}
		
		try {
			$this->selectedTerms = array();
			// Get all offerings in the terms
			foreach ($this->_getParam('term') as $termIdString) {
				$termId = $this->_helper->osidId->fromString($termIdString);
				$this->selectedTerms[] = $termId;
			}
		} catch (osid_InvalidArgumentException $e) {
			header('HTTP/1.1 400 Bad Request');
			print "The term id specified was not of the correct format.";
			exit;
		}
		
		$sections = array(
			
			array(	'type' => 'h1',		'text' => 'African American Studies Minor'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/catalog/afamer'),
			
			array(	'type' => 'h1',		'text' => 'African Studies Minor'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/catalog/afminor'),
			
			array(	'type' => 'h1',		'text' => 'American Studies'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/amst/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/AMST')),
			array(	'type' => 'h1',		'text' => 'Arabic'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/arabic/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/ARBC')),
			array(	'type' => 'h1',		'text' => 'Biology'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/bio/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/BIOL')),
			array(	'type' => 'h1',		'text' => 'Chemistry & Biochemistry'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/chem/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/CHEM')),
			array(	'type' => 'h1',		'text' => 'Chinese'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/chinese/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/CHNS')),
			array(	'type' => 'h1',		'text' => 'Classics & Classical Studies'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/clas/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/CLAS')),
			array(	'type' => 'h1',		'text' => 'Computer Science'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/cs/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/CSCI')),
			array(	'type' => 'h1',		'text' => 'Dance'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/dance/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/ARDV')),
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/DANC')),
			array(	'type' => 'h1',		'text' => 'Economics'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/econ/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/ECON')),
			array(	'type' => 'h1',		'text' => 'Education Studies'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/edst/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/EDST')),
			array(	'type' => 'h1',		'text' => 'English & American Literatures'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/enam/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/ENAM')),
			array(	'type' => 'h1',		'text' => 'Environmental Studies'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/es/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/ENVS')),
			array(	'type' => 'h1',		'text' => 'Film & Media Culture'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/fmmc/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/FMMC')),
			array(	'type' => 'h1',		'text' => 'First Year Seminars'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/fys/mission'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/FYSE')),
			array(	'type' => 'h1',		'text' => 'French'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/french/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/FREN')),
			array(	'type' => 'h1',		'text' => 'Geography'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/geog/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/GEOG')),
			array(	'type' => 'h1',		'text' => 'Geology'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/geol/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/GEOL')),
			array(	'type' => 'h1',		'text' => 'German'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/german/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/GRMN')),
			array(	'type' => 'h1',		'text' => 'History'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/hist/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/HIST')),
			array(	'type' => 'h1',		'text' => 'History of Art & Architecture'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/haa/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/HARC')),
			array(	'type' => 'h1',		'text' => 'Interdepartmental Courses'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/INTD')),
			array(	'type' => 'h1',		'text' => 'International Politics & Economics'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/ipe/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/IPEC')),
			array(	'type' => 'h1',		'text' => 'International Studies'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/is/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/subject/INTL')),
			array(	'type' => 'h1',		'text' => 'Italian'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/italian/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/ITAL')),
			array(	'type' => 'h1',		'text' => 'Japanese'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/japanese/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/JAPN')),
			array(	'type' => 'h1',		'text' => 'Linguistics'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/catalog/linguistics'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/subject/LNGT')),
			array(	'type' => 'h1',		'text' => 'Jewish Studies Minor'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/jewish'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/subject/HEBM')),
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/subject/HEBR')),
			array(	'type' => 'h1',		'text' => 'Literary Studies'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/lit/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/LITS')),
			array(	'type' => 'h1',		'text' => 'Literature Program'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/litp/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/LITP')),
			array(	'type' => 'h1',		'text' => 'Mathematics'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/math/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/MATH')),
			array(	'type' => 'h1',		'text' => 'Molecular Biology & Biochemistry'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/mbb/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/MBBC')),
			array(	'type' => 'h1',		'text' => 'Music'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/music/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/MUSC')),
			array(	'type' => 'h1',		'text' => 'Neuroscience'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/neuro/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/NSCI')),
			array(	'type' => 'h1',		'text' => 'Philosophy'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/phil/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/PHIL')),
			array(	'type' => 'h1',		'text' => 'Physics'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/physics/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/PHYS')),
			array(	'type' => 'h1',		'text' => 'Political Science'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/ps/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/PSCI')),
			array(	'type' => 'h1',		'text' => 'Psychology'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/psych/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/PSYC')),
			array(	'type' => 'h1',		'text' => 'Religion'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/rel/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/RELI')),
			array(	'type' => 'h1',		'text' => 'Russian'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/russian/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/RUSS')),
			array(	'type' => 'h1',		'text' => 'Sociology & Anthropology'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/soan/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/SOAN')),
			array(	'type' => 'h1',		'text' => 'South Asian Studies Minor'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/catalog/soasian'),
			
			array(	'type' => 'h1',		'text' => 'Spanish & Portuguese'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/span/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/SPAN')),
			array(	'type' => 'h1',		'text' => 'Studio Art'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/art/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/ART')),
			array(	'type' => 'h1',		'text' => 'Theatre'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/thea/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/THEA')),
			array(	'type' => 'h1',		'text' => "Women's and Gender Studies"),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/ws/requirements'),
			
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/WAGS')),
			array(	'type' => 'h1',		'text' => 'Writing Program'),
			array(	'type' => 'page_content',	'url' => 'http://www.middlebury.edu/academics/writing/writingrequirement'),
			array(	'type' => 'courses',		'id' => $this->_helper->osidId->fromString('topic/department/WRPR')),
		);
		
		
		header('Content-Type: text/html');
		header('Content-Disposition: filename="AllCourses.html"');
		print 
'<html>
<head>
	<title>Print Catalog</title>
	<style>
		br { mso-data-placement:same-cell; }
	</style>
</head>
<body>

';
		$this->printedCourseIds = array();
		foreach ($sections as $section) {
			switch ($section['type']) {
				case 'h1':
					print "\n<h1>".htmlspecialchars($section['text'])."</h1>";
					break;
				case 'h2':
					print "\n<h2>".htmlspecialchars($section['text'])."</h2>";
					break;
				case 'text':
					print "\n".$section['text']."";
					break;
				case 'page_content':
					print "\n\t";
					print $this->getRequirements($section['url']);
					break;
				case 'courses':
					$this->printCourses($section['id']);
					break;
				default:
					throw new Exception("Unknown section type ".$section['type']);
			}
			
			while (ob_get_level()) {
				ob_end_flush();
			}
			flush();
		}
		
		print "\n<hr/>";
		print "\n<h1>Courses not included</h1>";
		
		flush();
		
		// Get all Offerings for the selected terms
		$offeringQuery = $this->offeringSearchSession->getCourseOfferingQuery();
		foreach ($this->selectedTerms as $termId) {	
			$offeringQuery->matchTermId($termId, true);
		}
		$offerings = $this->offeringSearchSession->getCourseOfferingsByQuery($offeringQuery);
		// If the course Id wasn't printed, add it to a to-print array
		$coursesNotPrinted = array();
		while ($offerings->hasNext()) {
			$offering = $offerings->getNextCourseOffering();
			$courseIdString = $this->_helper->osidId->toString($offering->getCourseId());
			if (!in_array($courseIdString, $this->printedCourseIds)) {
				$coursesNotPrinted[$courseIdString] = $offering->getCourse();
			}
		}
		// Print a list of courses not printed
		ksort($coursesNotPrinted);
		foreach ($coursesNotPrinted as $course) {
			$this->printCourse($course);
		}
		
		print '

</body>
</html>
';
		exit;
	}
	
	/**
	 * Answer requirements text
	 * 
	 * @param $url
	 * @return string
	 * @access protected
	 * @since 4/26/10
	 */
	protected function getRequirements ($url) {
		$feedUrl = $url.'/feed';
		$feedDoc = new DOMDocument;
		$feedDoc->load($feedUrl);
		$xpath = new DOMXPath($feedDoc);
		$links = $xpath->query('/rss/channel/item/link');
		ob_start();
		foreach ($links as $link) {
			print $this->getNodeContent($link->nodeValue);
		}
		return ob_get_clean();
	}
	
	/**
	 * Answer the HTML data for a Drupal Node
	 * 
	 * @param string $url
	 * @return string
	 * @access protected
	 * @since 4/26/10
	 */
	protected function getNodeContent ($url) {
		preg_match('/[0-9]+$/', $url, $matches);
		$nodeId = $matches[0];
		
		// This is a nasty hack, but I don't know how to get through Drupal webservices currently.
		if (!isset($this->drupalStatement)) {
			$pdo = new PDO('mysql:dbname=afranco_drupal_MIDD;host=localhost', 'testuser', 'testpassword');
			$this->drupalStatement = $pdo->prepare('SELECT body FROM node_revisions WHERE nid = :nid1 and vid = (SELECT MAX(vid) AS vid FROM node_revisions WHERE nid = :nid2)');
		}
		
		$this->drupalStatement->execute(array(':nid1' => $nodeId, ':nid2' => $nodeId));
		$rows = $this->drupalStatement->fetchAll();
		return preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $rows[0]['body']); // Strip out none-printable characters.
	}
	
	/**
	 * Print out the courses for a topic
	 * 
	 * @param osid_id_Id $topicId
	 * @return void
	 * @access protected
	 * @since 4/26/10
	 */
	protected function printCourses (osid_id_Id $topicId) {
		try {
			$offeringQuery = $this->offeringSearchSession->getCourseOfferingQuery();
			$offeringQuery->matchTopicId($topicId, true);
			foreach ($this->selectedTerms as $termId) {	
				$offeringQuery->matchTermId($termId, true);
			}
			$offerings = $this->offeringSearchSession->getCourseOfferingsByQuery($offeringQuery);
		} catch (osid_NotFoundException $e) {
			header('HTTP/1.1 404 Not Found');
			print "The term ids specified were not found.";
			exit;
		}
		
		// Limit Courses to those offerings in the terms
		$query = $this->courseSearchSession->getCourseQuery();
		if ($offerings->hasNext()) {
			while ($offerings->hasNext()) {
				$query->matchCourseOfferingId($offerings->getNextCourseOffering()->getId(), true);
			}
		} else {
			return;
		}
		$search = $this->courseSearchSession->getCourseSearch();
		$order = $this->courseSearchSession->getCourseSearchOrder();
		$order->orderByDisplayName();
		$order->ascend();
		$search->orderCourseResults($order);
		$courses = $this->courseSearchSession->getCoursesBySearch($query, $search);
		
		$i = 0;
		while ($courses->hasNext()) {
			$course = $courses->getNextCourse();
			$i++;
			
			$courseIdString = $this->_helper->osidId->toString($course->getId());
			$this->printedCourseIds[] = $courseIdString;
			
			$this->printCourse($course);
			
// 			if ($i > 10)
// 				break;
		}
		
	}
	
	/**
	 * Print out a single course
	 * 
	 * @param osid_course_Course $course
	 * @return void
	 * @access protected
	 * @since 4/28/10
	 */
	protected function printCourse (osid_course_Course $course) {			
		$description = $course->getDescription();
		if (preg_match('#^<strong>([^\n\r]+)</strong>(?:\s*<br />(.*)|\s*)$#sm', $description, $matches)) {
			$title = $matches[1];
			if (isset($matches[2]))
				$description = trim($matches[2]);
			else
				$description = '';
		} else {
			$title = htmlspecialchars($course->getTitle());
		}
		
		$termsType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:record:terms");
		$termStrings = array();
		if ($course->hasRecordType($termsType)) {
			$termsRecord = $course->getCourseRecord($termsType);
			try {
				$terms = $termsRecord->getTerms();
				while ($terms->hasNext()) {
					$term = $terms->getNextTerm();
					// See if the term is in one of our chosen terms
					foreach ($this->selectedTerms as $selectedTermId) {
						if ($selectedTermId->isEqual($term->getId())) {
							$termStrings[] = $term->getDisplayName();
						}
					}
				}
			} catch (osid_OperationFailedException $e) {
			}
		}
		
		$allTopics = $this->_helper->topics->topicListAsArray($course->getTopics());

		$reqs = array();
		$topicType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/requirement");
		$topicTypeString = $this->_helper->osidType->toString($topicType);
		$topics = $this->_helper->topics->filterTopicsByType($allTopics, $topicType);
		foreach ($topics as $topic) {
			$reqs[] = $this->view->escape($topic->getDisplayName());
		}
		
		/*********************************************************
		 * Section descriptions
		 *********************************************************/
		// Look for different Section Descriptions
		$offeringQuery = $this->offeringSearchSession->getCourseOfferingQuery();
		$offeringQuery->matchCourseId($course->getId(), true);
		$offeringQuery->matchGenusType(new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:offering/LCT"), true);
		$offeringQuery->matchGenusType(new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:offering/SEM"), true);
		foreach ($this->selectedTerms as $termId) {	
			$offeringQuery->matchTermId($termId, true);
		}
		$order = $this->offeringSearchSession->getCourseOfferingSearchOrder();
		$order->orderByTerm();
		$order->ascend();
		$search = $this->offeringSearchSession->getCourseOfferingSearch();
		$search->orderCourseOfferingResults($order);
		$offerings = $this->offeringSearchSession->getCourseOfferingsBySearch($offeringQuery, $search);
		
		$sectionTerms = array();
		$sectionDescriptions = array();
		while ($offerings->hasNext()) {
			$offering = $offerings->getNextCourseOffering();
			if ($offering->getDescription() && $offering->getDescription() != $course->getDescription()) {
				$term = $offering->getTerm();
				$termIdString = $this->_helper->osidId->toString($term->getId());
				$sectionTerms[$termIdString] = $term->getDisplayName();
				$sectionDescriptions[$termIdString] = $offering->getDescription();
			}
		}
		
		$sectionDescriptionsText = '';
		// Replace the description with the one from the section if there is only one section.
		if (count($sectionDescriptions) == 1 && count($termStrings) == 1) {
			reset($sectionDescriptions);
			$description = current($sectionDescriptions);
			$description .= " <strong>".implode (", ", $reqs)."</strong>";
		}
		// If there are multiple section descriptions, print them separately
		else if (count($sectionDescriptions)) {
			$description = '';
			foreach ($sectionDescriptions as $i => $desc) {
				$description .= "\n\t<h3>".$sectionTerms[$i]."</h3>";
				$description .= "\n\t<p>".$desc;
				$description .= " <strong>".implode (", ", $reqs)."</strong>";
				$description .= "</p>";
			}
		} else {
			$description = "\n\t<p>".$description;
			$description .=  " <strong>".implode (", ", $reqs)."</strong>";
			$description .= "</p>";
		}
		
		/*********************************************************
		 * Output
		 *********************************************************/
		print "\n\t<h2>";
		print htmlspecialchars($course->getDisplayName());
		print " ".$title;
		print " (".implode(", ", $termStrings).")";
		print "</h2>";
		
		print $description;		
		
		/*********************************************************
		 * Crosslists
		 *********************************************************/
// 			$altNames = array();
// 			$alternateType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:record:terms");
// 			try {
// 				if ($course->hasRecordType($this->alternateType)) {
// 					$record = $course->getCourseRecord($this->alternateType);
// 					if ($record->hasAlternates()) {
// 						$alternates = $record->getAlternates();
// 						while ($alternates->hasNext()) {
// 							$alternate = $alternates->getNextCourse();
// 							
// 							$altInSelectedTerms = false;
// 							if ($alternate->hasRecordType($termsType)) {
// 								$termsRecord = $alternate->getCourseRecord($termsType);
// 								try {
// 									$terms = $termsRecord->getTerms();
// 									while ($terms->hasNext() && !$altInSelectedTerms) {
// 										$term = $terms->getNextTerm();
// 										// See if the term is in one of our chosen terms
// 										foreach ($this->selectedTerms as $selectedTermId) {
// 											if ($selectedTermId->isEqual($term->getId())) {
// 												$altInSelectedTerms = true;
// 												break;
// 											}
// 										}
// 									}
// 								} catch (osid_OperationFailedException $e) {
// 								}
// 							}
// 							if ($altInSelectedTerms)
// 								$altNames[] = htmlspecialchars($alternate->getDisplayName());
// 						}
// 					}
// 				}
// 				if (count($altNames)) {
// 					print "\n\t<p><strong>Crosslists:</strong> ";
// 					print implode(", ", $altNames);
// 					print "</p>";
// 				}
// 			} catch (osid_NotFoundException $e) {
// 			}			


		
		flush();
	}
	
	function DateTime_getTimestamp($dt) {
		$dtz_original = $dt -> getTimezone();
		$dtz_utc = new DateTimeZone("UTC");
		$dt -> setTimezone($dtz_utc);
		$year = intval($dt -> format("Y"));
		$month = intval($dt -> format("n"));
		$day = intval($dt -> format("j"));
		$hour = intval($dt -> format("G"));
		$minute = intval($dt -> format("i"));
		$second = intval($dt -> format("s"));
		$dt -> setTimezone($dtz_original);
		return gmmktime($hour,$minute,$second,$month,$day,$year);
	}
}

?>