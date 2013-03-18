<?php

/**
 * Test class for banner_course_Term.
 * Generated by PHPUnit on 2009-04-28 at 15:30:09.
 */
class banner_course_TermTest
	extends phpkit_test_phpunit_AbstractOsidObjectTest
{
    /**
     * @var    banner_course_Term
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
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');
        $this->termId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200890');
        
        $this->manager = $this->sharedFixture['CourseManager'];
        $this->session = $this->manager->getTermLookupSessionForCatalog($this->mcugId);
        $this->object = $this->session->getTerm($this->termId);
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
    public function testDisplayName()
    {
        $this->assertEquals('Fall 2008', $this->object->getDisplayName());
    }
	
    /**
     *
     */
    public function testGetDisplayLabel()
    {
        $this->assertEquals('Fall 2008', $this->object->getDisplayLabel());
    }

    /**
     * 
     */
    public function testGetStartTime()
    {
        $date = $this->object->getStartTime();
        $this->assertInstanceOf('DateTime', $date);
        $this->assertEquals(new DateTime('2008-09-08'), $date);
    }

    /**
     * 
     */
    public function testGetEndTime()
    {
        $date = $this->object->getStartTime();
        $this->assertInstanceOf('DateTime', $date);
        $this->assertEquals(new DateTime('2008-12-16'), $date);
    }

    /**
     * 
     */
    public function testHasCalendar()
    {
        $this->assertFalse($this->object->hasCalendar());
    }

    /**
     * @expectedException osid_IllegalStateException
     */
    public function testGetCalendarId()
    {
        $this->object->getCalendarId();
    }

    /**
     * @expectedException osid_IllegalStateException
     */
    public function testGetCalendar()
    {
        $this->object->getCalendar();
    }

    /**
     *
     */
    public function testGetTermRecord()
    {
        $types = $this->object->getRecordTypes();
    	while ($types->hasNext()) {
	        $this->assertInstanceOf('osid_course_CourseRecord', $this->object->getTermRecord($types->getNextType()));
	    }
    }
}
?>
