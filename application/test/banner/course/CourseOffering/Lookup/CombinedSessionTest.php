<?php

/**
 * Test class for banner_course_CourseOffering_Lookup_Session.
 * Generated by PHPUnit on 2009-04-17 at 14:47:28.
 */
class banner_course_CourseOffering_Lookup_CombinedSessionTest extends phpkit_test_phpunit_AbstractOsidSessionTest
{
    use banner_DatabaseTestTrait;

    /**
     * @var banner_course_CourseCatalog_Lookup_Session
     */
    protected $session;

    /**
     * Answer the session object to test.
     *
     * @return osid_OsidSession
     *
     * @since 4/15/09
     */
    protected function getSession()
    {
        return $this->session;
    }

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function setUp(): void
    {
        $this->allId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/all');
        $this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MIIS');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');

        $this->session = self::$courseManager->getCourseOfferingLookupSession();
        $this->session->useFederatedCourseCatalogView();

        $this->physId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/PHYS0201');
        $this->mathId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/MATH0300');
        $this->chemId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/CHEM0104');

        $this->physOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200890/90143');
        $this->geolOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200420/20663');
        $this->unknownOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/178293/2101');

        $this->termId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200890');

        $this->physDeptTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/department/PHYS');
        $this->chemDeptTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/department/CHEM');
        $this->physSubjTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/subject/PHYS');
        $this->chemSubjTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/subject/CHEM');
        $this->dedReqTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/requirement/DED');
        $this->sciReqTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic/requirement/SCI');

        $this->unknownType = new phpkit_type_URNInetType('urn:inet:osid.org:unknown_type');

        $this->generaNoneType = new phpkit_type_URNInetType('urn:inet:osid.org:genera:none');
        $this->secondaryType = new phpkit_type_URNInetType('urn:inet:osid.org:genera:secondary');
        $this->undergraduateType = new phpkit_type_URNInetType('urn:inet:osid.org:genera:undergraduate');

        $this->lectureType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:genera:offering/LCT');
        $this->labType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:genera:offering/LAB');
        $this->discussionType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:genera:offering/DSC');
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown(): void
    {
    }

    public function testGetCourseCatalogId()
    {
        $this->assertInstanceOf('osid_id_Id', $this->session->getCourseCatalogId());
        $this->assertTrue($this->allId->isEqual($this->session->getCourseCatalogId()));
    }

    public function testGetCourseCatalog()
    {
        $this->assertInstanceOf('osid_course_CourseCatalog', $this->session->getCourseCatalog());
        $this->assertTrue($this->allId->isEqual($this->session->getCourseCatalog()->getId()));
    }

    public function testCanLookupCourseOfferings()
    {
        $this->assertTrue($this->session->canLookupCourseOfferings());
    }

    public function testUseComparativeCourseOfferingView()
    {
        $this->session->useComparativeCourseOfferingView();
        $offerings = $this->session->getCourseOfferingsByIds(new phpkit_id_ArrayIdList([
            $this->physOfferingId,
            $this->geolOfferingId,
            $this->unknownOfferingId]));
        $this->assertEquals(2, $offerings->available());
    }

    /**
     * Should thrown osid_NotFoundExceptions for unknown results.
     */
    public function testUsePlenaryCourseOfferingView()
    {
        $this->expectException(osid_NotFoundException::class);

        $this->session->usePlenaryCourseOfferingView();
        $offerings = $this->session->getCourseOfferingsByIds(new phpkit_id_ArrayIdList([
            $this->physOfferingId,
            $this->geolOfferingId,
            $this->unknownOfferingId]));
    }

    public function testUseFederatedCourseCatalogView()
    {
        $this->session->useComparativeCourseOfferingView();
        $this->session->useFederatedCourseCatalogView();
        $offerings = $this->session->getCourseOfferingsByIds(new phpkit_id_ArrayIdList([
            $this->physOfferingId,
            $this->geolOfferingId,
            $this->unknownOfferingId]));
        $this->assertEquals(2, $offerings->available());

        $this->session->usePlenaryCourseOfferingView();
        try {
            $offerings = $this->session->getCourseOfferingsByIds(new phpkit_id_ArrayIdList([
                $this->physOfferingId,
                $this->geolOfferingId,
                $this->unknownOfferingId]));
            $this->fail('should have thrown an osid_NotFoundException.');
        } catch (osid_NotFoundException $e) {
            $this->assertTrue(true);
        }
    }

    public function testUseIsolatedCourseCatalogView()
    {
        $this->session->useComparativeCourseOfferingView();
        $this->session->useIsolatedCourseCatalogView();
        $offerings = $this->session->getCourseOfferingsByIds(new phpkit_id_ArrayIdList([
            $this->physOfferingId,
            $this->geolOfferingId,
            $this->unknownOfferingId]));
        $this->assertEquals(0, $offerings->available());

        $this->session->usePlenaryCourseOfferingView();
        try {
            $offerings = $this->session->getCourseOfferingsByIds(new phpkit_id_ArrayIdList([
                $this->physOfferingId,
                $this->geolOfferingId,
                $this->unknownOfferingId]));
            $this->fail('Should have thrown an osid_NotFoundException');
        } catch (osid_NotFoundException $e) {
            $this->assertTrue(true);
        }

        $this->session->useComparativeCourseOfferingView();
        $offerings = $this->session->getCourseOfferingsByIds(new phpkit_id_ArrayIdList([
            $this->physOfferingId,
            $this->geolOfferingId]));
        $this->assertEquals(0, $offerings->available());

        $this->session->usePlenaryCourseOfferingView();
        try {
            $offerings = $this->session->getCourseOfferingsByIds(new phpkit_id_ArrayIdList([
                $this->physOfferingId,
                $this->geolOfferingId]));
            $this->fail('Should have thrown an osid_NotFoundException');
        } catch (osid_NotFoundException $e) {
            $this->assertTrue(true);
        }
    }

    public function testGetCourseOffering()
    {
        $this->assertInstanceOf('osid_course_CourseOffering', $this->session->getCourseOffering($this->physOfferingId));
    }

    public function testGetCourseOfferingsByIds()
    {
        $offerings = $this->session->getCourseOfferingsByIds(new phpkit_id_ArrayIdList([
            $this->physOfferingId,
            $this->geolOfferingId]));
        $this->assertEquals(2, $offerings->available());
        while ($offerings->hasNext()) {
            $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
        }
    }

    public function testGetCourseOfferingsByGenusType()
    {
        $offerings = $this->session->getCourseOfferingsByGenusType($this->generaNoneType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertFalse($offerings->hasNext());

        $offerings = $this->session->getCourseOfferingsByGenusType($this->secondaryType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertFalse($offerings->hasNext());

        $offerings = $this->session->getCourseOfferingsByGenusType($this->lectureType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertTrue($offerings->hasNext());
        $this->assertEquals(24, $offerings->available());

        $offerings = $this->session->getCourseOfferingsByGenusType($this->labType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertTrue($offerings->hasNext());
        $this->assertEquals(45, $offerings->available());

        $offerings = $this->session->getCourseOfferingsByGenusType($this->discussionType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertTrue($offerings->hasNext());
        $this->assertEquals(25, $offerings->available());
    }

    public function testGetCourseOfferingsByParentGenusType()
    {
        $offerings = $this->session->getCourseOfferingsByParentGenusType($this->generaNoneType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertFalse($offerings->hasNext());

        $offerings = $this->session->getCourseOfferingsByParentGenusType($this->secondaryType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertFalse($offerings->hasNext());

        $offerings = $this->session->getCourseOfferingsByParentGenusType($this->lectureType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertTrue($offerings->hasNext());
        $this->assertEquals(24, $offerings->available());

        $offerings = $this->session->getCourseOfferingsByParentGenusType($this->labType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertTrue($offerings->hasNext());
        $this->assertEquals(45, $offerings->available());

        $offerings = $this->session->getCourseOfferingsByParentGenusType($this->discussionType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertTrue($offerings->hasNext());
        $this->assertEquals(25, $offerings->available());
    }

    public function testGetCourseOfferingsByRecordType()
    {
        $offerings = $this->session->getCourseOfferingsByRecordType($this->unknownType);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertFalse($offerings->hasNext());
    }

    public function testGetCourseOfferingsForCourse()
    {
        $offerings = $this->session->getCourseOfferingsForCourse($this->physId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(7, $offerings->available());
        while ($offerings->hasNext()) {
            $offering = $offerings->getNextCourseOffering();
            $this->assertTrue($this->physId->isEqual($offering->getCourseId()));
        }
    }

    public function testGetCourseOfferingsByTerm()
    {
        $offerings = $this->session->getCourseOfferingsByTerm($this->termId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(9, $offerings->available());
        $i = 0;
        while ($offerings->hasNext() && $i < 10) {
            $offering = $offerings->getNextCourseOffering();
            $this->assertTrue($this->termId->isEqual($offering->getTermId()));
            ++$i;
        }
    }

    public function testGetCourseOfferingsByTermForCourse()
    {
        $offerings = $this->session->getCourseOfferingsByTermForCourse($this->termId, $this->physId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(1, $offerings->available());
        while ($offerings->hasNext()) {
            $offering = $offerings->getNextCourseOffering();
            $this->assertTrue($this->termId->isEqual($offering->getTermId()));
            $this->assertTrue($this->physId->isEqual($offering->getCourseId()));
        }

        $offerings = $this->session->getCourseOfferingsByTermForCourse($this->termId, $this->chemId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(4, $offerings->available());
        while ($offerings->hasNext()) {
            $offering = $offerings->getNextCourseOffering();
            $this->assertTrue($this->termId->isEqual($offering->getTermId()));
            $this->assertTrue($this->chemId->isEqual($offering->getCourseId()));
        }
    }

    public function testPhysDeptGetCourseOfferingsByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTopic($this->physDeptTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(7, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testChemDeptGetCourseOfferingsByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTopic($this->chemDeptTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(77, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testPhysDeptGetCourseOfferingsByTermByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTermByTopic($this->termId, $this->physDeptTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(1, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testChemDeptGetCourseOfferingsByTermByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTermByTopic($this->termId, $this->chemDeptTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(4, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testPhysSubjGetCourseOfferingsByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTopic($this->physSubjTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(7, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testChemSubjGetCourseOfferingsByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTopic($this->chemSubjTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(77, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testPhysSubjGetCourseOfferingsByTermByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTermByTopic($this->termId, $this->physSubjTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(1, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testChemSubjGetCourseOfferingsByTermByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTermByTopic($this->termId, $this->chemSubjTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(4, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testReqGetCourseOfferingsByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTopic($this->dedReqTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(26, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testReqGetCourseOfferingsByTermByTopic()
    {
        $offerings = $this->session->getCourseOfferingsByTermByTopic($this->termId, $this->dedReqTopicId);
        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(4, $offerings->available());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
    }

    public function testGetCourseOfferings()
    {
        $offerings = $this->session->getCourseOfferings();

        $this->assertInstanceOf('osid_course_CourseOfferingList', $offerings);
        $this->assertEquals(95, $offerings->available());

        $this->assertTrue($offerings->hasNext());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());

        $offerings->skip($offerings->available() - 1);
        $this->assertTrue($offerings->hasNext());
        $this->assertInstanceOf('osid_course_CourseOffering', $offerings->getNextCourseOffering());
        $this->assertFalse($offerings->hasNext());
    }
}
