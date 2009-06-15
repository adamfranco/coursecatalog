<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for banner_course_Topic_Search_Query.
 * Generated by PHPUnit on 2009-06-11 at 12:58:31.
 */
class banner_course_Topic_Search_QueryTest extends PHPUnit_Framework_TestCase
{
    /**
     * @var    banner_course_Topic_Search_Query
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
        $this->object = $this->session->getTopicQuery();
        
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
    public function testGetStringMatchTypes()
    {
        $types = $this->object->getStringMatchTypes();
        $this->assertType('osid_type_TypeList', $types);
        $this->assertEquals(1, $types->available());
        $this->assertTrue($this->wildcardStringMatchType->isEqual($types->getNextType()));
    }

    /**
     * 
     */
    public function testSupportsStringMatchType()
    {
        $this->assertTrue($this->object->supportsStringMatchType($this->wildcardStringMatchType));
    }

    /**
     * 
     */
    public function testMatchKeyword()
    {
        $this->object->matchDisplayName('Physics', $this->wildcardStringMatchType, true);
        
        $topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(2, $topics->available());
    }

    /**
     * 
     */
    public function testMatchDisplayName()
    {
       $this->object->matchDisplayName('Physics', $this->wildcardStringMatchType, true);

        $params = $this->object->getRequirementParameters();
        $this->assertEquals('Physics', $params[0]);
        $this->assertEquals(1, count($params));
        $params = $this->object->getDivisionParameters();
        $this->assertEquals('Physics', $params[0]);
        $this->assertEquals(1, count($params));
        $params = $this->object->getDepartmentParameters();
        $this->assertEquals('Physics', $params[0]);
        $this->assertEquals(1, count($params));
        $params = $this->object->getSubjectParameters();
        $this->assertEquals('Physics', $params[0]);
        $this->assertEquals(1, count($params));
        
        
        $this->assertEquals('(STVATTR_DESC LIKE(?))', $this->object->getRequirementWhereClause());
        $this->assertEquals('(STVDIVS_DESC LIKE(?))', $this->object->getDivisionWhereClause());
        $this->assertEquals('(STVDEPT_DESC LIKE(?))', $this->object->getDepartmentWhereClause());
        $this->assertEquals('(STVSUBJ_DESC LIKE(?))', $this->object->getSubjectWhereClause());
		
		$topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(2, $topics->available());
    }
    
    public function testMatchAll() {
    	$topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(12, $topics->available());
// 		print "\n";
// 		while ($topics->hasNext())
// 			print "\n".$topics->getNextTopic()->getId()->getIdentifier();
// 		print "\n";
    }

    /**
     * 
     */
    public function testMatchDescription()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * 
     */
    public function testMatchAnyDescription()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * 
     */
    public function testMatchDepartmentGenusType()
    {
    	$this->object->matchGenusType($this->departmentType, true);
        $topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(4, $topics->available());
    }
    
    /**
     * 
     */
    public function testMatchDivisionGenusType()
    {
    	$this->object->matchGenusType($this->divisionType, true);
        $topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(2, $topics->available());
    }
    
    /**
     * 
     */
    public function testMatchSubjectGenusType()
    {
    	$this->object->matchGenusType($this->subjectType, true);
        $topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(4, $topics->available());
    }
    
    /**
     * 
     */
    public function testMatchRequirementGenusType()
    {
    	$this->object->matchGenusType($this->requirementType, true);
        $topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(2, $topics->available());
    }
    
    /**
     * 
     */
    public function testMatchMultipleGenusTypes()
    {
    	$this->object->matchGenusType($this->requirementType, true);
    	$this->object->matchGenusType($this->departmentType, true);
        $topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(6, $topics->available());
    }

    /**
     * 
     */
    public function testMatchParentGenusType()
    {
        $this->object->matchParentGenusType($this->requirementType, true);
        $topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(2, $topics->available());
    }

    /**
     * 
     */
    public function testMatchRecordType()
    {
        $this->object->matchRecordType($this->requirementType, true);
        $topics = $this->session->getTopicsByQuery($this->object);
        $this->assertType('osid_course_TopicList', $topics);
    }

    /**
     * 
     */
    public function testHasRecordType()
    {
        $this->assertType('boolean', $this->object->hasRecordType($this->requirementType));
    }

    /**
     * 
     */
    public function testMatchCourseOfferingId()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * 
     */
    public function testSupportsCourseOfferingQuery()
    {
        $this->assertFalse($this->object->supportsCourseOfferingQuery());
    }

    /**
     * @expectedException osid_UnimplementedException
     */
    public function testGetCourseOfferingQuery()
    {
        $this->object->getCourseOfferingQuery();
    }

    /**
     * 
     */
    public function testMatchAnyCourseOffering()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * 
     */
    public function testMatchCourseCatalogId()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * 
     */
    public function testSupportsCourseCatalogQuery()
    {
        $this->assertFalse($this->object->supportsCourseCatalogQuery());
    }

    /**
     * @expectedException osid_UnimplementedException
     */
    public function testGetCourseCatalogQuery()
    {
        $this->assertFalse($this->object->getCourseCatalogQuery());
    }

    /**
     * 
     */
    public function testGetTopicQueryRecord()
    {
        $termRecord = $this->object->getTopicQueryRecord($this->termType);
        $this->assertType('middlebury_course_Topic_Search_TermQueryRecord', $termRecord);
    }
    
    /**
     * 
     */
    public function testMatchTerm()
    {
        $termRecord = $this->object->getTopicQueryRecord($this->termType);
        $termRecord->matchTermId($this->termId, true);
        $topics = $this->session->getTopicsByQuery($this->object);
		$this->assertEquals(5, $topics->available());
    }
    
    
}
?>