<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for banner_course_CourseCatalog.
 * Generated by PHPUnit on 2009-04-15 at 15:42:30.
 */
class banner_course_CourseCatalogTest 
	extends phpkit_test_phpunit_AbstractOsidObjectTest
{
    /**
     * @var    banner_course_CourseCatalog
     * @access protected
     */
    protected $object;

    /**
     * @var    banner_course_CourseLookupSession
     * @access protected
     */
    protected $session;
    
    protected $mcugId;
    protected $miisId;
    
    /**
	 * Answer the Object to test
	 * 
	 * @return osid_OsidObject
	 * @access protected
	 * @since 4/15/09
	 */
	protected function getObject () {
		return $this->object;
	}

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     *
     * @access protected
     */
    protected function setUp()
    {
        $this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MIIS');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');
        
        $this->manager = $this->sharedFixture['CourseManager'];
        $this->session = $this->manager->getCourseLookupSessionForCatalog($this->mcugId);
        
        $this->object = $this->session->getCourseCatalog($this->mcugId);
        
        $this->physId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/PHYS0201');
        $this->mathId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/MATH0300');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/XXXX0101');
        
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
     * @todo Implement testGetCourseCatalogRecord().
     */
    public function testGetCourseCatalogRecord()
    {
        $types = $this->object->getRecordTypes();
    	while ($types->hasNext()) {
	        $this->assertType('osid_course_CourseCatalogRecord', $this->object->getCourseRecord($types->getNextType()));
	    }
    }
}
?>
