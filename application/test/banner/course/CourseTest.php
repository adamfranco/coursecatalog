<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for banner_course_Course.
 * Generated by PHPUnit on 2009-04-15 at 13:36:26.
 */
class banner_course_CourseTest 
	extends phpkit_test_phpunit_AbstractOsidObjectTest
{
    /**
     * @var    banner_course_Course
     * @access protected
     */
    protected $object;
    
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
    	$this->physId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/PHYS0201');
    	$this->manager = $this->sharedFixture['CourseManager'];
        $this->session = $this->manager->getCourseLookupSessionForCatalog($this->mcugId);
        $this->object = $this->session->getCourse($this->physId);
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
     * @todo Implement testGetTitle().
     */
    public function testGetTitle()
    {
        $this->assertType('string', $this->object->getTitle());
    }
    
    public function testGetPhysDescription()
    {
    	$this->assertEquals("This course probes a number of areas for which classical physics has provided no adequate explanations. Topics covered include Einstein's special relativity, quantization of atomic energy levels and photons, the atomic models of Rutherford and Bohr, and wave-particle duality. (PHYS 0109, MATH 0122, PHYS 0110 concurrent or prior) 3 hrs. lect.", $this->object->getDescription());
    }

    /**
     * @todo Implement testGetNumber().
     */
    public function testGetNumber()
    {
        $this->assertType('string', $this->object->getNumber());
    }

    /**
     * @todo Implement testGetCredits().
     */
    public function testGetCredits()
    {
        $this->assertType('float', $this->object->getCredits());
    }

    /**
     * @todo Implement testGetPrereqInfo().
     */
    public function testGetPrereqInfo()
    {
        $this->assertType('string', $this->object->getTitle());
    }
    
    /**
     * 
     */
    public function testGetTopicIds()
    {
    	$list = $this->object->getTopicIds();
        $this->assertType('osid_id_IdList', $list);
        $this->assertEquals(3, $list->available());
        $this->assertType('osid_id_Id', $list->getNextId());
    }

    /**
     * 
     */
    public function testGetTopics()
    {
        $list = $this->object->getTopics();
        $this->assertType('osid_course_TopicList', $list);
        $this->assertEquals(3, $list->available());
        $this->assertType('osid_course_Topic', $list->getNextTopic());
    }
    
    /**
     * 
     */
    public function testTopicIds()
    {
        $list = $this->object->getTopicIds();
        $identifiers = array(
        					'topic/subject/PHYS', 
        					'topic/department/PHYS', 
        					'topic/division/NSCI'
        				);
        $found = array();
        while ($list->hasNext()) {
        	$found[] = $list->getNextId()->getIdentifier();
        }
        foreach ($identifiers as $id) {
        	if (!in_array($id, $found))
        		$this->fail('Topic "'.$id.'" was not found.');
        }
    }

    /**
     * @todo Implement testGetCourseRecord().
     */
    public function testGetCourseRecord()
    {
    	$types = $this->object->getRecordTypes();
    	while ($types->hasNext()) {
	        $this->assertType('osid_course_CourseRecord', $this->object->getCourseRecord($types->getNextType()));
	    }
    }
}
?>
