<?php

/**
 * Test class for banner_course_Term_Lookup_Session.
 * Generated by PHPUnit on 2009-04-28 at 15:30:04.
 */
class banner_course_Term_Lookup_CombinedSessionTest
	extends phpkit_test_phpunit_AbstractOsidSessionTest
{
	/**
	 * @var    banner_course_CourseCatalog_Lookup_Session
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
		$this->mcugId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:catalog/MCUG');
		$this->unknownId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:unknown_id');
		$this->termId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200890');
		$this->springTermId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200920');
		$this->badTermId = new phpkit_id_URNInetId('urn:inet:middlebury.edu:term/200866');

		$this->session = self::$courseManager->getTermLookupSession();
		$this->session->useComparativeView();
		$this->session->useFederatedCourseCatalogView();

		$this->unknownType = new phpkit_type_URNInetType("urn:inet:osid.org:unknown_type");
		$this->generaNoneType = new phpkit_type_URNInetType("urn:inet:osid.org:genera:none");
		$this->secondaryType = new phpkit_type_URNInetType("urn:inet:osid.org:genera:secondary");
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
	public function testGetCourseCatalogId()
	{
		$this->assertInstanceOf('osid_id_Id', $this->session->getCourseCatalogId());
//         $this->assertTrue($this->manager->getCombinedCatalogId()->isEqual($this->session->getCourseCatalogId()));
	}

	/**
	 *
	 */
	public function testGetCourseCatalog()
	{
		$this->assertInstanceOf('osid_course_CourseCatalog', $this->session->getCourseCatalog());
//         $this->assertTrue($this->manager->getCombinedCatalogId()->isEqual($this->session->getCourseCatalog()->getId()));
	}

	/**
	 *
	 */
	public function testCanLookupTerms()
	{
		$this->assertTrue($this->session->canLookupTerms());
	}

	/**
	 *
	 */
	public function testUseComparativeTermView()
	{
		$this->session->useFederatedCourseCatalogView();
		$this->session->useComparativeTermView();
		$terms = $this->session->getTermsByIds(new phpkit_id_ArrayIdList(array(
					$this->termId,
					$this->springTermId,
					$this->unknownId)));
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertEquals(2, $terms->available());
	}

	/**
	 * @expectedException osid_NotFoundException
	 */
	public function testUsePlenaryTermView()
	{
		$this->session->usePlenaryTermView();
		$this->session->useFederatedCourseCatalogView();
		$terms = $this->session->getTermsByIds(new phpkit_id_ArrayIdList(array(
					$this->termId,
					$this->springTermId,
					$this->unknownId)));
	}

	/**
	 *
	 */
	public function testUseFederatedCourseCatalogView()
	{
		$this->session->usePlenaryTermView();
		$this->session->useFederatedCourseCatalogView();

		$term = $this->session->getTerm($this->termId);
		$this->assertInstanceOf('osid_course_Term', $term);
	}

	/**
	 * @expectedException osid_NotFoundException
	 */
	public function testUseIsolatedCourseCatalogView()
	{
		$this->session->usePlenaryTermView();
		$this->session->useIsolatedCourseCatalogView();

		$term = $this->session->getTerm($this->termId);
		$this->assertInstanceOf('osid_course_Term', $term);
	}

	/**
	 *
	 */
	public function testIsolatedCourseCatalogViewGetTerms()
	{
		$this->session->usePlenaryTermView();
		$this->session->useIsolatedCourseCatalogView();

		$terms = $this->session->getTerms();
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertEquals(0, $terms->available());
	}

	/**
	 *
	 */
	public function testIsolatedCourseCatalogViewGetTermsByIds()
	{
		$this->session->useComparativeTermView();
		$this->session->useIsolatedCourseCatalogView();

		$terms = $this->session->getTermsByIds(new phpkit_id_ArrayIdList(array(
					$this->termId,
					$this->springTermId)));
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertEquals(0, $terms->available());
	}

	/**
	 *
	 */
	public function testGetTerm()
	{
		$term = $this->session->getTerm($this->termId);
		$this->assertInstanceOf('osid_course_Term', $term);
		$this->assertTrue($term->getId()->isEqual($this->termId));
	}

	/**
	 * @expectedException osid_NotFoundException
	 */
	public function testGetBadTerm()
	{
		$this->session->getTerm($this->badTermId);
	}

	/**
	 *
	 */
	public function testGetTermsByIds()
	{
		$terms = $this->session->getTermsByIds(new phpkit_id_ArrayIdList(array(
					$this->termId,
					$this->springTermId)));
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertEquals(2, $terms->available());
		$this->assertInstanceOf('osid_course_Term', $terms->getNextTerm());
		$this->assertInstanceOf('osid_course_Term', $terms->getNextTerm());
		$this->assertFalse($terms->hasNext());
	}

	/**
	 *
	 */
	public function testGetTermsByGenusType()
	{
		$terms = $this->session->getTermsByGenusType($this->generaNoneType);
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertTrue($terms->hasNext());

		$terms = $this->session->getTermsByGenusType($this->secondaryType);
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertFalse($terms->hasNext());
	}

	/**
	 *
	 */
	public function testGetTermsByParentGenusType()
	{
		$terms = $this->session->getTermsByParentGenusType($this->generaNoneType);
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertTrue($terms->hasNext());

		$terms = $this->session->getTermsByParentGenusType($this->secondaryType);
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertFalse($terms->hasNext());
	}

	/**
	 *
	 */
	public function testGetTermsByRecordType()
	{
		$terms = $this->session->getTermsByRecordType($this->unknownType);
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertFalse($terms->hasNext());
	}

	/**
	 *
	 */
	public function testGetTerms()
	{
		$terms = $this->session->getTerms();
		$this->assertInstanceOf('osid_course_TermList', $terms);
		$this->assertEquals(13, $terms->available());
		$this->assertInstanceOf('osid_course_Term', $terms->getNextTerm());
		$this->assertInstanceOf('osid_course_Term', $terms->getNextTerm());
	}
}
