<?php

/**
 * Test class for banner_course_Course_Search_Session.
 * Generated by PHPUnit on 2009-10-14 at 13:38:34.
 */
class banner_course_Course_Search_SessionTest extends phpkit_test_phpunit_AbstractOsidSessionTest
{
    use banner_DatabaseTestTrait;

    /**
     * @var banner_course_Course_Lookup_Session
     */
    protected $session;

    protected $mcugId;
    protected $miisId;

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
        $this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog.MCUG');
        $this->miisId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog.MIIS');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');

        $this->session = self::$courseManager->getCourseSearchSessionForCatalog($this->mcugId);

        $this->physId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course.PHYS0201');
        $this->geolId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course.GEOL0250');
        $this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:course.XXXX0101');

        $this->deptTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic.department.PHYS');
        $this->subjTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic.subject.CHEM');
        $this->divTopicId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:topic.division.NSCI');

        $this->unknownType = new phpkit_type_URNInetType('urn:inet:osid.org:unknown_type');

        $this->generaNoneType = new phpkit_type_URNInetType('urn:inet:osid.org:genera:none');
        $this->secondaryType = new phpkit_type_URNInetType('urn:inet:osid.org:genera:secondary');
        $this->undergraduateType = new phpkit_type_URNInetType('urn:inet:osid.org:genera:undergraduate');

        $this->wildcardStringMatchType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:search:wildcard');
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown(): void
    {
        $this->session->close();
    }

    public function testGetCourseCatalogId()
    {
        $id = $this->session->getCourseCatalogId();
        $this->assertInstanceOf('osid_id_Id', $id);
        $this->assertTrue($this->mcugId->isEqual($id));
    }

    public function testGetCourseCatalog()
    {
        $this->assertInstanceOf('osid_course_CourseCatalog', $this->session->getCourseCatalog());
    }

    /**
     * @todo Implement testCanSearchCourses().
     */
    public function testCanSearchCourses()
    {
        $this->assertTrue($this->session->canSearchCourses());
    }

    /**
     * @todo Implement testUseFederatedCourseCatalogView().
     */
    public function testUseFederatedCourseCatalogView()
    {
        $this->session->useFederatedCourseCatalogView();

        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
            'This test has not been implemented yet.'
        );
    }

    /**
     * @todo Implement testUseIsolatedCourseCatalogView().
     */
    public function testUseIsolatedCourseCatalogView()
    {
        $this->session->useIsolatedCourseCatalogView();

        // Remove the following lines when you implement this test.
        $this->markTestIncomplete(
            'This test has not been implemented yet.'
        );
    }

    public function testGetCourseQuery()
    {
        $this->assertInstanceOf('osid_course_CourseQuery', $this->session->getCourseQuery());
    }

    public function testGetCoursesByQuery()
    {
        $query = $this->session->getCourseQuery();
        $query->matchDisplayName('PHYS02*', $this->wildcardStringMatchType, true);

        $courses = $this->session->getCoursesByQuery($query);
        //          print $courses->debug();
        $this->assertInstanceOf('osid_course_CourseList', $courses);
        $this->assertEquals(1, $courses->available());
        $this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
    }

    public function testGetCourseSearch()
    {
        $this->assertInstanceOf('osid_course_CourseSearch', $this->session->getCourseSearch());
    }

    public function testGetCourseSearchOrder()
    {
        $this->assertInstanceOf('osid_course_CourseSearchOrder', $this->session->getCourseSearchOrder());
    }

    public function testGetCoursesBySearch()
    {
        $query = $this->session->getCourseQuery();
        $query->matchDisplayName('*0*', $this->wildcardStringMatchType, true);

        $search = $this->session->getCourseSearch();
        $search->limitResultSet(1, 3);

        $results = $this->session->getCoursesBySearch($query, $search);
        //          print $courses->debug();
        $this->assertInstanceOf('osid_course_CourseSearchResults', $results);
        $this->assertEquals(4, $results->getResultSize());
        $courses = $results->getCourses();
        $this->assertEquals(3, $courses->available());
        $this->assertInstanceOf('osid_course_Course', $courses->getNextCourse());
    }

    public function testGetCoursesBySearchWithOrder()
    {
        $query = $this->session->getCourseQuery();
        $query->matchDisplayName('*0*', $this->wildcardStringMatchType, true);

        $search = $this->session->getCourseSearch();

        $order = $this->session->getCourseSearchOrder();
        $order->orderByTitle();
        $order->ascend();
        $search->orderCourseResults($order);

        // Set up our first result set.
        $results = $this->session->getCoursesBySearch($query, $search);
        $this->assertInstanceOf('osid_course_CourseSearchResults', $results);
        //        	print $results->debug();
        $this->assertEquals(4, $results->getResultSize());

        $courses = $results->getCourses();
        $this->assertEquals(4, $courses->available());
        $firstTitles = [];
        while ($courses->hasNext()) {
            $firstTitles[] = $courses->getNextCourse()->getTitle();
        }
        //        	var_dump($firstTitles);

        // Set up our second result-set.
        $order->descend();
        $search->orderCourseResults($order);

        $results = $this->session->getCoursesBySearch($query, $search);
        $this->assertInstanceOf('osid_course_CourseSearchResults', $results);
        //        	print $results->debug();
        $this->assertEquals(4, $results->getResultSize());

        $courses = $results->getCourses();
        $this->assertEquals(4, $courses->available());
        $secondTitles = [];
        while ($courses->hasNext()) {
            $secondTitles[] = $courses->getNextCourse()->getTitle();
        }
        //        	var_dump($secondTitles);
        $secondTitles = array_reverse($secondTitles);

        // Check that the titles match
        foreach ($firstTitles as $key => $val) {
            $this->assertEquals($val, $secondTitles[$key]);
        }
    }
}
