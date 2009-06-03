<?php

require_once 'PHPUnit/Framework.php';

set_include_path(dirname(__FILE__) . PATH_SEPARATOR . get_include_path());

require_once(dirname(__FILE__).'/../autoload.php');

class TestSuite extends PHPUnit_Framework_TestSuite
{
	public static function suite()
    {
        $suite = new banner_TestSuite('banner');
        
        $suite->addTestSuite('banner_TestSuite');
        
        return $suite;
    }
    
    protected function setUp()
    {
    	
    }
 
    protected function tearDown()
    {

    }
}
?>