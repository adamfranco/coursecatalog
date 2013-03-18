<?php

/**
 * Test class for banner_course_Course_Catalog_Session.
 * Generated by PHPUnit on 2009-04-23 at 13:53:35.
 */
class banner_course_Course_Catalog_SessionTest 
	extends phpkit_test_phpunit_AbstractOsidSessionTest
{
    /**
     * @var    banner_course_CourseCatalog_Lookup_Session
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

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     *
     * @access protected
     */
    protected function setUp()
    {
        $this->manager = $this->sharedFixture['CourseManager'];
        $this->session = $this->manager->getCourseCatalogSession();
        
        $this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MIIS');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');
        
        $this->chemId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/CHEM0104');
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     *
     * @access protected
     */
    protected function tearDown()
    {
    	$this->session->close();
    }

    /**
     * @todo Implement testUseComparativeCourseCatalogView().
     */
    public function testUseComparativeCourseCatalogView()
    {
       $this->session->useComparativeCourseCatalogView();
       $courseIds = $this->session->getCourseIdsByCatalogs(new phpkit_id_ArrayIdList(array(
       					$this->mcugId,
       					$this->unknownId)));
       $this->assertEquals(4, $courseIds->available());
       
       $courses = $this->session->getCoursesByCatalogs(new phpkit_id_ArrayIdList(array(
       					$this->mcugId,
       					$this->unknownId)));
       $this->assertEquals(4, $courses->available());
    }

    /**
     * @todo Implement testUsePlenaryCourseCatalogView().
     */
    public function testUsePlenaryCourseCatalogView()
    {
       $this->session->usePlenaryCourseCatalogView();
       try {
	       $courseIds = $this->session->getCourseIdsByCatalogs(new phpkit_id_ArrayIdList(array(
    	   					$this->unknownId,
    	   					$this->mcugId
       						)));
	       $this->fail('Should have thrown an osid_NotFoundException');
	   } catch (osid_NotFoundException $e) {
	   }
	   
	   try {
	       $courses = $this->session->getCoursesByCatalogs(new phpkit_id_ArrayIdList(array(
    	   					$this->unknownId,
    	   					$this->mcugId
       						)));
	       $this->fail('Should have thrown an osid_NotFoundException');
	   } catch (osid_NotFoundException $e) {
	   }
    }

    /**
     * @todo Implement testCanLookupCourseCatalogMappings().
     */
    public function testCanLookupCourseCatalogMappings()
    {
        $this->assertTrue($this->session->canLookupCourseCatalogMappings());
    }

    /**
     * @todo Implement testGetCourseIdsByCatalog().
     */
    public function testGetCourseIdsByCatalog()
    {
       $courseIds = $this->session->getCourseIdsByCatalog($this->mcugId);
       $this->assertInstanceOf('osid_id_IdList', $courseIds);
       $this->assertEquals(4, $courseIds->available());
       $this->assertInstanceOf('osid_id_Id', $courseIds->getNextId());
    }

    /**
     * @todo Implement testGetCoursesByCatalog().
     */
    public function testGetCoursesByCatalog()
    {
       $courses = $this->session->getCoursesByCatalog($this->mcugId);
       $this->assertInstanceOf('osid_course_CourseList', $courses);
       $this->assertEquals(4, $courses->available());
       $this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
    }

    /**
     * @todo Implement testGetCourseIdsByCatalogs().
     */
    public function testGetCourseIdsByCatalogs()
    {
       $courseIds = $this->session->getCourseIdsByCatalogs(new phpkit_id_ArrayIdList(array(
       					$this->mcugId)));
       $this->assertInstanceOf('osid_id_IdList', $courseIds);
       $this->assertEquals(4, $courseIds->available());
       $this->assertInstanceOf('osid_id_Id', $courseIds->getNextId());
    }

    /**
     * @todo Implement testGetCoursesByCatalogs().
     */
    public function testGetCoursesByCatalogs()
    {
       $courses = $this->session->getCoursesByCatalogs(new phpkit_id_ArrayIdList(array(
       					$this->mcugId)));
       $this->assertInstanceOf('osid_course_CourseList', $courses);
       $this->assertEquals(4, $courses->available());
       $this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
    }

    /**
     * @todo Implement testGetCatalogIdsByCourse().
     */
    public function testGetCatalogIdsByCourse()
    {
        $catalogIds = $this->session->getCatalogIdsByCourse($this->chemId);
        $this->assertEquals(1, $catalogIds->available());
        $this->assertTrue($catalogIds->getNextId()->isEqual($this->mcugId));
    }

    /**
     * @todo Implement testGetCatalogsByCourse().
     */
    public function testGetCatalogsByCourse()
    {
        $catalogs = $this->session->getCatalogsByCourse($this->chemId);
        $this->assertEquals(1, $catalogs->available());
        $this->assertTrue($catalogs->getNextCourseCatalog()->getId()->isEqual($this->mcugId));
    }
}
?>
