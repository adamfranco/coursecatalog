<?php

/**
 * Test class for banner_course_CourseCatalog.
 * Generated by PHPUnit on 2009-04-15 at 15:42:30.
 */
class apc_course_CourseCatalogTest 
	extends banner_course_CourseCatalogTest
{

	public static function setUpBeforeClass() 
	{
		self::$runtimeManager = new phpkit_AutoloadOsidRuntimeManager(realpath(dirname(__FILE__).'/../').'/configuration.plist');
		self::$courseManager = self::$runtimeManager->getManager(osid_OSID::COURSE(), 'apc_course_CourseManager', '3.0.0');
	}
}
