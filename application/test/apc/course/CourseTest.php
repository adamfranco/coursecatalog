<?php

/**
 * Test class for banner_course_Course.
 * Generated by PHPUnit on 2009-04-15 at 13:36:26.
 */
class apc_course_CourseTest extends banner_course_CourseTest
{
    public static function setUpBeforeClass(): void
    {
        parent::setUpBeforeClass();
        self::$runtimeManager = new phpkit_AutoloadOsidRuntimeManager(realpath(dirname(__FILE__).'/../').'/configuration.plist');
        self::$courseManager = self::$runtimeManager->getManager(osid_OSID::COURSE(), 'apc_course_CourseManager', '3.0.0');
    }
}
