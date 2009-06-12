<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for banner_course_Topic_Search_Order.
 * Generated by PHPUnit on 2009-06-11 at 13:01:31.
 */
class banner_course_Topic_Search_OrderTest extends PHPUnit_Framework_TestCase
{
    /**
     * @var    banner_course_Topic_Search_Order
     * @access protected
     */
    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     *
     * @access protected
     */
    protected function setUp()
    {
		$this->wildcardStringMatchType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:search:wildcard");
        
    	$this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MIIS');

	 	$this->manager = $this->sharedFixture['CourseManager'];
        $this->session = $this->manager->getTopicSearchSessionForCatalog($this->mcugId);
        $this->object = $this->session->getTopicSearchOrder();
        
        $this->termId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200820');

		$this->termType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:terms');

        $this->subjectType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/subject");
        $this->departmentType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/department");
        $this->divisionType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/division");
        $this->requirementType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:topic/requirement");
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
    public function testAscend()
    {
        $this->object->ascend();
    }

    /**
     * 
     */
    public function testDescend()
    {
        $this->object->descend();
    }

    /**
     * 
     */
    public function testOrderByDisplayName()
    {
        $this->object->orderByDisplayName();
    }

    /**
     * 
     */
    public function testOrderByGenusType()
    {
        $this->object->orderByGenusType();
    }

    /**
     * 
     */
    public function testHasRecordType()
    {
        $this->assertFalse($this->object->hasRecordType($this->termType));
    }

    /**
     * @expectedException osid_UnsupportedException
     */
    public function testGetTopicSearchOrderRecord()
    {
        $this->object->getTopicSearchOrderRecord($this->termType);
    }
}
?>
