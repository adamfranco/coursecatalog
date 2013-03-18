<?php

/**
 * Test class for banner_course_Term_Catalog_Session.
 * Generated by PHPUnit on 2009-04-29 at 16:55:23.
 */
class banner_course_Term_Catalog_SessionTest
	extends PHPUnit_Framework_TestCase
{
    /**
     * @var    banner_course_CourseOfferingCatalogLookupSession
     * @access protected
     */
    protected $session;
    
    protected $mcugId;
    protected $miisId;

	/**
	 * Answer the session object to test
	 * 
	 * @return osid_OsidSession
	 * @access protected
	 * @since 4/15/09
	 */
	protected function getSession () {
		return $this->session;
	}
	
	static $runtimeManager;
	static $courseManager;

	public static function setUpBeforeClass() 
	{
		self::$runtimeManager = new phpkit_AutoloadOsidRuntimeManager(realpath(dirname(__FILE__).'/../../../').'/configuration.plist');
		self::$courseManager = self::$runtimeManager->getManager(osid_OSID::COURSE(), 'banner_course_CourseManager', '3.0.0');
	}

	public static function tearDownAfterClass()
	{
	    self::$courseManager->shutdown();
	    self::$runtimeManager->shutdown();
	}

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     *
     * @access protected
     */
    protected function setUp()
    {
        $this->session = self::$courseManager->getTermCatalogSession();
        
        $this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MIIS');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');
        
        $this->termId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200890');
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
    public function testUseComparativeTermCatalogView()
    {
       $this->session->useComparativeTermCatalogView();
       $termIds = $this->session->getTermIdsByCatalogs(new phpkit_id_ArrayIdList(array(
       					$this->mcugId,
       					$this->unknownId)));
       $this->assertInstanceOf('osid_id_IdList', $termIds);
       $this->assertEquals(13, $termIds->available());
       $this->assertInstanceOf('osid_id_Id', $termIds->getNextId());
    }

    /**
     * @expectedException osid_NotFoundException
     */
    public function testUsePlenaryTermCatalogView()
    {
    	$this->session->usePlenaryTermCatalogView();
        $termIds = $this->session->getTermIdsByCatalogs(new phpkit_id_ArrayIdList(array(
       					$this->mcugId,
       					$this->unknownId)));
    }

    /**
     * @todo Implement testCanLookupTermCatalogMappings().
     */
    public function testCanLookupTermCatalogMappings()
    {
        $this->assertTrue($this->session->canLookupTermCatalogMappings());
    }

    /**
     * @todo Implement testGetTermIdsByCatalog().
     */
    public function testGetTermIdsByCatalog()
    {
       $termIds = $this->session->getTermIdsByCatalog($this->mcugId);
       $this->assertInstanceOf('osid_id_IdList', $termIds);
       $this->assertEquals(13, $termIds->available());
       $this->assertInstanceOf('osid_id_Id', $termIds->getNextId());
    }

    /**
     * @todo Implement testGetTermsByCatalog().
     */
    public function testGetTermsByCatalog()
    {
       $terms = $this->session->getTermsByCatalog($this->mcugId);
       $this->assertInstanceOf('osid_course_TermList', $terms);
       $this->assertEquals(13, $terms->available());
       $this->assertInstanceOf('osid_course_Term', $terms->getNextTerm());
    }

    /**
     * @todo Implement testGetTermIdsByCatalogs().
     */
    public function testGetTermIdsByCatalogs()
    {
       $termIds = $this->session->getTermIdsByCatalogs(new phpkit_id_ArrayIdList(array(
       					$this->mcugId)));
       $this->assertInstanceOf('osid_id_IdList', $termIds);
       $this->assertEquals(13, $termIds->available());
       $this->assertInstanceOf('osid_id_Id', $termIds->getNextId());
    }

    /**
     * @todo Implement testGetTermsByCatalogs().
     */
    public function testGetTermsByCatalogs()
    {
       $terms = $this->session->getTermsByCatalogs(new phpkit_id_ArrayIdList(array(
       					$this->mcugId)));
       $this->assertInstanceOf('osid_course_TermList', $terms);
       $this->assertEquals(13, $terms->available());
       $this->assertInstanceOf('osid_course_Term', $terms->getNextTerm());
    }

    /**
     * @todo Implement testGetCatalogIdsByTerm().
     */
    public function testGetCatalogIdsByTerm()
    {
        $catalogIds = $this->session->getCatalogIdsByTerm($this->termId);
        $this->assertEquals(1, $catalogIds->available());
        $this->assertTrue($catalogIds->getNextId()->isEqual($this->mcugId));
    }

    /**
     * @todo Implement testGetCatalogsByTerm().
     */
    public function testGetCatalogsByTerm()
    {
        $catalogs = $this->session->getCatalogsByTerm($this->termId);
        $this->assertEquals(1, $catalogs->available());
        $this->assertTrue($catalogs->getNextCourseCatalog()->getId()->isEqual($this->mcugId));
    }
}
?>
