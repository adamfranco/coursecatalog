<?php

/**
 * Test class for banner_resource_Resource_Lookup_PerCatalogSessionTest.
 * Generated by PHPUnit on 2009-04-23 at 13:53:35.
 */
class apc_resource_Resource_Lookup_PerCatalogSessionTest extends banner_resource_Resource_Lookup_PerCatalogSessionTest
{
    public static function setUpBeforeClass(): void
    {
        parent::setUpBeforeClass();
        self::$runtimeManager = new phpkit_AutoloadOsidRuntimeManager(realpath(__DIR__.'/../../../').'/configuration.plist');
        self::$courseManager = self::$runtimeManager->getManager(osid_OSID::COURSE(), 'apc_course_CourseManager', '3.0.0');
    }
}
