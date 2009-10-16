<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for banner_course_Course_Search_Query.
 * Generated by PHPUnit on 2009-10-16 at 10:47:24.
 */
class banner_course_Course_Search_QueryTest extends PHPUnit_Framework_TestCase
{
    /**
     * @var    banner_course_Course_Search_Query
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
        $this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MIIS');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');
        
        $this->manager = $this->sharedFixture['CourseManager'];
        $this->session = $this->manager->getCourseSearchSessionForCatalog($this->mcugId);
        
        $this->wildcardStringMatchType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:search:wildcard");
        
        $this->object = $this->session->getCourseQuery();
        
        $this->search = $this->session->getCourseSearch();
                
        $this->physId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/PHYS0201');
        $this->geolId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/GEOL0250');
        $this->chemId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/CHEM0104');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/XXXX0101');
        
        $this->physOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200890/90143');
       	$this->geolOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200420/20663');
       	$this->chemOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200420/20073');
        
        $this->deptTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/department/PHYS');
        $this->subjTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/subject/CHEM');
        $this->divTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/division/NSCI');
        
        $this->unknownType = new phpkit_type_URNInetType("urn:inet:osid.org:unknown_type");
    	
        $this->generaNoneType = new phpkit_type_URNInetType("urn:inet:osid.org:genera:none");
        $this->secondaryType = new phpkit_type_URNInetType("urn:inet:osid.org:genera:secondary");
        $this->undergraduateType = new phpkit_type_URNInetType("urn:inet:osid.org:genera:undergraduate");
        
        $this->instructorsType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:instructors');
        $this->topicQueryRecordType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:topic');
		$this->otherType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:other');
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
    public function testGetWhereClause()
    {
        $this->assertType('string', $this->object->getWhereClause());
    }
    
    /**
     * 
     */
    public function testGetAdditionalTableJoins()
    {
        $this->assertType('array', $this->object->getAdditionalTableJoins());
    }

    /**
     * 
     */
    public function testGetParameters()
    {
        $this->assertType('array', $this->object->getParameters());
    }

    /**
     * 
     */
    public function testGetStringMatchTypes()
    {
        $types = $this->object->getStringMatchTypes();
        $this->assertType('osid_type_TypeList', $types);
        $this->assertEquals(2, $types->available());
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
     * @todo Implement testMatchKeyword().
     */
    public function testMatchKeyword()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * 
     */
    public function testMatchDisplayName()
    {
        $this->object->matchDisplayName('PHYS0201', $this->wildcardStringMatchType, true);

        $params = $this->object->getParameters();
        $this->assertEquals('PHYS', $params[0]);
        $this->assertEquals('0201', $params[1]);
        
        $this->assertEquals('((SCBCRSE_SUBJ_CODE LIKE(?) AND SCBCRSE_CRSE_NUMB LIKE(?)))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(1, $courses->available());
    }

    /**
     * @todo Implement testMatchDescription().
     */
    public function testMatchDescription()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * @todo Implement testMatchAnyDescription().
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
    public function testMatchInvalidGenusType()
    {
        $this->object->matchGenusType(new phpkit_type_URNInetType("urn:inet:osid.org:genera:kjsdfsf"), true);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(FALSE)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(0, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchInvalidGenusTypeInverted()
    {
        $this->object->matchGenusType(new phpkit_type_URNInetType("urn:inet:osid.org:genera:kjsdfsf"), false);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(NOT FALSE)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(4, $courses->available());
    }

    /**
     * 
     */
    public function testMatchGenusType()
    {
        $this->object->matchGenusType($this->generaNoneType, true);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(TRUE)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(4, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchGenusTypeInverted()
    {
        $this->object->matchGenusType($this->generaNoneType, false);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(NOT TRUE)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(0, $courses->available());
    }

    /**
     * 
     */
    public function testMatchParentGenusType()
    {
        $this->object->matchParentGenusType($this->generaNoneType, true);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(TRUE)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(4, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchParentGenusTypeInverted()
    {
        $this->object->matchParentGenusType($this->generaNoneType, false);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(NOT TRUE)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(0, $courses->available());
    }

    /**
     * 
     */
    public function testMatchRecordType()
    {
        $this->object->matchRecordType($this->topicQueryRecordType, true);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(TRUE)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(4, $courses->available());
    }
    
     /**
     * 
     */
    public function testMatchOtherRecordType()
    {
        $this->object->matchRecordType(new phpkit_type_URNInetType("urn:inet:osid.org:record:other"), true);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(FALSE)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(0, $courses->available());
    }

    /**
     * 
     */
    public function testHasRecordType()
    {
        $this->assertTrue($this->object->hasRecordType($this->topicQueryRecordType));
        $this->assertFalse($this->object->hasRecordType(new phpkit_type_URNInetType("urn:inet:osid.org:record:other")));
    }

    /**
     * 
     */
    public function testMatchTitle()
    {
        $this->object->matchTitle('Relativity And Quantum Physics', $this->wildcardStringMatchType, true);

        $params = $this->object->getParameters();
        $this->assertEquals('Relativity And Quantum Physics', $params[0]);
        $this->assertFalse(isset($params[1]));
        
        $this->assertEquals('(SCBCRSE_TITLE LIKE(?))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(1, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchTitleWithWild()
    {
        $this->object->matchTitle('*and*', $this->wildcardStringMatchType, true);

        $params = $this->object->getParameters();
        $this->assertEquals('%and%', $params[0]);
        $this->assertFalse(isset($params[1]));
        
        $this->assertEquals('(SCBCRSE_TITLE LIKE(?))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(3, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchTitleWithWildInverted()
    {
        $this->object->matchTitle('*and*', $this->wildcardStringMatchType, false);

        $params = $this->object->getParameters();
        $this->assertEquals('%and%', $params[0]);
        $this->assertFalse(isset($params[1]));
        
        $this->assertEquals('(NOT SCBCRSE_TITLE LIKE(?))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(1, $courses->available());
    }

    /**
     * 
     */
    public function testMatchAnyTitle()
    {
        $this->object->matchAnyTitle(true);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(SCBCRSE_TITLE IS NOT NULL)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
// 		print $courses->debug();
		$this->assertEquals(4, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchAnyTitleInverted()
    {
        $this->object->matchAnyTitle(false);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(NOT SCBCRSE_TITLE IS NOT NULL)', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(0, $courses->available());
    }

    /**
     * 
     */
    public function testMatchNumber()
    {
        $this->object->matchNumber('PHYS0201', $this->wildcardStringMatchType, true);

        $params = $this->object->getParameters();
        $this->assertEquals('PHYS', $params[0]);
        $this->assertEquals('0201', $params[1]);
        
        $this->assertEquals('((SCBCRSE_SUBJ_CODE LIKE(?) AND SCBCRSE_CRSE_NUMB LIKE(?)))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(1, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchNumberWild1()
    {
        $this->object->matchNumber('*HYS0201', $this->wildcardStringMatchType, true);

        $params = $this->object->getParameters();
        $this->assertEquals('%HYS', $params[0]);
        $this->assertEquals('0201', $params[1]);
        
        $this->assertEquals('((SCBCRSE_SUBJ_CODE LIKE(?) AND SCBCRSE_CRSE_NUMB LIKE(?)))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(1, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchNumberWild2()
    {
        $this->object->matchNumber('P*YS0201', $this->wildcardStringMatchType, true);

        $params = $this->object->getParameters();
        $this->assertEquals('P%YS', $params[0]);
        $this->assertEquals('0201', $params[1]);
        
        $this->assertEquals('((SCBCRSE_SUBJ_CODE LIKE(?) AND SCBCRSE_CRSE_NUMB LIKE(?)))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(1, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchNumberWild3()
    {
        $this->object->matchNumber('PHY*0201', $this->wildcardStringMatchType, true);

        $params = $this->object->getParameters();
        $this->assertEquals('PHY%', $params[0]);
        $this->assertEquals('%0201', $params[1]);
        
        $this->assertEquals('((SCBCRSE_SUBJ_CODE LIKE(?) AND SCBCRSE_CRSE_NUMB LIKE(?)))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(1, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchNumberWild4()
    {
        $this->object->matchNumber('PHYS0*01', $this->wildcardStringMatchType, true);

        $params = $this->object->getParameters();
        $this->assertEquals('PHYS', $params[0]);
        $this->assertEquals('0%01', $params[1]);
        
        $this->assertEquals('((SCBCRSE_SUBJ_CODE LIKE(?) AND SCBCRSE_CRSE_NUMB LIKE(?)))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(1, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchNumberWild5()
    {
        $this->object->matchNumber('PH*', $this->wildcardStringMatchType, true);

        $params = $this->object->getParameters();
        $this->assertEquals('PH%', $params[0]);
        $this->assertFalse(isset($params[1]));
        
        $this->assertEquals('((SCBCRSE_SUBJ_CODE LIKE(?)))', $this->object->getWhereClause());
		
		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(1, $courses->available());
    }

    /**
     * 
     */
    public function testMatchAnyNumber()
    {
        $this->object->matchAnyNumber(true);
        $this->assertEquals('(TRUE)', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(4, $courses->available());
    }

    /**
     * 
     */
    public function testMatchCredits11()
    {
        $this->object->matchCredits(1, 1, true);

        $params = $this->object->getParameters();
        $this->assertEquals(1.0, $params[0]);
        $this->assertEquals(1.0, $params[1]);
        $this->assertFalse(isset($params[2]));
        
        $this->assertEquals('((SCBCRSE_BILL_HR_HIGH >= ? AND SCBCRSE_BILL_HR_HIGH <= ?))', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(4, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchCredits01()
    {
        $this->object->matchCredits(0, 1, true);

        $params = $this->object->getParameters();
        $this->assertEquals(0.0, $params[0]);
        $this->assertEquals(1.0, $params[1]);
        $this->assertFalse(isset($params[2]));
        
        $this->assertEquals('((SCBCRSE_BILL_HR_HIGH >= ? AND SCBCRSE_BILL_HR_HIGH <= ?))', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(4, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchCredits22()
    {
        $this->object->matchCredits(2.0, 2.0, true);

        $params = $this->object->getParameters();
        $this->assertEquals(2.0, $params[0]);
        $this->assertEquals(2.0, $params[1]);
        $this->assertFalse(isset($params[2]));
        
        $this->assertEquals('((SCBCRSE_BILL_HR_HIGH >= ? AND SCBCRSE_BILL_HR_HIGH <= ?))', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(0, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchCredits00()
    {
        $this->object->matchCredits(0.0, 0.0, true);

        $params = $this->object->getParameters();
        $this->assertEquals(0.0, $params[0]);
        $this->assertEquals(0.0, $params[1]);
        $this->assertFalse(isset($params[2]));
        
        $this->assertEquals('((SCBCRSE_BILL_HR_HIGH >= ? AND SCBCRSE_BILL_HR_HIGH <= ?))', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(0, $courses->available());
    }

    /**
     * 
     */
    public function testMatchAnyCredits()
    {
        $this->object->matchAnyCredits(true);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(SCBCRSE_BILL_HR_HIGH > 0)', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(4, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchAnyCreditsInverted()
    {
        $this->object->matchAnyCredits(false);

        $params = $this->object->getParameters();
        $this->assertFalse(isset($params[0]));
        
        $this->assertEquals('(NOT SCBCRSE_BILL_HR_HIGH > 0)', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
		$this->assertEquals(0, $courses->available());
    }

    /**
     * @todo Implement testMatchPrereqInfo().
     */
    public function testMatchPrereqInfo()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * @todo Implement testMatchAnyPrereqInfo().
     */
    public function testMatchAnyPrereqInfo()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * 
     */
    public function testMatchCourseOfferingId()
    {
        $this->object->matchCourseOfferingId($this->physOfferingId, true);

        $params = $this->object->getParameters();
        $this->assertEquals('200890', $params[0]);
        $this->assertEquals('90143', $params[1]);
        $this->assertFalse(isset($params[2]));
        
        $this->assertEquals('((SSBSECT_TERM_CODE = ? AND SSBSECT_CRN = ?))', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
// 		print $courses->debug();
		$this->assertEquals(1, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchCourseOfferingIdInverted()
    {
    	// As written currently, courses that match other offering ids and also
    	// the specified offering Id will also be returned. 
        $this->markTestIncomplete('Not sure of the desired result.');
        return;
        
        $this->object->matchCourseOfferingId($this->physOfferingId, false);

        $params = $this->object->getParameters();
        $this->assertEquals('200890', $params[0]);
        $this->assertEquals('90143', $params[1]);
        $this->assertFalse(isset($params[2]));
        
        $this->assertEquals('(NOT (SSBSECT_TERM_CODE = ? AND SSBSECT_CRN = ?))', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
		print $courses->debug();
		$this->assertEquals(3, $courses->available());
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
        $this->object->matchAnyCourseOffering(true);

        $params = $this->object->getParameters();
        $this->assertEquals(0, count($params));
        
        $this->assertEquals('(SSBSECT_TERM_CODE IS NOT NULL)', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
// 		print $courses->debug();
		$this->assertEquals(4, $courses->available());
    }

    /**
     * 
     */
    public function testMatchCourseCatalogId()
    {
        $this->object->matchCourseCatalogId($this->mcugId, true);

        $params = $this->object->getParameters();
        $this->assertEquals('MCUG', $params[0]);
        $this->assertFalse(isset($params[1]));
        
//         $this->assertEquals('(SSBSECT_TERM_CODE IN (
// 			SELECT
// 				term_code
// 			FROM
// 				catalog_term
// 			WHERE
// 				catalog_id = ?))', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
// 		print $courses->debug();
		$this->assertEquals(4, $courses->available());
    }
    
    /**
     * 
     */
    public function testMatchCourseCatalogIdMIIS()
    {
        $this->object->matchCourseCatalogId($this->miisId, true);

        $params = $this->object->getParameters();
        $this->assertEquals('MIIS', $params[0]);
        $this->assertFalse(isset($params[1]));
        
//         $this->assertEquals('(SSBSECT_TERM_CODE IN (
// 			SELECT
// 				term_code
// 			FROM
// 				catalog_term
// 			WHERE
// 				catalog_id = ?))', $this->object->getWhereClause());

		$courses = $this->session->getCoursesByQuery($this->object);
// 		print $courses->debug();
		$this->assertEquals(0, $courses->available());
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
        $this->object->getCourseCatalogQuery();
    }

    /**
     * @expectedException osid_UnsupportedException
     */
    public function testGetCourseQueryRecord()
    {
        $record = $this->object->getCourseQueryRecord($this->instructorsType);
//         $this->assertType('osid_course_CourseQueryRecord', $record);
//         $this->assertType('middlebury_course_Course_Search_InstructorsQueryRecord', $record);
    }
    
    
    /**
     *
     */
    public function testGetTopicCourseQueryRecord() {
    	$record = $this->object->getCourseQueryRecord($this->topicQueryRecordType);
        $this->assertType('osid_course_CourseQueryRecord', $record);
        $this->assertType('middlebury_course_Course_Search_TopicQueryRecord', $record);
    }
    
    /**
     *
     */
    public function testMatchDepartmentTopicId() {
    	$record = $this->object->getCourseQueryRecord($this->topicQueryRecordType);
        $record->matchTopicId($this->deptTopicId, true);
        
        $courses = $this->session->getCoursesByQuery($this->object);
// 		print $courses->debug();
		$this->assertEquals(1, $courses->available());
    }
    
    /**
     *
     */
    public function testMatchSubjectTopicId() {
    	$record = $this->object->getCourseQueryRecord($this->topicQueryRecordType);
        $record->matchTopicId($this->subjTopicId, true);
        
        $courses = $this->session->getCoursesByQuery($this->object);
// 		print $courses->debug();
		$this->assertEquals(1, $courses->available());
    }
    
    /**
     *
     */
    public function testMatchDivTopicId() {
    	$record = $this->object->getCourseQueryRecord($this->topicQueryRecordType);
        $record->matchTopicId($this->divTopicId, true);
        
        $courses = $this->session->getCoursesByQuery($this->object);
// 		print $courses->debug();
		$this->assertEquals(3, $courses->available());
    }
    
    /**
     * 
     */
    public function testSupportsTopicQuery() {
    	$record = $this->object->getCourseQueryRecord($this->topicQueryRecordType);
    	$this->assertFalse($record->supportsTopicQuery());
    }
    
    /**
     * @expectedException osid_UnimplementedException
     */
    public function testGetTopicQuery() {
    	$record = $this->object->getCourseQueryRecord($this->topicQueryRecordType);
    	$topicQuery = $record->getTopicQuery();
    }
    
    /**
     *
     */
    public function testGetQueryFromRecord() {
    	$record = $this->object->getCourseQueryRecord($this->topicQueryRecordType);
        $this->assertType('osid_course_CourseQuery', $record->getCourseQuery());
    }
}
?>
