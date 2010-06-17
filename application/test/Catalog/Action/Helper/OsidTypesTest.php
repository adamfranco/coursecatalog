<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for Catalog_Action_Helper_OsidId.
 * Generated by PHPUnit on 2009-06-11 at 09:36:05.
 */
class Catalog_Action_Helper_OsidTypesTest extends PHPUnit_Framework_TestCase
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
    	$this->osidTypesHelper = new Catalog_Action_Helper_OsidTypes();
    	Zend_Controller_Action_HelperBroker::addHelper($this->osidTypesHelper);
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
    public function testGetDefaultGenusTypes()
    {
    	// Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }
}
?>