<?php
require_once 'PHPUnit/Framework.php';

/**
 * Test class for banner_course_CourseOfferingSearch.
 * Generated by PHPUnit on 2009-05-28 at 14:06:08.
 */
class banner_course_CourseOfferingSearchTest extends PHPUnit_Framework_TestCase
{
    /**
     * @var    banner_course_CourseOfferingSearch
     * @access protected
     */
    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     *
     * @access protected
     */
    protected function setUp()
    {
    	$this->wildcardStringMatchType = new phpkit_type_URNInetType("urn:inet:middlebury.edu:search:wildcard");


        $this->manager = $this->sharedFixture['CourseManager'];
    	$this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
        $this->session = $this->manager->getCourseOfferingSearchSessionForCatalog($this->mcugId);
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
     *
     * @access protected
     */
    protected function tearDown()
    {
    }

    /**
     *  
     */
    public function testGetLimitClause()
    {
        $this->assertType('string', $this->object->getLimitClause());
        $this->assertEquals('', $this->object->getLimitClause());
    }

    /**
     *  
     */
    public function testGetOrderByClause()
    {
        $this->assertType('string', $this->object->getOrderByClause());
        $this->assertEquals('', $this->object->getOrderByClause());
    }
    
    /**
     * 
     */
    public function testGetWhereClause()
    {
        $this->assertType('string', $this->object->getWhereClause());
        $this->assertEquals('', $this->object->getWhereClause());
    }

    /**
     *  
     */
    public function testGetAdditionalTableJoins()
    {
        $this->assertType('array', $this->object->getAdditionalTableJoins());
        $this->assertEquals(0, count($this->object->getAdditionalTableJoins()));
        
    }
    
    /**
     * 
     */
    public function testGetParameters()
    {
        $this->assertType('array', $this->object->getParameters());
        $this->assertEquals(0, count($this->object->getParameters()));
    }

    /**
     *  
     */
    public function testLimitResultSet()
    {
    	$results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(12, $results->getResultSize());
        
        $this->object->limitResultSet(1, 10);
        $this->assertEquals('LIMIT 1, 10', $this->object->getLimitClause());
        
        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(12, $results->getResultSize());
        
        $this->assertEquals(10, $results->getCourseOfferings()->available());

    }
    
    /**
     *  @expectedException osid_InvalidArgumentException
     */
    public function testLimitResultSetInverted()
    {
        $this->object->limitResultSet(10, 1);
    }
    
    /**
     *  @expectedException osid_InvalidArgumentException
     */
    public function testLimitResultSetOutOfRange0()
    {
        $this->object->limitResultSet(0, 10);
    }
    
    /**
     *  @expectedException osid_InvalidArgumentException
     */
    public function testLimitResultSetOutOfRangeN1()
    {
        $this->object->limitResultSet(-1, 10);
    }
    
    /**
     *  @expectedException osid_NullArgumentException
     */
    public function testLimitResultSetOutNullStart()
    {
        $this->object->limitResultSet(null, 10);
    }
    
    /**
     *  @expectedException osid_NullArgumentException
     */
    public function testLimitResultSetOutNullEnd()
    {
        $this->object->limitResultSet(1, null);
    }

    /**
     *  
     */
    public function testHasSearchRecordType()
    {
        $this->assertFalse($this->object->hasSearchRecordType($this->instructorsType));
        $this->assertFalse($this->object->hasSearchRecordType($this->otherType));
    }

    /**
     *  
     */
    public function testSearchWithinCourseOfferingResults()
    {
    	$query = $this->session->getCourseOfferingQuery();
    	$query->matchDisplayName('CHEM*', $this->wildcardStringMatchType, true);
    	$allChemResults = $this->session->getCourseOfferingsBySearch($query, $this->object);
        $this->assertType('osid_course_CourseOfferingSearchResults', $allChemResults);
  		$this->assertEquals(85, $allChemResults->getResultSize());
    	
    	$this->object->searchWithinCourseOfferingResults($allChemResults);
    	
    	$results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
//     	print $results->debug();
       	$this->assertType('osid_course_CourseOfferingSearchResults', $results);
        $this->assertEquals(8, $results->getResultSize());
    }

    /**
     *  
     */
    public function testSearchAmongCourseOfferings()
    {
    	$results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(12, $results->getResultSize());
        
        $offerings = new phpkit_id_ArrayIdList(array(
        	$this->physOfferingId,
        	$this->geolOfferingId,
        	$this->chemOfferingId));
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
        $this->assertEquals(2, $results->getResultSize());
    }

    /**
     *  
     */
    public function testOrderCourseOfferingResults()
    {
    	$order = $this->session->getCourseOfferingSearchOrder();
   		$order->orderByDisplayName();
        
        $this->object->orderCourseOfferingResults($order);
        
        $results = $this->session->getCourseOfferingsBySearch($this->query, $this->object);
        $this->assertEquals(12, $results->getResultSize());
    }

    /**
     *  @expectedException osid_UnsupportedException
     */
    public function testGetCourseOfferingSearchRecord()
    {
        $this->object->getCourseOfferingSearchRecord($this->otherType);
    }
}
?>
