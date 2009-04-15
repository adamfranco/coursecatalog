<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for banner_course_CourseCatalogLookupSession.
 * Generated by PHPUnit on 2009-04-15 at 10:58:33.
 */
class banner_course_CourseCatalogLookupSessionTest 
	extends phpkit_test_phpunit_AbstractSessionTest
{
    /**
     * @var    banner_course_CourseCatalogLookupSession
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
        $this->session = $this->manager->getCourseCatalogLookupSession();
        
        $this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MIIS');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');
        
        $this->unknownType = new phpkit_type_URNInetType("urn:inet:osid.org:unknown_type");
    	
        $this->generaNoneType = new phpkit_type_URNInetType("urn:inet:osid.org:genera:none");
        $this->secondaryType = new phpkit_type_URNInetType("urn:inet:osid.org:genera:secondary");
        $this->undergraduateType = new phpkit_type_URNInetType("urn:inet:osid.org:genera:undergraduate");
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
     * Should drop unknown results from the list
     */
    public function testUseComparativeCourseCatalogView()
    {
       $this->session->useComparativeCourseCatalogView();
       $catalogs = $this->session->getCourseCatalogsByIds(new phpkit_id_ArrayIdList(array(
       					$this->mcugId,
       					$this->miisId,
       					$this->unknownId)));
       $this->assertEquals(2, $catalogs->available());
    }

    /**
     * Should thrown osid_NotFoundExceptions for unknown results.
     * @expectedException osid_NotFoundException
     */
    public function testUsePlenaryCourseCatalogView()
    {
       $this->session->usePlenaryCourseCatalogView();
       $catalogs = $this->session->getCourseCatalogsByIds(new phpkit_id_ArrayIdList(array(
       					$this->mcugId,
       					$this->miisId,
       					$this->unknownId)));
       $this->assertEquals(2, $catalogs->available());
    }

    /**
     * @todo Implement testCanLookupCourseCatalog().
     */
    public function testCanLookupCourseCatalog()
    {
        $this->assertTrue($this->session->canLookupCourseCatalog());
    }

    /**
     * @todo Implement testGetCourseCatalog().
     */
    public function testGetCourseCatalog()
    {
        $this->assertType('osid_course_CourseCatalog', $this->session->getCourseCatalog($this->mcugId));
        $this->assertType('osid_course_CourseCatalog', $this->session->getCourseCatalog($this->miisId));
        try {
        	$catalog = $this->session->getCourseCatalog($this->unknownId);
        	$this->fail('An osid_NotFoundException should have been thrown.');
        } catch (osid_NotFoundException $e) {
        	$this->assertTrue(true);
        }
    }

    /**
     * @todo Implement testGetCourseCatalogsByIds().
     */
    public function testGetCourseCatalogsByIds()
    {
        $this->session->useComparativeCourseCatalogView();
        $catalogs = $this->session->getCourseCatalogsByIds(new phpkit_id_ArrayIdList(array(
       					$this->mcugId,
       					$this->miisId)));
       	$this->assertType('osid_course_CourseCatalogList', $catalogs);
        $this->assertEquals(2, $catalogs->available());
    }

    /**
     * @todo Implement testGetCourseCatalogsByGenusType().
     */
    public function testGetCourseCatalogsByGenusType()
    {
    	$catalogs = $this->session->getCourseCatalogsByGenusType($this->generaNoneType);
       	$this->assertType('osid_course_CourseCatalogList', $catalogs);
       	$this->assertTrue($catalogs->hasNext());
       	
       	$catalogs = $this->session->getCourseCatalogsByGenusType($this->secondaryType);
       	$this->assertType('osid_course_CourseCatalogList', $catalogs);
       	$this->assertFalse($catalogs->hasNext());
    }

    /**
     * @todo Implement testGetCourseCatalogsByParentGenusType().
     */
    public function testGetCourseCatalogsByParentGenusType()
    {
        $catalogs = $this->session->getCourseCatalogsByGenusType($this->generaNoneType);
       	$this->assertType('osid_course_CourseCatalogList', $catalogs);
       	$this->assertTrue($catalogs->hasNext());
       	
       	$catalogs = $this->session->getCourseCatalogsByGenusType($this->secondaryType);
       	$this->assertType('osid_course_CourseCatalogList', $catalogs);
       	$this->assertFalse($catalogs->hasNext());
    }

    /**
     * @todo Implement testGetCourseCatalogsByRecordType().
     */
    public function testGetCourseCatalogsByRecordType()
    {
        $catalogs = $this->session->getCourseCatalogsByRecordType($this->unknownType);
       	$this->assertType('osid_course_CourseCatalogList', $catalogs);
       	$this->assertFalse($catalogs->hasNext());
    }

    /**
     * @todo Implement testGetCourseCatalogs().
     */
    public function testGetCourseCatalogs()
    {
        $catalogs = $this->session->getCourseCatalogs();
       	$this->assertType('osid_course_CourseCatalogList', $catalogs);
       	$this->assertTrue($catalogs->hasNext());
    }
}
?>
