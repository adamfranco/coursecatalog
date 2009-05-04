<?php
/**
 * @since 4/21/09
 * @package catalog.controllers
 * 
 * @copyright Copyright &copy; 2009, Middlebury College
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License (GPL)
 */ 

/**
 * A controller for working with resources
 * 
 * @since 4/21/09
 * @package catalog.controllers
 * 
 * @copyright Copyright &copy; 2009, Middlebury College
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License (GPL)
 */
class ResourcesController
	extends AbstractCatalogController
{
		
// 	/**
// 	 * Print out a list of all topics
// 	 * 
// 	 * @return void
// 	 * @access public
// 	 * @since 4/21/09
// 	 */
// 	public function listAction () {
// 		if ($this->_getParam('catalog')) {
// 			$catalogId = self::getOsidIdFromString($this->_getParam('catalog'));
// 			$lookupSession = self::getCourseManager()->getTopicLookupSessionForCatalog($catalogId);
// 			$this->view->title = 'Topics in '.$lookupSession->getCourseCatalog()->getDisplayName();
// 		} else {
// 			$lookupSession = self::getCourseManager()->getTopicLookupSession();
// 			$this->view->title = 'Topics in All Catalogs';
// 		}
// 		$lookupSession->useFederatedCourseCatalogView();
// 		
// 		$this->loadTopics($lookupSession->getTopics());
// 		
// 		$this->setSelectedCatalogId($lookupSession->getCourseCatalogId());
// 		$this->view->headTitle($this->view->title);
// 	}
	
	/**
	 * View a catalog details
	 * 
	 * @return void
	 * @access public
	 * @since 4/21/09
	 */
	public function viewAction () {
		$id = self::getOsidIdFromString($this->_getParam('resource'));
		$lookupSession = self::getCourseManager()->getResourceManager()->getResourceLookupSession();
		$lookupSession->useFederatedBinView();
		$this->view->resource = $lookupSession->getResource($id);
		
// 		$offeringSearchSession = self::getCourseManager()->getCourseOfferingSearchSession();
// 		$offeringSearchSession->useFederatedCourseCatalogView();
// 		if ($this->_getParam('term')) {
// 			$termId = self::getOsidIdFromString($this->_getParam('term'));
// 			$this->view->offerings = $offeringSearchSession->getCourseOfferingsByTermByTopic($termId, $id);
// 			
// 			$termLookupSession = self::getCourseManager()->getTermLookupSession();
// 			$termLookupSession->useFederatedCourseCatalogView();
// 			$this->view->term = $termLookupSession->getTerm($termId);
// 		} else {
// 			$this->view->offerings = $offeringSearchSession->getCourseOfferingsByTopic($id);
// 		}
		
		// Don't do the work to display instructors if we have a very large number of
		// offerings.
// 		if ($this->view->offerings->available() > 200)
// 			$this->view->hideOfferingInstructors = true;
		
		// Set the selected Catalog Id.
		if ($this->_getParam('catalog')) {
			$this->setSelectedCatalogId(self::getOsidIdFromString($this->_getParam('catalog')));
		}
		
		// Set the title
		$this->view->title = $this->view->resource->getDisplayName();
		$this->view->headTitle($this->view->title);
		
		$this->view->offeringsTitle = "Sections";
		
// 		$allParams = array();
// 		$allParams['topic'] = $this->_getParam('topic');
// 		if ($this->getSelectedCatalogId())
// 			$allParams['catalog'] = self::getStringFromOsidId($this->getSelectedCatalogId());
// 		$this->view->offeringsForAllTermsUrl = $this->_helper->url('view', 'topics', null, $allParams);
// 		
//  		$this->render('offerings', null, true);
	}
	
}

?>