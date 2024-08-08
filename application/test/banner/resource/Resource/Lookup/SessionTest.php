<?php

/**
 * Test class for banner_resource_Resource_Lookup_Session.
 * Generated by PHPUnit on 2009-05-04 at 11:11:53.
 */
class banner_resource_Resource_Lookup_SessionTest
	extends phpkit_test_phpunit_AbstractOsidSessionTest
{

	use banner_DatabaseTestTrait;

	/**
	 * @var    banner_course_Course_Lookup_Session
	 * @access protected
	 */
	protected $session;

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

	/**
	 * Sets up the fixture, for example, opens a network connection.
	 * This method is called before a test is executed.
	 *
	 * @access protected
	 */
	protected function setUp(): void
	{
		$this->allBinId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:resource/all');
		$this->manager = self::$courseManager->getResourceManager();
		$this->session = $this->manager->getResourceLookupSession();

		$this->personType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:resource/person");
		$this->roomType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:resource/place/room");
		$this->buildingType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:resource/place/building");
		$this->campusType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:resource/place/campus");
		$this->placeType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:genera:resource/place");

		$this->person1Id = new phpkit_id_URNInetId('urn:inet:middlebury.edu:resource/person/WEBID1000002');
		$this->person2Id = new phpkit_id_URNInetId('urn:inet:middlebury.edu:resource/person/WEBID1000007');
		$this->campusId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:resource/place/campus/M');
		$this->buildingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:resource/place/building/MBH');
		$this->roomId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:resource/place/room/MBH/538');

		$this->unknownType = new phpkit_type_URNInetType("urn:inet:osid.org:unknown_type");
		$this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');

	}

	/**
	 * Tears down the fixture, for example, closes a network connection.
	 * This method is called after a test is executed.
	 *
	 * @access protected
	 */
	protected function tearDown(): void
	{
	}

	/**
	 *
	 */
	public function testGetBinId()
	{
		$this->assertInstanceOf('osid_id_Id', $this->session->getBinId());
		$this->assertTrue($this->manager->getCombinedBinId()->isEqual($this->session->getBinId()));
	}

	/**
	 *
	 */
	public function testGetBin()
	{
		$this->assertInstanceOf('osid_resource_Bin', $this->session->getBin());
		$this->assertTrue($this->manager->getCombinedBinId()->isEqual($this->session->getBin()->getId()));
	}

	/**
	 *
	 */
	public function testCanLookupResources()
	{
		$this->assertTrue($this->session->canLookupResources());
	}

	/**
	 *
	 */
	public function testUseComparativeResourceView()
	{
		$this->session->useComparativeResourceView();
		$resources = $this->session->getResourcesByIds(new phpkit_id_ArrayIdList(array(
						$this->person1Id, $this->campusId, $this->buildingId, $this->roomId, $this->unknownId)));
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertEquals(4, $resources->available());
	}

	/**
	 * Should thrown osid_NotFoundExceptions for unknown results.
	 */
	public function testUsePlenaryResourceView()
	{
		$this->expectException(osid_NotFoundException::class);

		$this->session->usePlenaryResourceView();
		$resources = $this->session->getResourcesByIds(new phpkit_id_ArrayIdList(array(
						$this->person1Id, $this->campusId, $this->buildingId, $this->roomId, $this->unknownId)));
	}

	/**
	 *
	 */
	public function testUseFederatedBinView()
	{
		$this->session->useFederatedBinView();
		$this->assertTrue(true, "No unexpected exceptions were thrown.");
	}

	/**
	 *
	 */
	public function testUseIsolatedBinView()
	{
		$this->session->useIsolatedBinView();
		$this->assertTrue(true, "No unexpected exceptions were thrown.");
	}

	/**
	 *
	 */
	public function testGetResource()
	{
		$this->assertInstanceOf('osid_resource_Resource', $this->session->getResource($this->person1Id));
		$this->assertInstanceOf('osid_resource_Resource', $this->session->getResource($this->person2Id));
	}

	/**
	 *
	 */
	public function testGetResourcesByIds()
	{
		$resources = $this->session->getResourcesByIds(new phpkit_id_ArrayIdList(array(
						$this->person1Id, $this->person2Id)));
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertTrue($resources->hasNext());
		$this->assertEquals(2, $resources->available());
		$this->assertInstanceOf('osid_resource_Resource', $resources->getNextResource());
		$this->assertInstanceOf('osid_resource_Resource', $resources->getNextResource());
		$this->assertFalse($resources->hasNext());
		$this->assertEquals(0, $resources->available());
	}

	/**
	 *
	 */
	public function testGetResourcesByUnknownGenusType()
	{
		$resources = $this->session->getResourcesByGenusType($this->unknownType);
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertEquals(0, $resources->available());
	}

	/**
	 *
	 */
	public function testGetResourcesByPersonGenusType()
	{
		$resources = $this->session->getResourcesByGenusType($this->personType);
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertTrue($resources->hasNext());
		$this->assertEquals(14, $resources->available());
		$this->assertInstanceOf('osid_resource_Resource', $resources->getNextResource());
		$resourceGenusType = $resources->getNextResource()->getGenusType();
		$this->assertEquals('genera:resource/person', $resourceGenusType->getIdentifier());
		$this->assertTrue($resourceGenusType->isEqual($this->personType));
	}

	/**
	 *
	 */
	public function testGetResourcesByPlaceGenusType()
	{
		$resources = $this->session->getResourcesByGenusType($this->placeType);
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertEquals(0, $resources->available());
	}

	/**
	 *
	 */
	public function testGetResourcesByParentPlaceGenusType()
	{
		$resources = $this->session->getResourcesByParentGenusType($this->placeType);
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertEquals(13, $resources->available());
		$this->assertTrue($resources->hasNext());

	}

	/**
	 *
	 */
	public function testGetResourcesByCampusGenusType()
	{
		$resources = $this->session->getResourcesByGenusType($this->campusType);
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertEquals(3, $resources->available());
	}

	/**
	 *
	 */
	public function testGetResourcesByBuildingGenusType()
	{
		$resources = $this->session->getResourcesByGenusType($this->buildingType);
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertEquals(1, $resources->available());
	}

	/**
	 *
	 */
	public function testGetResourcesByRoomGenusType()
	{
		$resources = $this->session->getResourcesByGenusType($this->roomType);
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertEquals(9, $resources->available());
	}

	/**
	 *
	 */
	public function testGetResourcesByParentPersonGenusType()
	{
		$resources = $this->session->getResourcesByParentGenusType($this->personType);
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertTrue($resources->hasNext());
		$this->assertEquals(14, $resources->available());
		$this->assertInstanceOf('osid_resource_Resource', $resources->getNextResource());
		$resourceGenusType = $resources->getNextResource()->getGenusType();
		$this->assertEquals('genera:resource/person', $resourceGenusType->getIdentifier());
		$this->assertTrue($resourceGenusType->isEqual($this->personType));
	}

	/**
	 *
	 */
	public function testGetResourcesByRecordType()
	{
		$resources = $this->session->getResourcesByRecordType($this->unknownType);
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertFalse($resources->hasNext());
	}

	/**
	 *
	 */
	public function testGetResources()
	{
		$resources = $this->session->getResources();
		$this->assertInstanceOf('osid_resource_ResourceList', $resources);
		$this->assertTrue($resources->hasNext());
		$this->assertEquals(27, $resources->available());
		$this->assertInstanceOf('osid_resource_Resource', $resources->getNextResource());
	}
}
