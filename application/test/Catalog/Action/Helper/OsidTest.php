<?php

use PHPUnit\Framework\TestCase;

/**
 * Test class for AbstractCatalogController.
 * Generated by PHPUnit on 2009-06-11 at 09:36:05.
 */
class Catalog_Action_Helper_OsidTest extends TestCase
{

	/**
	 * Sets up the fixture, for example, opens a network connection.
	 * This method is called before a test is executed.
	 *
	 * @access protected
	 */
	protected function setUp(): void
	{
		$this->osidHelper = new Catalog_Action_Helper_Osid();
		Zend_Controller_Action_HelperBroker::addHelper($this->osidHelper);
	}

	/**
	 * Tears down the fixture, for example, closes a network connection.
	 * This method is called after a test is executed.
	 *
	 * @access protected
	 */
	protected function tearDown(): void
	{
	}

	/**
	 *
	 */
	public function testGetCourseManager()
	{
		$this->assertInstanceOf('osid_course_CourseManager', $this->osidHelper->getCourseManager());
	}

	/**
	 *
	 */
	public function testGetRuntimeManager()
	{
		$this->assertInstanceOf('osid_OsidRuntimeManager', $this->osidHelper->getRuntimeManager());
	}
}
