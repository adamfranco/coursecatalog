<?php

/**
 * Test class for banner_course_CourseOffering_Catalog_SessionTest .
 * Generated by PHPUnit on 2009-04-23 at 13:53:35.
 */
class apc_course_CourseOffering_Catalog_SessionTest
	extends banner_course_CourseOffering_Catalog_SessionTest
{

	public static function setUpBeforeClass()
	{
		self::$runtimeManager = new phpkit_AutoloadOsidRuntimeManager(realpath(dirname(__FILE__).'/../../../').'/configuration.plist');
		self::$courseManager = self::$runtimeManager->getManager(osid_OSID::COURSE(), 'apc_course_CourseManager', '3.0.0');
	}
}
