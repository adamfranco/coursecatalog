<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for banner_course_CourseOffering.
 * Generated by PHPUnit on 2009-04-16 at 10:31:07.
 */
class banner_course_CourseOfferingTest 
	extends phpkit_test_phpunit_AbstractOsidObjectTest
{
    /**
     * @var    banner_course_CourseOffering
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
        $this->mcugCatalogId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
    	$this->physCourseId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/PHYS0201');
    	$this->physOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200890/90143');
    	$this->geolOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200890/92418');
    	$this->geogOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200890/92443');
    	$this->chemOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200520/20022');
    	$this->manager = $this->sharedFixture['CourseManager'];
        $this->session = $this->manager->getCourseOfferingLookupSessionForCatalog($this->mcugCatalogId);
        $this->object = $this->session->getCourseOffering($this->physOfferingId);
        
        $this->instructorsType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:instructors');
		$this->weeklyScheduleType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:weekly_schedule');
		$this->alternatesType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:alternates');
		
		
        $this->namesType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:person_names');
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
	
	public function testOfferingGetDisplayName() {
		$this->assertEquals('PHYS0201A-F08', $this->object->getDisplayName());
	}
	
	public function testGenusType() {
    	$type = $this->object->getGenusType();
    	$this->assertType('osid_type_Type', $type);
    	$this->assertEquals('genera:offering/LCT', $type->getIdentifier());
    	$this->assertEquals('Lecture', trim($type->getDisplayName()));
    }
	
    /**
     * 
     */
    public function testGetTitle()
    {
        $this->assertType('string', $this->object->getTitle());
        $this->assertEquals('Relativity And Quantum Physics', $this->object->getTitle());
    }
    
	public function testGetPhysDescription()
	{
		$this->assertEquals("This course probes a number of areas for which classical physics has provided no adequate explanations. Topics covered include Einstein's special relativity, quantization of atomic energy levels and photons, the atomic models of Rutherford and Bohr, and wave-particle duality. (PHYS 0109, MATH 0122, PHYS 0110 concurrent or prior) 3 hrs. lect.", $this->object->getDescription());
	}
    
    /**
     * 
     */
    public function testChemGetNumber()
    {
    	$object = $this->session->getCourseOffering($this->chemOfferingId);
        $this->assertType('string', $object->getNumber());
        $this->assertEquals('CHEM0104T-S05', $object->getNumber());
    }

    /**
     * 
     */
    public function testGetNumber()
    {
        $this->assertType('string', $this->object->getNumber());
        $this->assertEquals('PHYS0201A-F08', $this->object->getNumber());
    }

    /**
     * 
     */
    public function testGetCredits()
    {
        $this->assertType('float', $this->object->getCredits());
        $this->assertEquals(1.00, $this->object->getCredits());
    }

    /**
     * 
     */
    public function testGetPrereqInfo()
    {
        $this->assertType('string', $this->object->getPrereqInfo());
    }

    /**
     * 
     */
    public function testGetCourseId()
    {
        $this->assertType('osid_id_Id', $this->object->getCourseId());
    }

    /**
     * 
     */
    public function testGetCourse()
    {
        $this->assertType('osid_course_Course', $this->object->getCourse());
    }

    /**
     * 
     */
    public function testGetTermId()
    {
        $this->assertType('osid_id_Id', $this->object->getTermId());
    }

    /**
     * 
     */
    public function testGetTerm()
    {
        $this->assertType('osid_course_Term', $this->object->getTerm());
    }
    
    /**
     * 
     */
    public function testGetTopicIds()
    {
    	$list = $this->object->getTopicIds();
        $this->assertType('osid_id_IdList', $list);
        $this->assertEquals(5, $list->available());
        $this->assertType('osid_id_Id', $list->getNextId());
    }

    /**
     * 
     */
    public function testGetTopics()
    {
        $list = $this->object->getTopics();
        $this->assertType('osid_course_TopicList', $list);
        $this->assertEquals(5, $list->available());
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
        					'topic/division/NSCI',
        					'topic/requirement/DED',
        					'topic/requirement/SCI'
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
     * 
     */
    public function testGetLocationInfo()
    {
        $this->assertType('string', $this->object->getLocationInfo());
//         $this->assertEquals('', $this->object->getLocationInfo());
    }

    /**
     * 
     */
    public function testHasLocation()
    {
        $this->assertType('boolean', $this->object->hasLocation());
    }

    /**
     * 
     */
    public function testGetLocationId()
    {
        if ($this->object->hasLocation()) {
        	$this->assertType('osid_id_Id', $this->object->getLocationId());
        } else {
        	try {
        		$this->object->getLocationId();
        		$this->fail('Should have thrown an osid_IllegalStateException');
        	} catch (osid_IllegalStateException $e) {
        		$this->assertTrue(true);
        	}
        }
    }

    /**
     * 
     */
    public function testGetLocation()
    {
        if ($this->object->hasLocation()) {
	        try {
	        	$this->assertType('osid_resource_Resource', $this->object->getLocation());
			} catch (osid_OperationFailedException $e) {
				$this->markTestIncomplete($e->getMessage().' - getResourceManager() needs to be fully implemented..');
			}
	        	
        } else {
        	try {
        		$this->object->getLocation();
        		$this->fail('Should have thrown an osid_IllegalStateException');
        	} catch (osid_IllegalStateException $e) {
        		$this->assertTrue(true);
        	}
        }
    }

    /**
     * 
     */
    public function testGetScheduleInfo()
    {
        $this->assertType('string', $this->object->getScheduleInfo());
//         $this->assertEquals('', $this->object->getScheduleInfo());
    }

    /**
     * 
     */
    public function testHasCalendar()
    {
        $this->assertType('boolean', $this->object->hasCalendar());
    }

    /**
     * 
     */
    public function testGetCalendarId()
    {
        if ($this->object->hasCalendar()) {
        	$this->assertType('osid_id_Id', $this->object->getCalendarId());
        } else {
        	try {
        		$this->object->getCalendarId();
        		$this->fail('Should have thrown an osid_IllegalStateException');
        	} catch (osid_IllegalStateException $e) {
        		$this->assertTrue(true);
        	}
        }
    }

    /**
     * 
     */
    public function testGetCalendar()
    {
        if ($this->object->hasCalendar()) {
        	$this->assertType('osid_resource_Resource', $this->object->getCalendar());
        } else {
        	try {
        		$this->object->getCalendar();
        		$this->fail('Should have thrown an osid_IllegalStateException');
        	} catch (osid_IllegalStateException $e) {
        		$this->assertTrue(true);
        	}
        }
    }

    /**
     * 
     */
    public function testHasLearningObjective()
    {
        $this->assertType('boolean', $this->object->hasLearningObjective());
    }

    /**
     * 
     */
    public function testGetLearningObjectiveId()
    {
        if ($this->object->hasLearningObjective()) {
        	$this->assertType('osid_id_Id', $this->object->getLearningObjectiveId());
        } else {
        	try {
        		$this->object->getLearningObjectiveId();
        		$this->fail('Should have thrown an osid_IllegalStateException');
        	} catch (osid_IllegalStateException $e) {
        		$this->assertTrue(true);
        	}
        }
    }

    /**
     * 
     */
    public function testGetLearningObjective()
    {
        if ($this->object->hasLearningObjective()) {
        	$this->assertType('osid_id_Id', $this->object->getLearningObjective());
        } else {
        	try {
        		$this->object->getLearningObjective();
        		$this->fail('Should have thrown an osid_IllegalStateException');
        	} catch (osid_IllegalStateException $e) {
        		$this->assertTrue(true);
        	}
        }
    }

    /**
     * @todo Implement testGetURL().
     */
    public function testGetURL()
    {
        $this->assertType('string', $this->object->getURL());
    }

    /**
     * 
     */
    public function testGetCourseOfferingRecord()
    {
        $types = $this->object->getRecordTypes();
    	while ($types->hasNext()) {
	        $this->assertType('osid_course_CourseOfferingRecord', $this->object->getCourseOfferingRecord($types->getNextType()));
	    }
    }
    
    /**
     * 
     */
    public function testHasInstructorsRecord()
    {
        $this->assertTrue($this->object->hasRecordType($this->instructorsType));
    }
    
    /**
     * 
     */
    public function testGetInstructorsRecord()
    {
        $record = $this->object->getCourseOfferingRecord($this->instructorsType);
        $this->assertType('osid_course_CourseOfferingRecord', $record);
        $this->assertType('middlebury_course_CourseOffering_InstructorsRecord', $record);
    }
    
    /**
     * 
     */
    public function testInstructorsRecordGetInstructorIds()
    {
        $record = $this->object->getCourseOfferingRecord($this->instructorsType);
        $ids = $record->getInstructorIds();
        $this->assertType('osid_id_IdList', $ids);
        $this->assertEquals(1, $ids->available());
        $this->assertType('osid_id_Id', $ids->getNextId());
    }
    
    /**
     * 
     */
    public function testInstructorsRecordGetInstructors()
    {
        $record = $this->object->getCourseOfferingRecord($this->instructorsType);
        $instructors = $record->getInstructors();
        $this->assertType('osid_resource_ResourceList', $instructors);
        $this->assertEquals(1, $instructors->available());
        $person = $instructors->getNextResource();
        $this->assertType('osid_resource_Resource', $person);
        $this->assertEquals('Nevin Nordemire', $person->getDisplayName());
        
        $names = $person->getResourceRecord($this->namesType);
        $this->assertEquals('Nevin', $names->getGivenName());
        $this->assertEquals('Nordemire', $names->getSurname());
    }
    
    /**
     * 
     */
    public function testChemInstructorsRecordGetInstructorIds()
    {
    	$object = $this->session->getCourseOffering($this->chemOfferingId);
        $record = $object->getCourseOfferingRecord($this->instructorsType);
        $ids = $record->getInstructorIds();
        $this->assertType('osid_id_IdList', $ids);
        $this->assertEquals(2, $ids->available());
        $this->assertType('osid_id_Id', $ids->getNextId());
    }
    
    /**
     * 
     */
    public function testChemInstructorsRecordGetInstructors()
    {
        $object = $this->session->getCourseOffering($this->chemOfferingId);
        $record = $object->getCourseOfferingRecord($this->instructorsType);
        $instructors = $record->getInstructors();
        $this->assertType('osid_resource_ResourceList', $instructors);
        $this->assertEquals(2, $instructors->available());
        
        $person = $instructors->getNextResource();
        $this->assertType('osid_resource_Resource', $person);
        $this->assertEquals('Barry Bancroft', $person->getDisplayName());
        
        $names = $person->getResourceRecord($this->namesType);
        $this->assertEquals('Barry', $names->getGivenName());
        $this->assertEquals('Bancroft', $names->getSurname());
        
        $person = $instructors->getNextResource();
        $this->assertType('osid_resource_Resource', $person);
        $this->assertEquals('Georges Gleuseau', $person->getDisplayName());
        
        $names = $person->getResourceRecord($this->namesType);
        $this->assertEquals('Georges', $names->getGivenName());
        $this->assertEquals('Gleuseau', $names->getSurname());
    }

/*********************************************************
 * Tests for AlternatesRecord.
 *********************************************************/
 	/**
     * 
     */
    public function testHasAlternates () {
    	$record = $this->object->getCourseOfferingRecord($this->alternatesType);
    	$this->assertFalse($record->hasAlternates());
    }
    
 	/**
     * 
     */
    public function testGetAlternateIds () {
    	$record = $this->object->getCourseOfferingRecord($this->alternatesType);
    	$ids = $record->getAlternateIds();
    	$this->assertType('osid_id_IdList', $ids);
    }
    
    /**
     * 
     */
    public function testGetAlternates () {
    	$record = $this->object->getCourseOfferingRecord($this->alternatesType);
    	$alternates = $record->getAlternates();
    	$this->assertType('osid_course_CourseOfferingList', $alternates);
    }
    
    /**
     * 
     */
    public function testHasGeolAlternates () {
    	$offering = $this->session->getCourseOffering($this->geolOfferingId);
    	$record = $offering->getCourseOfferingRecord($this->alternatesType);
    	$this->assertTrue($record->hasAlternates());
    }
 	
 	/**
     * 
     */
    public function testGetGeolAlternateIds () {
    	$offering = $this->session->getCourseOffering($this->geolOfferingId);
    	$record = $offering->getCourseOfferingRecord($this->alternatesType);
    	$ids = $record->getAlternateIds();
    	$this->assertType('osid_id_IdList', $ids);
    	$this->assertEquals(1, $ids->available());
    }
    
    /**
     * 
     */
    public function testGetGeolAlternates () {
    	$offering = $this->session->getCourseOffering($this->geolOfferingId);
    	$record = $offering->getCourseOfferingRecord($this->alternatesType);
    	$alternates = $record->getAlternates();
    	$this->assertType('osid_course_CourseOfferingList', $alternates);
    	$this->assertEquals(1, $alternates->available());
    }
    
    /**
     * 
     */
    public function testGeogIsPrimary () {
    	$offering = $this->session->getCourseOffering($this->geogOfferingId);
    	$record = $offering->getCourseOfferingRecord($this->alternatesType);
    	$this->assertFalse($record->isPrimary());
    }
    
    /**
     * 
     */
    public function testGeolIsPrimary () {
    	$offering = $this->session->getCourseOffering($this->geolOfferingId);
    	$record = $offering->getCourseOfferingRecord($this->alternatesType);
    	$this->assertTrue($record->isPrimary());
    }

/*********************************************************
 * Tests for weeklySchedule record.
 *********************************************************/
 
 	/**
     * 
     */
    public function testMeetsOnSunday () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$this->assertFalse($record->meetsOnSunday());
    }
    
    /**
     * 
     */
    public function testGetSundayStartTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getSundayStartTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(0, count($times));
    }
    
    /**
     * 
     */
    public function testGetSundayEndTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getSundayEndTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(0, count($times));
    }
    
    /**
     * 
     */
    public function testMeetsOnMonday () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$this->assertTrue($record->meetsOnMonday());
    }
    
    /**
     * 
     */
    public function testGetMondayStartTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getMondayStartTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(1, count($times));
    	$this->assertEquals(40500, $times[0]);	// 11:15am
    }
    
    /**
     * 
     */
    public function testGetMondayEndTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getMondayEndTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(1, count($times));
    	$this->assertEquals(43500, $times[0]);	// 12:05pm
    }
    
    /**
     * 
     */
    public function testMeetsOnTuesday () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$this->assertFalse($record->meetsOnTuesday());
    }
    
    /**
     * 
     */
    public function testGetTuesdayStartTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getTuesdayStartTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(0, count($times));
    }
    
    /**
     * 
     */
    public function testGetTuesdayEndTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getTuesdayEndTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(0, count($times));
    }

	/**
     * 
     */
    public function testMeetsOnWednesday () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$this->assertTrue($record->meetsOnWednesday());
    }
    
    /**
     * 
     */
    public function testGetWednesdayStartTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getWednesdayStartTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(1, count($times));
    	$this->assertEquals(40500, $times[0]);	// 11:15am
    }
    
    /**
     * 
     */
    public function testGetWednesdayEndTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getWednesdayEndTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(1, count($times));
    	$this->assertEquals(43500, $times[0]);	// 12:05pm
    }
    
    /**
     * 
     */
    public function testMeetsOnThursday () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$this->assertFalse($record->meetsOnThursday());
    }
    
    /**
     * 
     */
    public function testGetThursdayStartTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getThursdayStartTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(0, count($times));
    }
    
    /**
     * 
     */
    public function testGetThursdayEndTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getThursdayEndTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(0, count($times));
    }
    
    /**
     * 
     */
    public function testMeetsOnFriday () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$this->assertTrue($record->meetsOnFriday());
    }
    
    /**
     * 
     */
    public function testGetFridayStartTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getFridayStartTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(1, count($times));
    	$this->assertEquals(40500, $times[0]);	// 11:15am
    }
    
    /**
     * 
     */
    public function testGetFridayEndTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getFridayEndTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(1, count($times));
    	$this->assertEquals(43500, $times[0]);	// 12:05pm
    }
    
    /**
     * 
     */
    public function testMeetsOnSaturday () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$this->assertFalse($record->meetsOnSaturday());
    }
    
    /**
     * 
     */
    public function testGetSaturdayStartTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getSaturdayStartTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(0, count($times));
    }
    
    /**
     * 
     */
    public function testGetSaturdayEndTimes () {
    	$record = $this->object->getCourseOfferingRecord($this->weeklyScheduleType);
    	$times = $record->getSaturdayEndTimes();
    	$this->assertType('array', $times);
    	$this->assertEquals(0, count($times));
    }

}
?>
