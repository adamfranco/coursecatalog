<?php
/**
 * @since 8/23/17
 * @package catalog.controllers
 *
 * @copyright Copyright &copy; 2017, Middlebury College
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License (GPL)
 */

 include_once("fsmparserclass.inc.php");

/**
 * A controller for working with courses
 *
 * @since 8/23/17
 * @package catalog.controllers
 *
 * @copyright Copyright &copy; 2017, Middlebury College
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License (GPL)
 */
 class ArchiveController
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
		$this->alternateInTermsType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:record:alternates-in-terms");
		$this->identifiersType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:banner_identifiers');

		parent::init();
		$this->_helper->layout()->setLayout('midd_archive');

		// Store an HTTP client configuration for later use.
		$this->httpClientConfig = [
			'maxredirects' => 10,
			'timeout'      => 30,
		];
	}

	/**
	 * Print out a list of all courses
	 *
	 * @return void
	 * @access public
	 * @since 4/21/09
	 */
	public function indexAction () {
		$config = Zend_Registry::getInstance()->config;
		$request = $this->getRequest();
		if (empty($config->catalog->archive_root)) {
			throw new Exception('Invalid configuration: catalog.archive_root must be defined.');
		}
		$archive_root = $config->catalog->archive_root;
		// Relative paths should be relative to our installation directory.
		if (!preg_match('#^/#', $archive_root)) {
			$archive_root = BASE_PATH .'/'.$archive_root;
		}
		$archive_root = realpath($archive_root);
		if (!$archive_root) {
			throw new Exception('Invalid configuration: catalog.archive_root is invalid.');
		}
		$target = $archive_root.'/'.$request->getParam('path');
		// Verify that our target file is really in our root and not trying to
		// access other parts of our file-system or remote URLs.
		$target = realpath($target);
		if (!$target) {
			throw new InvalidArgumentException('The target path is invalid.');
		}
		if (strpos($target, $archive_root) !== 0) {
			throw new InvalidArgumentException('The target path must be located within catalog.archive_root.');
		}

		$this->view->children = array();
		$url = rtrim('archive/'.$request->getParam('path'), '/');
		foreach (scandir($target) as $file) {
			if (!preg_match('/^\./', $file)) {
				if (!empty($config->catalog->archive_folder_aliases->$file)) {
					$label = $config->catalog->archive_folder_aliases->$file;
				} else {
					$label = $file;
				}
				if (is_dir($target.'/'.$file)) {
					$label .= '/';
				}
				$this->view->children[$this->view->baseUrl($url.'/'.$file)] = $label;
			}
		}

		$this->view->breadcrumb = array();
		$url = 'archive';
		$this->view->breadcrumb[$this->view->baseUrl($url)] = 'Catalog Archives';
		foreach (explode('/', $request->getParam('path')) as $dir) {
			if (!empty($dir)) {
				$url .= '/'.$dir;
				if (!empty($config->catalog->archive_folder_aliases->$dir)) {
					$label = $config->catalog->archive_folder_aliases->$dir;
				} else {
					$label = $dir;
				}
				$this->view->breadcrumb[$this->view->baseUrl($url)] = $label;
			}
		};
	}

	/**
	 * View a catalog details
	 *
	 * @return void
	 * @access public
	 * @since 4/21/09
	 */
	public function viewAction () {
		$tmp = error_reporting();
		error_reporting(0);
		$config = Zend_Registry::getInstance()->config;
		$request = $this->getRequest();
		if (empty($config->catalog->archive_root)) {
			throw new Exception('Invalid configuration: catalog.archive_root must be defined.');
		}
		$archive_root = $config->catalog->archive_root;
		// Relative paths should be relative to our installation directory.
		if (!preg_match('#^/#', $archive_root)) {
			$archive_root = BASE_PATH .'/'.$archive_root;
		}
		$archive_root = realpath($archive_root);
		if (!$archive_root) {
			throw new Exception('Invalid configuration: catalog.archive_root is invalid.');
		}
		$target = $archive_root.'/'.$request->getParam('path').'/'.$request->getParam('file');
		// Verify that our target file is really in our root and not trying to
		// access other parts of our file-system or remote URLs.
		$target = realpath($target);
		if (!$target) {
			throw new InvalidArgumentException('The target path is invalid.');
		}
		if (strpos($target, $archive_root) !== 0) {
			throw new InvalidArgumentException('The target path must be located within catalog.archive_root.');
		}

		$doc = new DOMDocument();
		libxml_use_internal_errors(true); // Don't print errors related to HTML5 enties.
		$doc->loadHTML(file_get_contents($target));
		libxml_use_internal_errors(false);
		$xpath = new DOMXPath($doc);
		$this->view->headTitle($xpath->query('/html/head/title')->item(0)->nodeValue);
		foreach ($xpath->query('/html/body')->item(0)->childNodes as $node) {
			$this->view->body .= $doc->saveHTML($node);
		}

		$this->view->breadcrumb = array();
		$url = 'archive';
		$this->view->breadcrumb[$this->view->baseUrl($url)] = 'Catalog Archives';
		foreach (explode('/', $request->getParam('path')) as $dir) {
			$url .= '/'.$dir;
			if (!empty($config->catalog->archive_folder_aliases->$dir)) {
				$label = $config->catalog->archive_folder_aliases->$dir;
			} else {
				$label = $dir;
			}
			$this->view->breadcrumb[$this->view->baseUrl($url)] = $label;
		};
		$url .= '/'.$request->getParam('file');
		$this->view->breadcrumb[$this->view->baseUrl($url)] = pathinfo($request->getParam('file'), PATHINFO_FILENAME);
		error_reporting($tmp);
	}

	/**
	 * Export a single archive export job.
	 *
	 * @return void
	 * @access public
	 * @since 1/23/18
	 */
	public function exportjobAction() {
		$request = $this->getRequest();
		if (!$request->getParam('dest_dir')) {
			header('HTTP/1.1 400 Bad Request');
			print "A dest_dir must be specified.";
			exit;
		}
		if (!$request->getParam('config_id')) {
			header('HTTP/1.1 400 Bad Request');
			print "A config_id must be specified.";
			exit;
		}
		if (!$request->getParam('term')) {
			header('HTTP/1.1 400 Bad Request');
			print "Terms must be specified.";
			exit;
		}
		if (!$request->getParam('revision_id')) {
			header('HTTP/1.1 400 Bad Request');
			print "A revision_id must be specified.";
			exit;
		}

		$this->_helper->layout()->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		// Send a first byte to any clients/proxies to avoid timeouts.
		print "Beginning export...\n";
		while (ob_get_level()) {
			ob_end_flush();
		}
		flush();
		$this->_helper->exportJob($request->getParam('dest_dir'), $request->getParam('config_id'), $request->getParam('term'), $request->getParam('revision_id'));
		print "Export complete.\n";
	}

	/**
	 * Report progress of export job
	 *
	 * @return void
	 * @access public
	 * @since 2/5/18
	 */
	public function jobprogressAction() {
		$db = Zend_Registry::get('db');
		$query =
		"SELECT
			progress
		 FROM archive_export_progress";
		$stmt = $db->prepare($query);
		$stmt->execute();
		$progress = $stmt->fetch();
		echo $progress['progress'];

		$this->_helper->layout()->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);
	}

	/**
	 * Export a single archive export job from the command line.
	 *
	 * @return void
	 * @access public
	 * @since 1/26/18
	 */
	public function exportsinglejobAction() {
		$request = $this->getRequest();
		if (!$request->getParam('id')) {
			header('HTTP/1.1 400 Bad Request');
			print "A job id must be specified.";
			exit;
		}

		$this->_helper->layout()->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$db = Zend_Registry::get('db');
		$query =
		"SELECT
			*
		 FROM archive_jobs
		 WHERE id = ?";
		$stmt = $db->prepare($query);
		$stmt->execute(array($request->getParam('id')));
		$job = $stmt->fetch();

		// Revision is set to 'latest'
		if (!$job['revision_id']) {
			$query =
			"SELECT
				id
			 FROM archive_configuration_revisions a
			 INNER JOIN (
				SELECT
					arch_conf_id,
					MAX(last_saved) as latest
				FROM archive_configuration_revisions
				GROUP BY arch_conf_id
			) b ON a.arch_conf_id = b.arch_conf_id and a.last_saved = b.latest
			 WHERE a.arch_conf_id = ?";
			$stmt = $db->prepare($query);
			$stmt->execute(array($job['config_id']));
			$latestRevision = $stmt->fetch();
			$job['revision_id'] = $latestRevision['id'];
		}

		$job['terms'] = explode(',', $job['terms']);
		array_walk($job['terms'], function(&$value, $key) { $value = 'term/' . $value; } );

		$this->_helper->exportJob($job['export_path'], $job['config_id'], $job['terms'], $job['revision_id']);
	}

	/**
	 * Export all 'active' archive export jobs.
	 *
	 * @return void
	 * @access public
	 * @since 1/23/18
	 */
	public function exportactivejobsAction() {
		$this->_helper->layout()->disableLayout();
		$this->_helper->viewRenderer->setNoRender(true);

		$request = $this->getRequest();

		if($request->getParam('verbose')) {
			$verbose = '1';
		} else $verbose = '0';

		$db = Zend_Registry::get('db');
		$jobs = $db->query("SELECT * FROM archive_jobs WHERE active=1")->fetchAll();

		foreach($jobs as $job) {
			$terms = explode(",", $job['terms']);
			foreach($terms as &$term) {
				$term = "term/" . $term;
			}
			unset($term);

			if ($job['revision_id'] === NULL) {
				$revision = 'latest';
			} else {
				$revision = $job['revision_id'];
			}

			if ($verbose) {
				file_put_contents('php://stderr', 'Beginning export: '.$job['config_id'].' '.$job['export_path'].' '.$job['terms'].' '.$revision . "\n");
			}

			$this->_helper->exportJob($job['export_path'], $job['config_id'], $terms, $revision, $verbose);
		}
	}


	/**
	 * Answer a list of all recent courses
	 *
	 * @return void
	 * @access public
	 * @since 6/15/09
	 */
	public function generateAction () {
		$request = $this->getRequest();

		if (!$request->getParam('config_id')) {
			header('HTTP/1.1 400 Bad Request');
			print "A configId must be specified.";
			exit(1);
		}
		if (!$request->getParam('term')) {
			header('HTTP/1.1 400 Bad Request');
			print "A term must be specified.";
			exit(2);
		}
		if (!$request->getParam('revision_id')) {
			header('HTTP/1.1 400 Bad Request');
			print "A revisionId must be specified.";
			exit(3);
		}


		$config = Zend_Registry::getInstance()->config;
		// Test for a password if we aren't run from the command-line to prevent
		// overloading.
		if (PHP_SAPI != 'cli') {
			if ($config->catalog->print_password && !$request->getParam('password')) {
				header('HTTP/1.1 400 Bad Request');
				print "A password must be specified.";
				exit(4);
			}
			if ($config->catalog->print_password && $request->getParam('password') != $config->catalog->print_password) {
				header('HTTP/1.1 400 Bad Request');
				print "Invalid password specified.";
				exit(4);
			}
		}

		if ($config->catalog->print_max_exec_time)
			ini_set('max_execution_time', $config->catalog->print_max_exec_time);

		// Write status updates to db.
		$db = Zend_Registry::get('db');
		$query = "SELECT * FROM archive_export_progress";
		$stmt = $db->prepare($query);
		$stmt->execute();
		$jobs = $stmt->fetchAll();

		// Check that the previous export is still running.
		if (!empty($jobs)) {
			$delete = $db->prepare('DELETE FROM archive_export_progress WHERE pid = ?');
			// Remove completed jobs.
			if ($jobs[0]['progress'] == 'Export finished') {
				$delete->execute([$jobs[0]['pid']]);
			}
			// Remove failed jobs.
			elseif (posix_getpgid($jobs[0]['pid']) === false) {
				$delete->execute([$jobs[0]['pid']]);
				file_put_contents('php://stderr', "Removing failed export job. PID ".$jobs[0]['pid']." last recorded a status of: ".$jobs[0]['progress']."\n");
			}
			else {
				// Don't allow user to run more than one job at once.
				file_put_contents('php://stderr', "Another job with PID ".$jobs[0]['pid']." is already running and has status: ".$jobs[0]['progress']."\n");
				exit;
			}
		}

		// Record our PID and status.
		$query = "INSERT INTO archive_export_progress (pid, progress) VALUES (?, ?);";
		$stmt = $db->prepare($query);
		$stmt->execute([getmypid(), 'Loading job info from db...']);
		// Prepare our update statement.
		$progressUpdateStmt = $db->prepare("UPDATE archive_export_progress SET progress = ? WHERE pid = ?");

		try {
			$query = "SELECT catalog_id FROM archive_configurations WHERE id = ?";
			$stmt = $db->prepare($query);
			$stmt->execute(array($request->getParam('config_id')));
			$conf = $stmt->fetch();
			$catalogId = $this->_helper->osidId->fromString($conf['catalog_id']);
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
			$term_strings = array();
			// Get all offerings in the terms
			foreach ($request->getParam('term') as $termIdString) {
				$term_strings[] = $termIdString;
				$termId = $this->_helper->osidId->fromString($termIdString);
				$this->selectedTerms[] = $termId;
			}
			sort($term_strings);
			$this->startTerm = $this->_helper->osidId->fromString($term_strings[0]);
			$this->endTerm = $this->_helper->osidId->fromString(array_values(array_slice($term_strings, -1))[0]);
		} catch (osid_InvalidArgumentException $e) {
			header('HTTP/1.1 400 Bad Request');
			print "The term id specified was not of the correct format.";
			exit;
		}

		// Increase the timeout when loading requirements documents:
		if (!empty($config->catalog->archive->requirements_fetch_timeout)) {
			$this->httpClientConfig['timeout'] = $config->catalog->archive->requirements_fetch_timeout;
		}
		$sections = array();
		if ($request->getParam('revision_id') === 'latest') {
			$query =
			"SELECT
				*
			 FROM archive_configuration_revisions a
			 INNER JOIN (
				SELECT
					arch_conf_id,
					MAX(last_saved) as latest
				FROM archive_configuration_revisions
				GROUP BY arch_conf_id
			) b ON a.arch_conf_id = b.arch_conf_id and a.last_saved = b.latest
			 WHERE a.arch_conf_id = ?";
			$stmt = $db->prepare($query);
			$stmt->execute(array($request->getParam('config_id')));
		} else {
			$query =
			"SELECT
				*
			 FROM archive_configuration_revisions
			 WHERE id = ?";
			$stmt = $db->prepare($query);
			$stmt->execute(array($request->getParam('revision_id')));
		}
		$revision = $stmt->fetch();
		$jsonData = json_decode($revision['json_data']);

		$totalSections = count($jsonData);
		$currentSection = 1;
		foreach($jsonData as $group) {
			foreach($group as $entry) {
				if (gettype($entry) === 'object') {
					$section = array();
					foreach($entry as $sectionKey => $sectionValue) {
						if ($sectionKey === 'type') {
							$section['type'] = $sectionValue;
						} else {
							switch($section['type']) {
								case 'h1':
								case 'h2':
									$vals = explode(';', $sectionValue);
									if(sizeOf($vals) > 1) {
										$section['text'] = $vals[0];
										$section['toc_text'] = $vals[1];
									} else {
										$section['text'] = $sectionValue;
									}
									break;
								case 'toc':
									$section['toc_text'] = $sectionValue;
									break;
								case 'page_content':
									$section['url'] = $sectionValue;
									break;
								case 'custom_text':
									// TODO - Unify naming of this type with export config UI.
									$section['type'] = 'html';
									$section['text'] = $sectionValue;
									$section['text'] = str_replace("\n", "<br>", $section['text']);
									break;
								case 'course_list':
									$section['type'] = 'courses';
									// Check if course filters are included.
									if (strpos($sectionValue, ",")) {
										$filters = substr($sectionValue, strpos($sectionValue, ",") + 1);
										$filters = explode(",", $filters);
										$adjustedFilters = '';
										foreach($filters as $filter) {
											$adjustedFilters .= $filter . "|";
										}
										// strip trailing |
										$adjustedFilters = substr($adjustedFilters, 0, -1);
										$sectionValue = substr($sectionValue, 0, strpos($sectionValue, ","));
										$section['number_filter'] = "/(" . $adjustedFilters . ")/";
									} else {
										$section['number_filter'] = null;
									}
									$section['id'] = $this->_helper->osidId->fromString($sectionValue);
									break;
								default:
									throw new InvalidArgumentException("Section type is invalid: " . $section['type']);
									break;
							}
						}
					}
					$currentSection++;
					$sections[] = $section;
				}
			}
		}

		$title = 'Course Catalog - ';
		$title .= $this->courseSearchSession->getCourseCatalog()->getDisplayName();
		$termNames = array();
		foreach ($this->selectedTerms as $termId) {
			$termNames[] = $this->termLookupSession->getTerm($termId)->getDisplayName();
		}
		if (count($termNames)) {
			$title .= ' - '.implode(', ', $termNames);
		}
		$this->view->title = $title;
		$this->view->headTitle($title);
		$this->view->sections = $sections;

		$totalSections = count($sections);
		$currentSection = 1;
		foreach ($this->view->sections as $key => &$section) {
			if ($request->getParam('verbose')) {
				$text = '';
				if (!empty($section['text'])) {
					$text = $section['text'];
				} else if (!empty($section['url'])) {
					$text = $section['url'];
				}else if (!empty($section['id'])) {
					$text = $this->_helper->osidId->toString($section['id']);
				}
				file_put_contents('php://stderr',str_pad($section['type'].': ', 15, ' ', STR_PAD_RIGHT).$text."\n");
			}
			$progressUpdateStmt->execute([
				'Printing section ' . $currentSection . ' of ' . $totalSections . ' (' . $section['type'] . ' ' . $text . ' )...',
				getmypid(),
			]);
			switch ($section['type']) {
				case 'h1':
				case 'toc':
				case 'h2':
					break;
				case 'text':
					break;
				case 'html':
					$section['text'] = banner_course_Course::convertDescription($section['text']);
					break;
				case 'page_content':
					$section['content'] = $this->getRequirements($section['url']);
					break;
				case 'courses':
					$section['courses'] = $this->getCourses($section['id'], $section['number_filter']);
					break;
				default:
					throw new Exception("Unknown section type ".$section['type']);
			}

			$progressUpdateStmt->execute([
				'Printed section ' . $currentSection . ' of ' . $totalSections . '(' . $section['type'] . ' ' . $text . ')',
				getmypid(),
			]);
			$currentSection++;
		}

		$progressUpdateStmt->execute([
			'Export finished',
			getmypid(),
		]);

		$this->_helper->layout()->setLayout('minimal');
	}

	/**
	 * Answer requirements text
	 *
	 * @param $url
	 * @return string
	 * @access protected
	 */
	protected function getRequirements($url) {
		// D9 URL, don't bother with RSS attempt.
		if (preg_match('#^https://www\.middlebury\.edu/(college|institute)/#', $url)) {
			try {
				return $this->getRequirementsFromD9Html($url);
			}
			catch (Exception $e) {
				return $e->getMessage();
			}
		}
		// D7 URL (might redirect to D9)
		else {
			try {
				try {
					return $this->getRequirementsFromD7Rss($url);
				}
				catch (RequirementNotXmlException $e) {
					return $this->getRequirementsFromD9Html($url);
				}
			}
			catch (Exception $e) {
				return $e->getMessage();
			}
		}
	}

	/**
	 * Answer requirements text
	 *
	 * @param $url
	 * @return string
	 * @access protected
	 */
	protected function getRequirementsFromD7Rss ($url) {
		$feedUrl = $url.'/feed';
		$client = $this->getHttpClient();
		$client->setUri($feedUrl);
		$response = $client->request();
		if ($response->getStatus() != 200) {
			throw new RequirementRequestFailedException('Received a non-success status for requirements RSS feed (' . $response->getStatus() . ') at ' . $feedUrl, $response->getStatus());
		}
		if (!preg_match('#^(text|application)/(xml|rss\+xml)($|;)#', $response->getHeader('Content-Type'))) {
			throw new RequirementNotXmlException('Received a non-xml Content-Type for requirements RSS (' . $response->getHeader('Content-Type') . ') at  ' . $feedUrl);
		}
		$feedDoc = new DOMDocument;
		$feedDoc->loadXml($response->getBody());
		$xpath = new DOMXPath($feedDoc);
		$descriptions = $xpath->query('/rss/channel/item/description');
		ob_start();
		foreach ($descriptions as $description) {
			$body = $description->nodeValue;
			// Parse the HTML
			$html = new DOMDocument();
			// Force the HTML snippet to be interpreted as UTF-8 as that is what Drupal
			// is returning. Without this prefix, the snippet will be assumed to be
			// ISO-8859-1. See: https://stackoverflow.com/a/8218649/15872
			$html->loadHTML('<?xml encoding="utf-8" ?>' . $body);
			$htmlXPath = new DOMXPath($html);
			// Only print out the inner-HTML of the body fields, excluding taxonomy
			// terms and any other fields printed. Note that this is dependent
			// on the Drupal markup and will need to be updated if that changes.
			$bodies = $htmlXPath->query('//div[contains(@class, "field-name-body")]/div/div');
			if ($bodies->length) {
				foreach ($bodies as $domBody) {
					foreach ($domBody->childNodes as $child) {
						print $html->saveHTML($child);
					}
				}
			}
			// If we don't have any bodies or the markup changes, just use the full text.
			else {
				print $html->saveHTML();
			}

		}
		return ob_get_clean();
	}

	/**
	 * Answer requirements text
	 *
	 * @param $url
	 * @return string
	 * @access protected
	 */
	protected function getRequirementsFromD9Html ($url) {
		$client = $this->getHttpClient();
		$client->setUri($url);
		$response = $client->request();
		if ($response->getStatus() != 200) {
			throw new RequirementRequestFailedException('Received a non-success status for requirements page (' . $response->getStatus() . ') at  ' . $url, $response->getStatus());
		}
		if (!preg_match('#^text/html($|;)#', $response->getHeader('Content-Type'))) {
			throw new RequirementNotXmlException('Received a non-HTML Content-Type for requirements page (' . $response->getHeader('Content-Type') . ') at  ' . $url);
		}
		$feedDoc = new DOMDocument;
		$feedDoc->encoding = 'utf-8';
		libxml_use_internal_errors(true);
		$feedDoc->loadHTML($response->getBody());
		libxml_clear_errors();
		$xpath = new DOMXPath($feedDoc);
		ob_start();
		// Only print out the inner-HTML of the body fields, excluding taxonomy
		// terms and any other fields printed. Note that this is dependent
		// on the Drupal markup and will need to be updated if that changes.
		$bodies = $xpath->query('//div[contains(@class, "paragraphs")]/div');
		if ($bodies->length) {
			foreach ($bodies as $domBody) {
				foreach ($domBody->childNodes as $child) {
					print $feedDoc->saveHTML($child);
				}
			}
		}
		return ob_get_clean();
	}

	/**
	 * Print out the courses for a topic
	 *
	 * @param osid_id_Id $topicId
	 * @param optional string $number_filter A regular expression to filter out courses on.
	 * @return void
	 * @access protected
	 * @since 4/26/10
	 */
	protected function getCourses (osid_id_Id $topicId, $number_filter = null) {
		$topic_courses = array();
		$offeringQuery = $this->offeringSearchSession->getCourseOfferingQuery();
		$offeringQuery->matchTopicId($topicId, true);
		foreach ($this->selectedTerms as $termId) {
			$offeringQuery->matchTermId($termId, true);
		}
		$offerings = $this->offeringSearchSession->getCourseOfferingsByQuery($offeringQuery);

		// Limit Courses to those offerings in the terms
		$query = $this->courseSearchSession->getCourseQuery();
		if ($offerings->hasNext()) {
			while ($offerings->hasNext()) {
				$query->matchCourseOfferingId($offerings->getNextCourseOffering()->getId(), true);
			}
		} else {
			return array();
		}
		$search = $this->courseSearchSession->getCourseSearch();
		$order = $this->courseSearchSession->getCourseSearchOrder();
		$order->orderByNumber();
		$order->ascend();
		$search->orderCourseResults($order);
		$courses = $this->courseSearchSession->getCoursesBySearch($query, $search)->getCourses();

		$i = 0;
		while ($courses->hasNext()) {
			$course = $courses->getNextCourse();
			$i++;

			// Filter out courses by number if needed.
			if (!empty($number_filter) && preg_match($number_filter, $course->getNumber())) {
				continue;
			}

			$courseIdString = $this->_helper->osidId->toString($course->getId());
			$this->printedCourseIds[] = $courseIdString;

			$topic_courses[] = $this->getCourseData($course);

// 			if ($i > 10)
// 				break;
		}
		return $topic_courses;
	}

	/**
	 * Print out a single course
	 *
	 * @param osid_course_Course $course
	 * @return void
	 * @access protected
	 * @since 4/28/10
	 */
	protected function getCourseData (osid_course_Course $course) {
		$data = new stdClass();
		$data->id = $this->_helper->osidId->toString($course->getId());
		$data->anchor = str_replace('/','_', $data->id);
		$data->sections = array();
		$data->display_name = $course->getDisplayName();
		$data->description = $course->getDescription();

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
							$termStrings[$this->_helper->osidId->toString($term->getId())] = $term->getDisplayName();
						}
					}
				}
			} catch (osid_OperationFailedException $e) {
			}
		}
		$data->term_strings = $termStrings;

		/*********************************************************
		 * Section descriptions
		 *********************************************************/
		// Look for different Section Descriptions
		$offeringQuery = $this->offeringSearchSession->getCourseOfferingQuery();
		$offeringQuery->matchCourseId($course->getId(), true);
		$offeringQuery->matchGenusType(new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:offering/LCT"), true);
		$offeringQuery->matchGenusType(new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:offering/SEM"), true);
		$offeringQuery->matchGenusType(new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:offering/IND"), true);
		foreach ($this->selectedTerms as $termId) {
			$offeringQuery->matchTermId($termId, true);
		}
		$order = $this->offeringSearchSession->getCourseOfferingSearchOrder();
		$order->orderByTerm();
		$order->ascend();
		$search = $this->offeringSearchSession->getCourseOfferingSearch();
		$search->orderCourseOfferingResults($order);
		$offerings = $this->offeringSearchSession->getCourseOfferingsBySearch($offeringQuery, $search);

		// each offering (section) may have the same or different title and description from other sections
		// of the course. Group the sections by title/description and term so that
		// any differences are properly represented while condensing as much as possible.
		$sectionData = array();
		$courseDescriptionHash = sha1($course->getDescription());
		$allCourseInstructors = array();
		$allSectionDescriptions = array();
		$allSectionRequirementTopics = array();

		$instructorsType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:instructors');
		$identifiersType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:banner_identifiers');
		$namesType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:person_names');
		$requirementType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/requirement");
		$enrollmentNumbersType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:enrollment_numbers');
		while ($offerings->hasNext()) {
			$offering = $offerings->getNextCourseOffering();
			$term = $offering->getTerm();
			$termIdString = $this->_helper->osidId->toString($term->getId());
			if (!isset($sectionData[$termIdString])) {
				$sectionData[$termIdString] = array(
					'label' => $term->getDisplayName(),
					'sections' => array(),
					'req_seats' => [],
					'total_seats' => 0,
				);
			}
			if (!isset($allCourseInstructors[$termIdString])) {
				$allCourseInstructors[$termIdString] = array(
					'label' => $term->getDisplayName(),
					'instructors' => array(),
				);
			}
			if ($offering->getDescription() && $offering->getDescription() != $course->getDescription()) {
				$sectionDescriptionHash = sha1($offering->getDescription());
				$sectionDescription = $offering->getDescription();
			} else {
				$sectionDescriptionHash = $courseDescriptionHash;
				$sectionDescription = $course->getDescription();
			}
			$allSectionDescriptions[$sectionDescriptionHash] = $sectionDescription;
			if (!isset($sectionData[$termIdString]['sections'][$sectionDescriptionHash])) {
				$sectionData[$termIdString]['sections'][$sectionDescriptionHash] = array(
					'description' => $sectionDescription,
					'instructors' => array(),
					'section_numbers' => array(),
					'requirements' => array(),
					'total_seats' => 0,
				);
			}
			if ($offering->hasRecordType($identifiersType)) {
				$identifiersRecord = $offering->getCourseOfferingRecord($identifiersType);
				$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['section_numbers'][] = $identifiersRecord->getSequenceNumber();
			}
			// Add the number of seats.
			if ($offering->hasRecordType($enrollmentNumbersType)) {
				$enrollmentNumbersRecord = $offering->getCourseOfferingRecord($enrollmentNumbersType);
				$sectionData[$termIdString]['total_seats'] += $enrollmentNumbersRecord->getMaxEnrollment();
				$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['total_seats'] += $enrollmentNumbersRecord->getMaxEnrollment();

				// If the offering has no enrollment and isn't the primary
				// of a cross-listed pair, use the data from the primary
				// section.
				if ($enrollmentNumbersRecord->getMaxEnrollment() == 0 && $offering->hasRecordType($this->alternateType)) {
					$offeringAlternateRecord = $offering->getCourseOfferingRecord($this->alternateType);
					if ($offeringAlternateRecord->hasAlternates() && !$offeringAlternateRecord->isPrimary()) {
						$primaryAlternate = $this->_getPrimaryAlternate($offering);
						if ($primaryAlternate && $primaryAlternate->hasRecordType($enrollmentNumbersType)) {
							$primaryEnrollmentNumbersRecord = $primaryAlternate->getCourseOfferingRecord($enrollmentNumbersType);

							$sectionData[$termIdString]['total_seats'] += $primaryEnrollmentNumbersRecord->getMaxEnrollment();
							$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['total_seats'] += $primaryEnrollmentNumbersRecord->getMaxEnrollment();
						}
					}
				}
			}
			// Build an array of requirements for each offering description in case we need to print them separately.
			$topics = $offering->getTopics();
			while ($topics->hasNext()) {
				$topic = $topics->getNextTopic();
				$topicId = $topic->getId();
				$topicIdString = $this->_helper->osidId->toString($topic->getId());
				if ($requirementType->isEqual($topic->getGenusType())) {
					$allSectionRequirementTopics[] = $topic;
					if (!isset($sectionData[$termIdString]['sections'][$sectionDescriptionHash]['requirements'][$topicIdString])) {
						$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['requirements'][$topicIdString] = [
							'label' => $topic->getDisplayName(),
							'total_seats' => 0,
							'term_seats' => [
								$termIdString => [
									'term_label' => $term->getDisplayName(),
									'seats' => 0,
								],
							],
						];
					}
					// Associate the number of seats for each requirement.
					if ($offering->hasRecordType($enrollmentNumbersType)) {
						$enrollmentNumbersRecord = $offering->getCourseOfferingRecord($enrollmentNumbersType);
						if (!isset($sectionData[$termIdString]['req_seats'][$topicIdString])) {
							$sectionData[$termIdString]['req_seats'][$topicIdString] = 0;
						}
						$sectionData[$termIdString]['req_seats'][$topicIdString] += $enrollmentNumbersRecord->getMaxEnrollment();
						$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['requirements'][$topicIdString]['total_seats'] += $enrollmentNumbersRecord->getMaxEnrollment();
						$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['requirements'][$topicIdString]['term_seats'][$termIdString]['seats'] += $enrollmentNumbersRecord->getMaxEnrollment();

						// If the offering has no enrollment and isn't the primary
						// of a cross-listed pair, use the data from the primary
						// section.
						if ($enrollmentNumbersRecord->getMaxEnrollment() == 0 && $offering->hasRecordType($this->alternateType)) {
							$offeringAlternateRecord = $offering->getCourseOfferingRecord($this->alternateType);
							if ($offeringAlternateRecord->hasAlternates() && !$offeringAlternateRecord->isPrimary()) {
								$primaryAlternate = $this->_getPrimaryAlternate($offering);
								$primaryAlternateHasTopic = false;
								if ($primaryAlternate) {
									$primaryAlternateTopicIds = $primaryAlternate->getTopicIds();
									while ($primaryAlternateTopicIds->hasNext()) {
										if ($topicId->isEqual($primaryAlternateTopicIds->getNextId())) {
											$primaryAlternateHasTopic = true;
											break;
										}
									}
								}
								// Only add the enrollment of the primary cross-listed section
								// if it has the topic at hand.
								if ($primaryAlternateHasTopic && $primaryAlternate->hasRecordType($enrollmentNumbersType)) {
									$primaryEnrollmentNumbersRecord = $primaryAlternate->getCourseOfferingRecord($enrollmentNumbersType);

									$sectionData[$termIdString]['req_seats'][$topicIdString] += $primaryEnrollmentNumbersRecord->getMaxEnrollment();
									$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['requirements'][$topicIdString]['total_seats'] += $primaryEnrollmentNumbersRecord->getMaxEnrollment();
									$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['requirements'][$topicIdString]['term_seats'][$termIdString]['seats'] += $primaryEnrollmentNumbersRecord->getMaxEnrollment();
								}
							}
						}
					}
				}
			}
			if ($offering->hasRecordType($instructorsType)) {
				$instructorsRecord = $offering->getCourseOfferingRecord($instructorsType);
				$instructors = $instructorsRecord->getInstructors();
				while($instructors->hasNext()) {
					$instructor = $instructors->getNextResource();
					$instructorIdString = $this->_helper->osidId->toString($instructor->getId());
					$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['instructors'][$instructorIdString] = $instructor->getDisplayName();
					$allCourseInstructors[$termIdString]['instructors'][$instructorIdString] = $sectionData[$termIdString]['sections'][$sectionDescriptionHash]['instructors'][$instructorIdString];
					if ($instructor->hasRecordType($namesType)) {
						$nameRecord = $instructor->getResourceRecord($namesType);
						$sectionData[$termIdString]['sections'][$sectionDescriptionHash]['instructors'][$instructorIdString] = substr($nameRecord->getGivenName(), 0, 1).'. '.$nameRecord->getSurname();
						$allCourseInstructors[$termIdString]['instructors'][$instructorIdString] = $sectionData[$termIdString]['sections'][$sectionDescriptionHash]['instructors'][$instructorIdString];
					}
				}
			}
		}
		$data->instructors = $this->getInstructorText($allCourseInstructors);
		// Don't show an instructor list for "0500" "Independent Study" courses.
		if (preg_match('/0500$/', $course->getNumber())) {
			$data->instructors = '';
		}

		// Requirements-fullfilled data structure:
		// - Course-level reqs apply to all sections unless some, but not all specify the req.
		// - Sections may have additional reqs.
		//
		//	[
		//		total_seats => INT,		# The total number of seats in the course
		//
		//		req_seats => INT,		# The number of seats that fullfill this req.
		//								# By definition this will equal total_seats
		//								# for course-level reqs.
		//
		//		term_seats => [			# The number of seats for this req, broken out by term.
		//
		//			term_label => STR,	# Label for the term.
		//
		//			total_seats => INT,	# The total number of seats in this term.
		//
		//			req_seats => INT,	# The number of seats that fullfill this req.
		//								# By definition this will equal total_seats
		//								# for course-level reqs.
		//		]
		// ]

		// Apply all course-level topics.
		$allTopics = $this->_helper->topics->topicListAsArray($course->getTopics());
		$reqs = array();
		$topicType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/requirement");
		$topicTypeString = $this->_helper->osidType->toString($topicType);
		$topics = $this->_helper->topics->filterTopicsByType($allTopics, $topicType);
		foreach ($topics as $topic) {
			$topicIdString = $this->_helper->osidId->toString($topic->getId());
			$req = [
				'label' => $topic->getDisplayName(),
				'total_seats' => 0,
				'req_seats' => 0,
				'term_seats' => [],
			];
			// Add up the total number of seats for the course
			foreach ($sectionData as $termIdString => $term) {
				$req['term_seats'][$termIdString] = [
					'term_label' => $term['label'],
					'total_seats' => $term['total_seats'],
					'req_seats' => $term['total_seats'],
				];
				$req['total_seats'] += $term['total_seats'];
				if (isset($term['req_seats'][$topicIdString])) {
					$req['req_seats'] += $term['req_seats'][$topicIdString];
				}
			}
			$reqs[$topicIdString] = $req;
		}

		// Add requirements that are only present on some offerings.
		foreach ($allSectionRequirementTopics as $topic) {
			$topicIdString = $this->_helper->osidId->toString($topic->getId());
			// Overwrite the course-level values if we have this requirement specified
			// per-section.
			$req = [
				'label' => $topic->getDisplayName(),
				'total_seats' => 0,
				'req_seats' => 0,
				'term_seats' => [],
			];
			foreach ($sectionData as $termIdString => $term) {
				$req['term_seats'][$termIdString] = [
					'term_label' => $term['label'],
					'total_seats' => $term['total_seats'],
					'req_seats' => 0,
				];
				$req['total_seats'] += $term['total_seats'];
				if (isset($term['req_seats'][$topicIdString])) {
					$req['term_seats'][$termIdString]['req_seats'] += $term['req_seats'][$topicIdString];
					$req['req_seats'] += $term['req_seats'][$topicIdString];
				}
			}
			$reqs[$topicIdString] = $req;
		}

		ksort($reqs);
		$data->requirements = $reqs;

		$sectionDescriptionsText = '';
		// Replace the description with the one from the section[s] if there is only one section description and it is
		// different from the course.
		if (count($allSectionDescriptions) == 1 && key($allSectionDescriptions) != $courseDescriptionHash) {
			$data->description = current($allSectionDescriptions);
		}
		// If there are multiple section descriptions, print them separately
		else if (count($allSectionDescriptions) > 1) {
			foreach ($sectionData as $termId => $termSectionData) {
				$term_data = new stdClass;
				$term_data->idString = $termId;
				$term_data->label = $termSectionData['label'];
				$term_data->req_seats = $termSectionData['req_seats'];
				$term_data->total_seats = $termSectionData['total_seats'];
				$data->terms[] = $term_data;
				foreach ($termSectionData['sections'] as $hash => $section) {
					$section_data = new stdClass;
					$section_data->description = $section['description'];
					$section_data->requirements = $section['requirements'];
					if (count($termSectionData['sections']) > 1) {
						$section_data->section_numbers = $section['section_numbers'];
					} else {
						$section_data->section_numbers = array();
					}
					if (count($section['instructors'])) {
						$section_data->instructors = '('.implode(', ', $section['instructors']).')';
					} else {
						$section_data->instructors = '';
					}
					// Don't show an instructor list for "INTD 0500" courses other than section-C.
					if (preg_match('/^INTD\s*0500$/', $course->getNumber()) && $section['section_numbers'] != ['C']) {
						$section_data->instructors = '';
					}
					$term_data->sections[] = $section_data;
				}
			}
		}

		// Look for a longer title that exceeds the limits of the Banner title field
		// injected into the description as a bold first line.
		if (preg_match('#^<strong>([^\n\r]+)</strong>(?:\s*<br />(.*)|\s*)$#sm', $data->description, $matches)) {
			// Decode entities in the title to ensure they don't get double-encoded.
			$data->title = html_entity_decode($matches[1]);
			if (isset($matches[2]))
				$data->description = trim($matches[2]);
			else
				$data->description = '';
		} else {
			$data->title = $course->getTitle();
		}

		/*********************************************************
		 * Crosslists
		 *********************************************************/
		$data->alternates = array();
		try {
			if ($course->hasRecordType($this->alternateInTermsType)) {
				$record = $course->getCourseRecord($this->alternateInTermsType);
				if ($record->hasAlternatesInTerms($this->startTerm, $this->endTerm)) {
					$alternates = $record->getAlternatesInTerms($this->startTerm, $this->endTerm);
					while ($alternates->hasNext()) {
						$alternate = $alternates->getNextCourse();

						$altInSelectedTerms = false;
						if ($alternate->hasRecordType($termsType)) {
							$termsRecord = $alternate->getCourseRecord($termsType);
							try {
								$terms = $termsRecord->getTerms();
								while ($terms->hasNext() && !$altInSelectedTerms) {
									$term = $terms->getNextTerm();
									// See if the term is in one of our chosen terms
									foreach ($this->selectedTerms as $selectedTermId) {
										if ($selectedTermId->isEqual($term->getId())) {
											$altInSelectedTerms = true;
											break;
										}
									}
								}
							} catch (osid_OperationFailedException $e) {
							}
						}
						if ($altInSelectedTerms) {
							$alt_data = new stdClass();
							$alt_data->display_name = $alternate->getDisplayName();
							$alt_data->id = $this->_helper->osidId->toString($alternate->getId());
							$alt_data->anchor = str_replace('/','_', $alt_data->id);
							if ($alternate->hasRecordType($this->alternateType)) {
								$alt_record = $alternate->getCourseRecord($this->alternateType);
								$alt_data->is_primary = $alt_record->isPrimary();
							}
							$data->alternates[] = $alt_data;
						}
					}
				}
			}
		} catch (osid_NotFoundException $e) {
		}

		return $data;
	}

	/**
	 * Answer an instructor listing string
	 *
	 * @param array $sectionInstructors
	 * @param string $termIdString
	 * @return string
	 */
	protected function getInstructorText (array $sectionInstructors, $termIdString = null) {
		if (empty($sectionInstructors))
			return '';
		foreach ($sectionInstructors as $termId => &$termInfo) {
			$ids = array_keys($termInfo['instructors']);
			sort($ids);
			$termInfo['hash'] = implode(':', $ids);
			$termInfo['instructorString'] = implode(', ', $termInfo['instructors']);
		}

		// Use just the instructors of the term passed.
		if ($termIdString) {
			if (empty($sectionInstructors[$termIdString]['instructorString']))
				return '';
			else
				return '('.$sectionInstructors[$termIdString]['instructorString'].')';
		}

		// For a course with just a single term, use that term's instructors
		if (count($sectionInstructors) === 1) {
			reset($sectionInstructors);
			$info = current($sectionInstructors);
			if (empty($info['instructorString']))
				return '';
			else
				return '('.$info['instructorString'].')';
		}

		// For courses with multiple terms, first find out if the instructor list is always the same.
		reset($sectionInstructors);
		$firstTerm = current($sectionInstructors);
		$firstHash = $firstTerm['hash'];
		$instructorListConstant = true;
		foreach ($sectionInstructors as $termId => $info) {
			if ($info['hash'] != $firstHash)
				$instructorListConstant = false;
		}
		// If we have the same instructor list each term, just use the first string.
		if ($instructorListConstant) {
			if (empty($firstTerm['instructorString']))
				return '';
			else
				return '('.$firstTerm['instructorString'].')';
		}
		// If we have a different instructor list each term, identify them.
		else {
			$termStrings = array();
			foreach ($sectionInstructors as $termId => $info) {
				if (!empty($info['instructorString']))
					$termStrings[] = $info['label'].': '.$info['instructorString'];
			}
			return '('.implode('; ', $termStrings).')';
		}
	}

	function _textToLink($text) {
		return preg_replace('/[^a-z0-9.:]+/i', '-', $text);
	}

	function _getPrimaryAlternate(osid_course_CourseOffering $offering) {
		$primary = null;
		if (!$offering->hasRecordType($this->alternateType)) {
			return null;
		}
		$baseSequenceNumber = null;
		if ($offering->hasRecordType($this->identifiersType)) {
			$baseIdentifiersRecord = $offering->getCourseOfferingRecord($this->identifiersType);
			$baseSequenceNumber = $baseIdentifiersRecord->getSequenceNumber();
		}
		$baseAlternateRecord = $offering->getCourseOfferingRecord($this->alternateType);
		$alternates = $baseAlternateRecord->getAlternates();
		while ($alternates->hasNext()) {
			$alternateOffering = $alternates->getNextCourseOffering();
			$identifiersRecord = null;
			if ($alternateOffering->hasRecordType($this->identifiersType)) {
				$identifiersRecord = $alternateOffering->getCourseOfferingRecord($this->identifiersType);
			}
			if ($alternateOffering->hasRecordType($this->alternateType)) {
				$offeringAlternateRecord = $alternateOffering->getCourseOfferingRecord($this->alternateType);
				if ($offeringAlternateRecord->isPrimary()) {
					$primary = $alternateOffering;

					// Also check the sequence number on the off chance that we
					// have multiple primaries designated. If not we'll default to any primary found.
					if ($identifiersRecord && $baseSequenceNumber == $identifiersRecord->getSequenceNumber()) {
						return $alternateOffering;
					}
				}
			}
		}
		return $primary;
	}

	protected function getHttpClient() {
		$client = new Zend_Http_Client();
		$client->setConfig($this->httpClientConfig);
		return $client;
	}

}

class RequirementRequestFailedException extends Exception { }

class RequirementNotXmlException extends Exception { }
