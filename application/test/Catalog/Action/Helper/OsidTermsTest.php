<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for Catalog_Action_Helper_OsidId.
 * Generated by PHPUnit on 2009-06-11 at 09:36:05.
 */
class Catalog_Action_Helper_OsidTermsTest extends PHPUnit_Framework_TestCase
{

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     *
     * @access protected
     */
    protected function setUp()
    {
    	$this->osidHelper = new Catalog_Action_Helper_Osid();
    	Zend_Controller_Action_HelperBroker::addHelper($this->osidHelper);
    	$this->osidIdHelper = new Catalog_Action_Helper_OsidId();
    	Zend_Controller_Action_HelperBroker::addHelper($this->osidIdHelper);
    	$this->osidTermsHelper = new Catalog_Action_Helper_OsidTerms();
    	Zend_Controller_Action_HelperBroker::addHelper($this->osidTermsHelper);
    	
    	$this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->spring2009TermId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200920');
        $this->fall2009TermId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200990');
        $this->fall2008TermId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200890');
        
        $this->termLookup = $this->osidHelper->getCourseManager()->getTermLookupSessionForCatalog($this->mcugId);
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     *
     * @access protected
     */
    protected function tearDown()
    {
    }

    /**
     * 
     */
    public function testGetCurrentTermId()
    {
        $this->assertType('osid_id_Id', $this->osidTermsHelper->getCurrentTermId($this->mcugId));
    }

    /**
     * 
     */
    public function testGetClosestTermId()
    {
        $testDate = new DateTime('2009-09-30');
        $terms = $this->termLookup->getTerms();
        $closestTermId = $this->osidTermsHelper->getClosestTermId($terms, $testDate);
        $this->assertTrue($closestTermId->isEqual($this->fall2009TermId));
        
    }
    
    /**
     * 
     */
    public function testGetClosestNonOverlappingTermIdA()
    {
        $testDate = new DateTime('2009-08-15');
        $terms = $this->termLookup->getTerms();
        $closestTermId = $this->osidTermsHelper->getClosestTermId($terms, $testDate);
        $this->assertTrue($closestTermId->isEqual($this->fall2009TermId));
        
    }
    
    /**
     * 
     */
    public function testGetClosestNonOverlappingTermIdB()
    {
        $testDate = new DateTime('2009-06-15');
        $terms = $this->termLookup->getTerms();
        $closestTermId = $this->osidTermsHelper->getClosestTermId($terms, $testDate);
        $this->assertTrue($closestTermId->isEqual($this->spring2009TermId));
        
    }
    
    /**
     * 
     */
    public function testGetClosestTermIdBeyondRange()
    {
        $testDate = new DateTime('2020-01-01');
        $terms = $this->termLookup->getTerms();
        $closestTermId = $this->osidTermsHelper->getClosestTermId($terms, $testDate);
        $this->assertTrue($closestTermId->isEqual($this->fall2009TermId));
        
    }
}
?>
