<?php

/**
 * Test class for banner_course_CourseCatalog.
 * Generated by PHPUnit on 2009-04-15 at 15:42:30.
 */
class banner_course_CourseCatalogTest extends phpkit_test_phpunit_AbstractOsidObjectTest
{
    use banner_DatabaseTestTrait;

    /**
     * @var banner_course_CourseCatalog
     */
    protected $object;

    /**
     * @var banner_course_Course_Lookup_Session
     */
    protected $session;

    protected $mcugId;
    protected $miisId;

    /**
     * Answer the Object to test.
     *
     * @return osid_OsidObject
     *
     * @since 4/15/09
     */
    protected function getObject()
    {
        return $this->object;
    }

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function setUp(): void
    {
        $this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MIIS');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');

        $this->session = self::$courseManager->getCourseLookupSessionForCatalog($this->mcugId);

        $this->object = $this->session->getCourseCatalog($this->mcugId);

        $this->physId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/PHYS0201');
        $this->mathId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/MATH0300');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course/XXXX0101');

        $this->unknownType = new phpkit_type_URNInetType('urn:inet:osid.org:unknown_type');

        $this->generaNoneType = new phpkit_type_URNInetType('urn:inet:osid.org:genera:none');
        $this->secondaryType = new phpkit_type_URNInetType('urn:inet:osid.org:genera:secondary');
        $this->undergraduateType = new phpkit_type_URNInetType('urn:inet:osid.org:genera:undergraduate');
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown(): void
    {
        $this->session->close();
    }

    /**
     * @todo Implement testGetCourseCatalogRecord().
     */
    public function testGetCourseCatalogRecord()
    {
        $types = $this->object->getRecordTypes();
        $this->assertIsBool($types->hasNext());
        while ($types->hasNext()) {
            $this->assertInstanceOf('osid_course_CourseCatalogRecord', $this->object->getCourseRecord($types->getNextType()));
        }
    }
}
