<?php

/**
 * Copyright (c) 2009 Middlebury College.
 * 
 *     Permission is hereby granted, free of charge, to any person
 *     obtaining a copy of this software and associated documentation
 *     files (the "Software"), to deal in the Software without
 *     restriction, including without limitation the rights to use,
 *     copy, modify, merge, publish, distribute, sublicesne, and/or
 *     sell copies of the Software, and to permit the persons to whom the
 *     Software is furnished to do so, subject the following conditions:
 *     
 *     The above copyright notice and this permission notice shall be
 *     included in all copies or substantial portions of the Software.
 *     
 *     The Software is provided "AS IS", WITHOUT WARRANTY OF ANY KIND,
 *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 *     DEALINGS IN THE SOFTWARE.
 * 
 * @package middlebury.course
 */

/**
 * <p>A record for matching the instructors of a <code> CourseOffering. </code>
 * The methods specified by the record type are available through the 
 * underlying object. </p>
 * 
 *  The type for this record is:
 *		id namespace:	urn
 *		authority:		middlebury.edu
 *		identifier:		record:weekly_schedule
 *
 * @package middlebury.course
 */
interface middlebury_course_CourseOffering_Search_WeeklyScheduleQueryRecord
    extends osid_course_CourseOfferingQueryRecord
{

	/**
     * Matches a meeting on Sunday.
     *
     * Additional calls to any of the matchMeetsXxxx() methods will OR the days.
     *
     * @param boolean $match <code> true </code> if a positive match, <code> 
     *          false </code> for negative match 
     * @compliance mandatory This method must be implemented. 
     */
    public function matchMeetsSunday($match);

	/**
     * Matches a meeting on Monday.
     *
     * Additional calls to any of the matchMeetsXxxx() methods will OR the days.
     *
     * @param boolean $match <code> true </code> if a positive match, <code> 
     *          false </code> for negative match 
     * @compliance mandatory This method must be implemented. 
     */
    public function matchMeetsMonday($match);
    
	/**
     * Matches a meeting on Tuesday.
     *
     * Additional calls to any of the matchMeetsXxxx() methods will OR the days.
     *
     * @param boolean $match <code> true </code> if a positive match, <code> 
     *          false </code> for negative match 
     * @compliance mandatory This method must be implemented. 
     */
    public function matchMeetsTuesday($match);
	
	/**
     * Matches a meeting on Wednesday.
     *
     * Additional calls to any of the matchMeetsXxxx() methods will OR the days.
     *
     * @param boolean $match <code> true </code> if a positive match, <code> 
     *          false </code> for negative match 
     * @compliance mandatory This method must be implemented. 
     */
    public function matchMeetsWednesday($match);
    
    /**
     * Matches a meeting on Thursday.
     *
     * Additional calls to any of the matchMeetsXxxx() methods will OR the days.
     *
     * @param boolean $match <code> true </code> if a positive match, <code> 
     *          false </code> for negative match 
     * @compliance mandatory This method must be implemented. 
     */
    public function matchMeetsThursday($match);
    
    /**
     * Matches a meeting on Friday.
     *
     * Additional calls to any of the matchMeetsXxxx() methods will OR the days.
     *
     * @param boolean $match <code> true </code> if a positive match, <code> 
     *          false </code> for negative match 
     * @compliance mandatory This method must be implemented. 
     */
    public function matchMeetsFriday($match);
    
    /**
     * Matches a meeting on Saturday.
     *
     * Additional calls to any of the matchMeetsXxxx() methods will OR the days.
     *
     * @param boolean $match <code> true </code> if a positive match, <code> 
     *          false </code> for negative match 
     * @compliance mandatory This method must be implemented. 
     */
    public function matchMeetsSaturday($match);
    
    /**
     * Matches meeting times that fall within the range given.
     * 
     * @param integer $rangeStart The lower bound of the start time in seconds since midnight. 0-86399
     * @param integer $rangeEnd The upper bound of the end time in seconds since midnight. 1-86400
     * @param boolean $match <code> true </code> if a positive match, <code> 
     *          false </code> for negative match 
     * @compliance mandatory This method must be implemented. 
     * @throws osid_NullArgumentException rangeStart or rangeEnd are null.
     * @throws osid_InvalidArgumentException rangeStart or rangeEnd are out of range.
     */
    public function matchMeetingTime ($rangeStart, $rangeEnd, $match);
}
