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
    	$this->chemOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200520/20022');
    	$this->manager = $this->sharedFixture['CourseManager'];
        $this->session = $this->manager->getCourseOfferingLookupSessionForCatalog($this->mcugCatalogId);
        $this->object = $this->session->getCourseOffering($this->physOfferingId);
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
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
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
}
?>
