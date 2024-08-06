<?php

use PHPUnit\Framework\TestCase;

/**
 * Test class for Catalog_Action_Helper_OsidId.
 * Generated by PHPUnit on 2009-06-11 at 09:36:05.
 */
class Catalog_Action_Helper_OsidTypeTest extends TestCase
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
		$this->osidIdHelper = new Catalog_Action_Helper_OsidId();
		Zend_Controller_Action_HelperBroker::addHelper($this->osidIdHelper);
		$this->osidTypeHelper = new Catalog_Action_Helper_OsidType();
		Zend_Controller_Action_HelperBroker::addHelper($this->osidIdHelper);
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
	public function testGetOsidTypeFromString()
	{
		$type = new phpkit_type_Type('urn', 'example.edu', '123456789/abcd');
		$typeString = $this->osidTypeHelper->toString($type);

		$newType = $this->osidTypeHelper->fromString($typeString);
		$this->assertInstanceOf('osid_type_Type', $newType);
		$this->assertTrue($type->isEqual($newType));
	}

	/**
	 *
	 */
	public function testGetStringFromOsidType()
	{
		$type = new phpkit_type_Type('urn', 'example.edu', '123456789/abcd');
		$typeString = $this->osidTypeHelper->toString($type);
		$this->assertInternalType('string', $typeString);

		$newType = $this->osidTypeHelper->fromString($typeString);
		$this->assertEquals($typeString, $this->osidTypeHelper->toString($newType));
	}
}
