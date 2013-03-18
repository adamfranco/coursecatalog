<?php

/**
 * Test class for banner_resource_Bin_Lookup_Session.
 * Generated by PHPUnit on 2010-05-20 at 14:39:12.
 */
class banner_resource_Bin_Lookup_SessionTest 
	extends phpkit_test_phpunit_AbstractOsidSessionTest
{
	/**
     * @var    banner_resource_Bin_Lookup_Session
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
	
	static $runtimeManager;
	static $courseManager;

	public static function setUpBeforeClass() 
	{
		self::$runtimeManager = new phpkit_AutoloadOsidRuntimeManager(realpath(dirname(__FILE__).'/../../../').'/configuration.plist');
		self::$courseManager = self::$runtimeManager->getManager(osid_OSID::COURSE(), 'banner_course_CourseManager', '3.0.0');
	}

	public static function tearDownAfterClass()
	{
	    self::$courseManager->shutdown();
	    self::$runtimeManager->shutdown();
	}
	
    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     *
     * @access protected
     */
    protected function setUp()
    {
		$this->manager = self::$courseManager->getResourceManager();
        $this->session = $this->manager->getBinLookupSession();
        
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
     * 
     */
    public function testCanLookupBins()
    {
        $this->assertTrue($this->session->canLookupBins());
    }

    /**
     * 
     */
    public function testUseComparativeBinView()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * 
     */
    public function testUsePlenaryBinView()
    {
        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
          'This test has not been implemented yet.'
        );
    }

    /**
     * 
     */
    public function testGetBin()
    {
        $this->assertInstanceOf('osid_resource_Bin', $this->session->getBin($this->mcugId));
        $this->assertInstanceOf('osid_resource_Bin', $this->session->getBin($this->miisId));
        try {
        	$bin = $this->session->getBin($this->unknownId);
        	$this->fail('An osid_NotFoundException should have been thrown.');
        } catch (osid_NotFoundException $e) {
        	$this->assertTrue(true);
        }
    }

    /**
     * 
     */
    public function testGetBinsByIds()
    {
        $this->session->useComparativeBinView();
        $bins = $this->session->getBinsByIds(new phpkit_id_ArrayIdList(array(
       					$this->mcugId,
       					$this->miisId)));
       	$this->assertInstanceOf('osid_resource_BinList', $bins);
        $this->assertEquals(2, $bins->available());
    }

    /**
     * 
     */
    public function testGetBinsByGenusType()
    {
        $bins = $this->session->getBinsByGenusType($this->generaNoneType);
       	$this->assertInstanceOf('osid_resource_BinList', $bins);
       	$this->assertTrue($bins->hasNext());
       	
       	$bins = $this->session->getBinsByGenusType($this->secondaryType);
       	$this->assertInstanceOf('osid_resource_BinList', $bins);
       	$this->assertFalse($bins->hasNext());
    }

    /**
     * 
     */
    public function testGetBinsByParentGenusType()
    {
        $bins = $this->session->getBinsByParentGenusType($this->generaNoneType);
       	$this->assertInstanceOf('osid_resource_BinList', $bins);
       	$this->assertTrue($bins->hasNext());
       	
       	$bins = $this->session->getBinsByParentGenusType($this->secondaryType);
       	$this->assertInstanceOf('osid_resource_BinList', $bins);
       	$this->assertFalse($bins->hasNext());
    }

    /**
     * 
     */
    public function testGetBinsByRecordType()
    {
        $bins = $this->session->getBinsByRecordType($this->unknownType);
       	$this->assertInstanceOf('osid_resource_BinList', $bins);
       	$this->assertFalse($bins->hasNext());
    }

    /**
     * 
     */
    public function testGetBins()
    {
        $bins = $this->session->getBins();
       	$this->assertInstanceOf('osid_resource_BinList', $bins);
       	$this->assertTrue($bins->hasNext());
    }
}
?>
