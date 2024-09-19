<?php

use PHPUnit\Framework\TestCase;

/**
 * Test class for banner_course_CourseOffering_Search_Search.
 * Generated by PHPUnit on 2009-05-28 at 14:06:08.
 */
class banner_course_CourseOffering_Search_SearchTest extends TestCase
{
    use banner_DatabaseTestTrait;

    /**
     * @var banner_course_CourseOffering_Search_Search
     */
    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function setUp(): void
    {
        $this->wildcardStringMatchType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:search:wildcard');

        $this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->session = self::$courseManager->getCourseOfferingSearchSessionForCatalog($this->mcugId);
        $this->object = $this->session->getCourseOfferingSearch();

        $this->termId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200420');

        $this->query = $this->session->getCourseOfferingQuery();
        $this->query->matchTermId($this->termId, true);

        $this->physOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200890/90143');
        $this->geolOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200420/20663');
        $this->chemOfferingId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:section/200420/20073');

        $this->instructorsType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:instructors');
        $this->otherType = new phpkit_type_URNInetType('urn:inet:middlebury.edu:record:other');
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown(): void
    {
    }

    public function testGetLimitClause()
    {
        $this->assertIsString($this->object->getLimitClause());
        $this->assertEquals('', $this->object->getLimitClause());
    }

    public function testGetOrderByClause()
    {
        $this->assertIsString($this->object->getOrderByClause());
        $this->assertEquals('', $this->object->getOrderByClause());
    }

    public function testGetWhereClause()
    {
        $this->assertIsString($this->object->getWhereClause());
        $this->assertEquals('', $this->object->getWhereClause());
    }

    public function testGetAdditionalTableJoins()
    {
        $this->assertIsArray($this->object->getAdditionalTableJoins());
        $this->assertCount(0, $this->object->getAdditionalTableJoins());
    }

    public function testGetParameters()
    {
        $this->assertIsArray($this->object->getParameters());
        $this->assertCount(0, $this->object->getParameters());
    }

    public function testLimitResultSet()
    {
        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(8, $results->getResultSize());

        $this->object->limitResultSet(1, 5);
        $this->assertEquals('LIMIT 0, 5', $this->object->getLimitClause());

        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(8, $results->getResultSize());

        $this->assertEquals(5, $results->getCourseOfferings()->available());
    }

    public function testLimitResultSet2()
    {
        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(8, $results->getResultSize());

        $this->object->limitResultSet(3, 6);
        $this->assertEquals('LIMIT 2, 4', $this->object->getLimitClause());

        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(8, $results->getResultSize());

        $this->assertEquals(4, $results->getCourseOfferings()->available());
    }

    public function testLimitResultSetInverted()
    {
        $this->expectException(osid_InvalidArgumentException::class);

        $this->object->limitResultSet(10, 1);
    }

    public function testLimitResultSetOutOfRange0()
    {
        $this->expectException(osid_InvalidArgumentException::class);

        $this->object->limitResultSet(0, 10);
    }

    public function testLimitResultSetOutOfRangeN1()
    {
        $this->expectException(osid_InvalidArgumentException::class);

        $this->object->limitResultSet(-1, 10);
    }

    public function testLimitResultSetOutNullStart()
    {
        $this->expectException(osid_NullArgumentException::class);

        $this->object->limitResultSet(null, 10);
    }

    public function testLimitResultSetOutNullEnd()
    {
        $this->expectException(osid_NullArgumentException::class);

        $this->object->limitResultSet(1, null);
    }

    public function testHasSearchRecordType()
    {
        $this->assertFalse($this->object->hasSearchRecordType($this->instructorsType));
        $this->assertFalse($this->object->hasSearchRecordType($this->otherType));
    }

    public function testSearchWithinCourseOfferingResults()
    {
        $query = $this->session->getCourseOfferingQuery();
        $query->matchDisplayName('CHEM*', $this->wildcardStringMatchType, true);
        $allChemResults = $this->session->getCourseOfferingsBySearch($query, $this->object);
        $this->assertInstanceOf('osid_course_CourseOfferingSearchResults', $allChemResults);
        $this->assertEquals(77, $allChemResults->getResultSize());

        $this->object->searchWithinCourseOfferingResults($allChemResults);

        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        //     	print $results->debug();
        $this->assertInstanceOf('osid_course_CourseOfferingSearchResults', $results);
        $this->assertEquals(8, $results->getResultSize());
    }

    public function testSearchAmongCourseOfferings()
    {
        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(8, $results->getResultSize());

        $offerings = new phpkit_id_ArrayIdList([
            $this->physOfferingId,
            $this->geolOfferingId,
            $this->chemOfferingId]);
        $this->object->searchAmongCourseOfferings($offerings);

        $this->assertEquals(
            '((SSBSECT_TERM_CODE = ? AND SSBSECT_CRN = ?)
		OR (SSBSECT_TERM_CODE = ? AND SSBSECT_CRN = ?)
		OR (SSBSECT_TERM_CODE = ? AND SSBSECT_CRN = ?))',
            $this->object->getWhereClause());

        $params = $this->object->getParameters();
        $this->assertEquals('200890', $params[0]);
        $this->assertEquals('90143', $params[1]);
        $this->assertEquals('200420', $params[2]);
        $this->assertEquals('20663', $params[3]);
        $this->assertEquals('200420', $params[4]);
        $this->assertEquals('20073', $params[5]);

        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(1, $results->getResultSize());
    }

    public function testOrderCourseOfferingResults()
    {
        $order = $this->session->getCourseOfferingSearchOrder();
        $order->orderByDisplayName();

        $this->object->orderCourseOfferingResults($order);

        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(8, $results->getResultSize());
    }

    public function testGetCourseOfferingSearchRecord()
    {
        $this->expectException(osid_UnsupportedException::class);

        $this->object->getCourseOfferingSearchRecord($this->otherType);
    }
}
