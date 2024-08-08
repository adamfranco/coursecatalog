<?php

/**
 * Test class for banner_course_Course_Lookup_Session.
 * Generated by PHPUnit on 2009-04-15 at 11:59:13.
 */
class banner_course_Course_Lookup_SessionTest
	extends phpkit_test_phpunit_AbstractOsidSessionTest
{

	use banner_DatabaseTestTrait;


	/**
	 * @var    banner_course_Course_Lookup_Session
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

	/**
	 * Sets up the fixture, for example, opens a network connection.
	 * This method is called before a test is executed.
	 *
	 * @access protected
	 */
	protected function setUp(): void
	{
		$this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
		$this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MIIS');
		$this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');

		$this->session = self::$courseManager->getCourseLookupSessionForCatalog($this->mcugId);

		$this->physId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/PHYS0201');
		$this->geolId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/GEOL0250');
		$this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/XXXX0101');

		$this->deptTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/department/PHYS');
		$this->subjTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/subject/CHEM');
		$this->divTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/division/NSCI');

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
	protected function tearDown(): void
	{
		$this->session->close();
	}

	/**
	 *
	 */
	public function testGetCourseCatalogId()
	{
		$id = $this->session->getCourseCatalogId();
		$this->assertInstanceOf('osid_id_Id', $id);
		$this->assertTrue($this->mcugId->isEqual($id));
	}

	/**
	 *
	 */
	public function testGetCourseCatalog()
	{
		$this->assertInstanceOf('osid_course_CourseCatalog', $this->session->getCourseCatalog());
	}

	/**
	 *
	 */
	public function testCanLookupCourses()
	{
		$this->assertTrue($this->session->canLookupCourses());
	}

	/**
	 *
	 */
	public function testUseComparativeCourseView()
	{
	$this->session->useComparativeCourseView();
	$courses = $this->session->getCoursesByIds(new phpkit_id_ArrayIdList(array(
						$this->physId,
						$this->geolId,
						$this->unknownId)));
	$this->assertEquals(2, $courses->available());
	}

	/**
	 * Should thrown osid_NotFoundExceptions for unknown results.
	 * @expectedException osid_NotFoundException
	 */
	public function testUsePlenaryCourseView()
	{
		$this->session->usePlenaryCourseView();
		$courses = $this->session->getCoursesByIds(new phpkit_id_ArrayIdList(array(
						$this->physId,
						$this->geolId,
						$this->unknownId)));
	}

	/**
	 * @todo Implement testUseFederatedCourseCatalogView().
	 */
	public function testUseFederatedCourseCatalogView()
	{
		$this->session->useComparativeCourseView();
		$this->session->useFederatedCourseCatalogView();
		$courses = $this->session->getCoursesByIds(new phpkit_id_ArrayIdList(array(
						$this->physId,
						$this->geolId,
						$this->unknownId)));
		$this->assertEquals(2, $courses->available());

		$this->session->usePlenaryCourseView();
		try {
			$courses = $this->session->getCoursesByIds(new phpkit_id_ArrayIdList(array(
						$this->physId,
						$this->geolId,
						$this->unknownId)));
			$this->fail('should have thrown an osid_NotFoundException.');
		} catch (osid_NotFoundException $e) {
			$this->assertTrue(true);
		}
	}

	/**
	 * @todo Implement testUseIsolatedCourseCatalogView().
	 */
	public function testUseIsolatedCourseCatalogView()
	{
		$this->session->useComparativeCourseView();
		$this->session->useIsolatedCourseCatalogView();
		$courses = $this->session->getCoursesByIds(new phpkit_id_ArrayIdList(array(
						$this->physId,
						$this->geolId,
						$this->unknownId)));
		$this->assertEquals(2, $courses->available());

		$this->session->usePlenaryCourseView();
		try {
			$courses = $this->session->getCoursesByIds(new phpkit_id_ArrayIdList(array(
						$this->physId,
						$this->geolId,
						$this->unknownId)));
			$this->fail('Should have thrown an osid_NotFoundException');
		} catch (osid_NotFoundException $e) {
			$this->assertTrue(true);
		}

		$this->session->usePlenaryCourseView();
		$courses = $this->session->getCoursesByIds(new phpkit_id_ArrayIdList(array(
					$this->physId,
					$this->geolId)));
		$this->assertEquals(2, $courses->available());

	}

	/**
	 * @todo Implement testGetCourse().
	 */
	public function testGetCourse()
	{
		$this->assertInstanceOf('osid_course_Course', $this->session->getCourse($this->physId));
	}

	/**
	 * @todo Implement testGetCoursesByIds().
	 */
	public function testGetCoursesByIds()
	{
		$this->session->usePlenaryCourseView();
		$courses = $this->session->getCoursesByIds(new phpkit_id_ArrayIdList(array(
						$this->physId,
						$this->geolId)));
		$this->assertInstanceOf('osid_course_CourseList', $courses);
		$this->assertEquals(2, $courses->available());
		$this->assertTrue($courses->hasNext());
		$this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
		$this->assertTrue($courses->hasNext());
		$this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
		$this->assertFalse($courses->hasNext());
	}

	/**
	 * @todo Implement testGetCoursesByGenusType().
	 */
	public function testGetCoursesByGenusType()
	{
		$courses = $this->session->getCoursesByGenusType($this->generaNoneType);
		$this->assertInstanceOf('osid_course_CourseList', $courses);
		$this->assertTrue($courses->hasNext());

		$courses = $this->session->getCoursesByGenusType($this->secondaryType);
		$this->assertInstanceOf('osid_course_CourseList', $courses);
		$this->assertFalse($courses->hasNext());
	}

	/**
	 * @todo Implement testGetCoursesByParentGenusType().
	 */
	public function testGetCoursesByParentGenusType()
	{
		$courses = $this->session->getCoursesByParentGenusType($this->generaNoneType);
		$this->assertInstanceOf('osid_course_CourseList', $courses);
		$this->assertTrue($courses->hasNext());

		$courses = $this->session->getCoursesByParentGenusType($this->secondaryType);
		$this->assertInstanceOf('osid_course_CourseList', $courses);
		$this->assertFalse($courses->hasNext());
	}

	/**
	 * @todo Implement testGetCoursesByRecordType().
	 */
	public function testGetCoursesByRecordType()
	{
		$courses = $this->session->getCoursesByRecordType($this->unknownType);
		$this->assertInstanceOf('osid_course_CourseList', $courses);
		$this->assertFalse($courses->hasNext());
	}

	/**
	 *
	 */
	public function testDeptGetCoursesByTopic()
	{
		$courses = $this->session->getCoursesByTopic($this->deptTopicId);
		$this->assertInstanceOf('osid_course_CourseList', $courses);
		$this->assertEquals(1, $courses->available());
		$this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
	}

	/**
	 *
	 */
	public function testSubjGetCoursesByTopic()
	{
		$courses = $this->session->getCoursesByTopic($this->subjTopicId);
		$this->assertInstanceOf('osid_course_CourseList', $courses);
		$this->assertEquals(1, $courses->available());
		$this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
	}

	/**
	 *
	 */
	public function testDivGetCoursesByTopic()
	{
		$courses = $this->session->getCoursesByTopic($this->divTopicId);
		$this->assertInstanceOf('osid_course_CourseList', $courses);
		$this->assertEquals(3, $courses->available());
		$this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
	}

	/**
	 * @todo Implement testGetCourses().
	 */
	public function testGetCourses()
	{
		$courses = $this->session->getCourses();
		$this->assertInstanceOf('osid_course_CourseList', $courses);

		$this->assertEquals(4, $courses->available());

		$this->assertTrue($courses->hasNext());
		$this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());

		$courses->skip($courses->available() - 1);
		$this->assertTrue($courses->hasNext());
		$this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
		$this->assertFalse($courses->hasNext());
	}
}
