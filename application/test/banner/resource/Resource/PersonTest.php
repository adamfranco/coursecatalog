<?php

/**
 * Test class for banner_resource_Resource_Person.
 * Generated by PHPUnit on 2009-05-01 at 13:58:25.
 */
class banner_resource_Resource_PersonTest
	extends phpkit_test_phpunit_AbstractOsidObjectTest
{
    /**
     * @var    banner_resource_Resource_Person
     * @access protected
     */
    protected $object;
    
    /**
     * @var    banner_resource_Resource_Person
     * @access protected
     */
    protected $object2;
	
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
        $this->namesType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:person_names');
        $this->unknownType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:unknown');
        $this->personType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:resource/person");

        $this->object = new banner_resource_Resource_Person(
        	new phpkit_id_Id('urn', 'middlebury.edu', 'person/12345'),
        	"O'Brien",
        	"Thaddeus",
        	"Peter Michael",
        	"III",
        	"Dr.",
        	"Ph.D."
        );
        $this->names = $this->object->getResourceRecord($this->namesType);
        
        $this->object2 = new banner_resource_Resource_Person(
        	new phpkit_id_Id('urn', 'middlebury.edu', 'person/54321'),
        	"Jones",
        	"Howard"
        );
        $this->names2 = $this->object2->getResourceRecord($this->namesType);
        
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
    public function testIsGroup()
    {
        $this->assertFalse($this->object->isGroup());
    }
    
    /**
     *
     */
    public function testHasRecordType()
    {
        $this->assertTrue($this->object->hasRecordType($this->namesType));
    }

    /**
     *
     */
    public function testGetResourceRecord()
    {
        $names = $this->object->getResourceRecord($this->namesType);
        $this->assertInstanceOf('middlebury_resource_Resource_PersonNamesRecord', $names);
    }

    /**
     * 
     */
    public function testImplementsRecordType()
    {
        $this->assertTrue($this->names->implementsRecordType($this->namesType));
        $this->assertFalse($this->names->implementsRecordType($this->unknownType));
    }

    /**
     * 
     */
    public function testGetResource()
    {
        $resource = $this->names->getResource();
        $this->assertInstanceOf('middlebury_resource_Resource_PersonNamesRecord', $resource);
    }

    /**
     * 
     */
    public function testGetGivenName()
    {
        $this->assertEquals('Thaddeus', $this->names->getGivenName());
        $this->assertEquals('Howard', $this->names2->getGivenName());
    }

    /**
     * 
     */
    public function testGetSurname()
    {
        $this->assertEquals('O\'Brien', $this->names->getSurname());
        $this->assertEquals('Jones', $this->names2->getSurname());
    }

    /**
     * 
     */
    public function testGetMiddleNames()
    {
        $this->assertEquals('Peter Michael', $this->names->getMiddleNames());
        $this->assertEquals('', $this->names2->getMiddleNames());
    }

    /**
     * 
     */
    public function testGetMiddleInitials()
    {
        $this->assertEquals('P.M.', $this->names->getMiddleInitials());
        $this->assertEquals('', $this->names2->getMiddleInitials());
    }

    /**
     * 
     */
    public function testGetNameSuffix()
    {
       $this->assertEquals('III', $this->names->getNameSuffix());
       $this->assertEquals('', $this->names2->getNameSuffix());
    }

    /**
     * 
     */
    public function testGetPrefixTitle()
    {
        $this->assertEquals('Dr.', $this->names->getPrefixTitle());
        $this->assertEquals('', $this->names2->getPrefixTitle());
    }

    /**
     * 
     */
    public function testGetSuffixTitle()
    {
        $this->assertEquals('Ph.D.', $this->names->getSuffixTitle());
        $this->assertEquals('', $this->names2->getSuffixTitle());
    }
    
    /**
     * 
     */
    public function testGetDisplayName()
    {
        $this->assertEquals('Dr. Thaddeus Peter Michael O\'Brien III, Ph.D.', $this->names->getDisplayName());
        $this->assertEquals('Howard Jones', $this->names2->getDisplayName());
    }
    
    public function testGetGenusType()
    {
    	$type = $this->object->getGenusType();
    	$this->assertInstanceOf('osid_type_Type', $type);
    	$this->assertEquals('urn', $type->getIdentifierNamespace());
    	$this->assertEquals('middlebury.edu', $type->getAuthority());
    	$this->assertEquals('genera:resource/person', $type->getIdentifier());
    	$this->assertTrue($type->isEqual($this->personType));
    }
}
?>
