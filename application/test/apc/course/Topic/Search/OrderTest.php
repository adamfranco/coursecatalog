<?php

/**
 * Test class for banner_course_Topic_Search_OrderTest .
 * Generated by PHPUnit on 2009-04-23 at 13:53:35.
 */
class apc_course_Topic_Search_OrderTest extends banner_course_Topic_Search_OrderTest
{
    public static function setUpBeforeClass(): void
    {
        parent::setUpBeforeClass();
        self::$runtimeManager = new phpkit_AutoloadOsidRuntimeManager(realpath(dirname(__FILE__).'/../../../').'/configuration.plist');
        self::$courseManager = self::$runtimeManager->getManager(osid_OSID::COURSE(), 'apc_course_CourseManager', '3.0.0');
    }
}
