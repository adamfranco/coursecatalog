<?php

/**
 * Test class for banner_resource_ResourceManager.
 * Generated by PHPUnit on 2009-05-04 at 09:45:33.
 */
class apc_resource_ResourceManagerTest extends banner_resource_ResourceManagerTest
{
    public static function setUpBeforeClass(): void
    {
        parent::setUpBeforeClass();
        self::$runtimeManager = new phpkit_AutoloadOsidRuntimeManager(realpath(dirname(__FILE__).'/../').'/configuration.plist');
        self::$courseManager = self::$runtimeManager->getManager(osid_OSID::COURSE(), 'apc_course_CourseManager', '3.0.0');
    }
}
