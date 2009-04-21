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
	 * Print out a list of all courses
	 * 
	 * @return void
	 * @access public
	 * @since 4/21/09
	 */
	public function listAction () {
		if ($this->_getParam('catalog')) {
			$catalogId = self::getOsidIdFromString($this->_getParam('catalog'));
			$lookupSession = $this->getCourseManager()->getCourseLookupSessionForCatalog($catalogId);
			$this->view->title = 'Courses in '.$lookupSession->getCourseCatalog()->getDisplayName();
		} else {
			$lookupSession = $this->getCourseManager()->getCourseLookupSession();
			$lookupSession->useFederatedCourseCatalogView();
			$this->view->title = 'Courses in All Catalogs';
		}
		
		$this->view->courses = $lookupSession->getCourses();
		
		$this->view->headTitle($this->view->title);
	}
	
	/**
	 * View a catalog details
	 * 
	 * @return void
	 * @access public
	 * @since 4/21/09
	 */
	public function viewAction () {
		$id = self::getOsidIdFromString($this->_getParam('course'));
		$lookupSession = $this->getCourseManager()->getCourseLookupSession();
		$lookupSession->useFederatedCourseCatalogView();
		$this->view->course = $lookupSession->getCourse($id);
		
		$lookupSession = $this->getCourseManager()->getCourseOfferingLookupSession();
		$lookupSession->useFederatedCourseCatalogView();
		$this->view->offerings = $lookupSession->getCourseOfferingsForCourse($id);
		
		$this->view->title = $this->view->course->getDisplayName();
		$this->view->headTitle($this->view->title);
	}
	
}

?>