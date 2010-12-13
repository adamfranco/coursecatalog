-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 27, 2010 at 03:58 PM
-- Server version: 5.0.77
-- PHP Version: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `afranco_courses_test2`
--

--
-- Dumping data for table `catalog_term`
--

INSERT INTO `catalog_term` (`catalog_id`, `term_code`, `term_display_label`) VALUES
('MCUG', '200390', 'F'),
('MCUG', '200420', 'S'),
('MCUG', '200490', 'F'),
('MCUG', '200520', 'S'),
('MCUG', '200590', 'F'),
('MCUG', '200620', 'S'),
('MCUG', '200690', 'F'),
('MCUG', '200720', 'S'),
('MCUG', '200790', 'F'),
('MCUG', '200820', 'S'),
('MCUG', '200890', 'F'),
('MCUG', '200920', 'S'),
('MCUG', '200990', 'F');

--
-- Dumping data for table `catalog_term_match`
--

INSERT INTO `catalog_term_match` (`catalog_id`, `term_code_match`, `term_display_label`) VALUES
('BLSE', '%70', ''),
('MCLS', '%60', 'L'),
('MCUG', '%10', 'W'),
('MCUG', '%20', 'S'),
('MCUG', '%90', 'F'),
('MIIS', '%8', '');

--
-- Dumping data for table `course_catalog`
--

INSERT INTO `course_catalog` (`catalog_id`, `catalog_title`) VALUES
('BLSE', 'Bread Loaf School of English'),
('MCLS', 'Middlebury College Language Schools'),
('MCSA', 'Middlebury College Schools Abroad'),
('MCUG', 'Middlebury College'),
('MIIS', 'Monterey Institute of International Studies'),
('MMLA', 'Middlebury Monterey Language Academy');

--
-- Dumping data for table `course_catalog_college`
--

INSERT INTO `course_catalog_college` (`catalog_id`, `coll_code`) VALUES
('MCUG', 'UG'),
('MCUG', 'MC'),
('MIIS', 'CB'),
('MIIS', 'CL'),
('MIIS', 'CM'),
('MIIS', 'CN'),
('MIIS', 'CP'),
('MIIS', 'CT'),
('MCLS', 'LA'),
('MCLS', 'LC'),
('MCLS', 'LF'),
('MCLS', 'LG'),
('MCLS', 'LH'),
('MCLS', 'LI'),
('MCLS', 'LJ'),
('MCLS', 'LP'),
('MCLS', 'LR'),
('MCLS', 'LS'),
('MCLS', 'LX'),
('BLSE', 'BL'),
('BLSE', 'WC'),
('MMLA', 'AX'),
('MCSA', 'SA');

--
-- Dumping data for table `GORINTG`
--


--
-- Dumping data for table `GTVDUNT`
--


--
-- Dumping data for table `GTVINSM`
--


--
-- Dumping data for table `GTVINTP`
--


--
-- Dumping data for table `GTVMTYP`
--


--
-- Dumping data for table `GTVSCHS`
--


--
-- Dumping data for table `SCBCRSE`
--

INSERT INTO `SCBCRSE` (`SCBCRSE_SUBJ_CODE`, `SCBCRSE_CRSE_NUMB`, `SCBCRSE_EFF_TERM`, `SCBCRSE_COLL_CODE`, `SCBCRSE_DIVS_CODE`, `SCBCRSE_DEPT_CODE`, `SCBCRSE_CSTA_CODE`, `SCBCRSE_TITLE`, `SCBCRSE_CIPC_CODE`, `SCBCRSE_CREDIT_HR_IND`, `SCBCRSE_CREDIT_HR_LOW`, `SCBCRSE_CREDIT_HR_HIGH`, `SCBCRSE_LEC_HR_IND`, `SCBCRSE_LEC_HR_LOW`, `SCBCRSE_LEC_HR_HIGH`, `SCBCRSE_LAB_HR_IND`, `SCBCRSE_LAB_HR_LOW`, `SCBCRSE_LAB_HR_HIGH`, `SCBCRSE_OTH_HR_IND`, `SCBCRSE_OTH_HR_LOW`, `SCBCRSE_OTH_HR_HIGH`, `SCBCRSE_BILL_HR_IND`, `SCBCRSE_BILL_HR_LOW`, `SCBCRSE_BILL_HR_HIGH`, `SCBCRSE_APRV_CODE`, `SCBCRSE_REPEAT_LIMIT`, `SCBCRSE_PWAV_CODE`, `SCBCRSE_TUIW_IND`, `SCBCRSE_ADD_FEES_IND`, `SCBCRSE_ACTIVITY_DATE`, `SCBCRSE_CONT_HR_LOW`, `SCBCRSE_CONT_HR_IND`, `SCBCRSE_CONT_HR_HIGH`, `SCBCRSE_CEU_IND`, `SCBCRSE_REPS_CODE`, `SCBCRSE_MAX_RPT_UNITS`, `SCBCRSE_CAPP_PREREQ_TEST_IND`, `SCBCRSE_DUNT_CODE`, `SCBCRSE_NUMBER_OF_UNITS`, `SCBCRSE_DATA_ORIGIN`, `SCBCRSE_USER_ID`) VALUES
('PHYS', '0201', '200390', 'UG', 'NSCI', 'PHYS', 'A', 'Relativity And Quantum Physics', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2004-03-02', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL),
('PHYS', '0201', '200490', 'UG', 'NSCI', 'PHYS', 'F', 'Relativity And Quantum Physics', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2004-03-02', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL),
('GEOG', '0250', '200390', 'UG', 'SSCI', 'GEOG', 'A', 'Arctic and Alpine Environments', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2003-09-10', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL),
('GEOG', '0250', '200490', 'UG', 'SSCI', 'GEOG', 'I', 'Arctic and Alpine Environments', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2004-02-20', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL),
('GEOG', '0250', '200890', 'UG', 'SSCI', 'GEOG', 'A', 'Arctic and Alpine Environments', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2008-03-06', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'Y', NULL, NULL, 'Banner', 'MCLEAN'),
('GEOL', '0250', '200390', 'MC', 'NSCI', 'GEOL', 'A', 'Arctic and Alpine Environments', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', NULL, '0', NULL, NULL, NULL, '2003-09-10', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL),
('GEOL', '0250', '200490', 'MC', 'NSCI', 'GEOL', 'I', 'Arctic and Alpine Environments', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', NULL, '0', NULL, NULL, NULL, '2004-01-22', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL),
('GEOL', '0250', '200590', 'MC', 'NSCI', 'GEOL', 'F', 'Arctic and Alpine Environments', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2006-02-08', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'Y', NULL, NULL, 'Banner', 'JAUDET'),
('GEOL', '0250', '200690', 'MC', 'NSCI', 'GEOL', 'A', 'Arctic and Alpine Environments', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2007-02-06', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'Y', NULL, NULL, 'Banner', 'JAUDET'),
('CHEM', '0104', '200390', 'UG', 'NSCI', 'CHEM', 'A', 'Fundamentals of Chemistry II', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2003-01-17', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL),
('CHEM', '0104', '200490', 'UG', 'NSCI', 'CHEM', 'B', 'Fundamentals of Chemistry II', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2004-01-22', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL),
('CHEM', '0104', '200520', 'UG', 'NSCI', 'CHEM', 'B', 'General Chemistry II', NULL, 'OR', '0.000', '1.000', 'OR', '0.000', '1.000', NULL, NULL, NULL, NULL, NULL, NULL, 'OR', '0.000', '1.000', 'A', '0', NULL, NULL, NULL, '2004-11-02', '0.000', 'OR', '1.000', NULL, NULL, NULL, 'N', NULL, NULL, NULL, NULL);

--
-- Dumping data for table `SCBDESC`
--

INSERT INTO `SCBDESC` (`SCBDESC_SUBJ_CODE`, `SCBDESC_CRSE_NUMB`, `SCBDESC_TERM_CODE_EFF`, `SCBDESC_ACTIVITY_DATE`, `SCBDESC_USER_ID`, `SCBDESC_TEXT_NARRATIVE`, `SCBDESC_TERM_CODE_END`) VALUES
('CHEM', '0104', '200490', '2009-08-27', 'JAUDET', 'Major topics include chemical kinetics, chemical equilibrium, acid-base equilibria, chemical thermodynamics, electrochemistry, descriptive inorganic chemistry, and coordination chemistry. Lab work includes inorganic synthesis, qualitative analysis, and quantitative analysis in kinetics, acid-base and redox chemistry. (CHEM 0103 or by waiver) 3 hrs. lect., 3 hrs. lab, 1 hr. disc.', NULL),
('PHYS', '0201', '200490', '2009-09-09', 'JAUDET', 'This course probes a number of areas for which classical physics has provided no adequate explanations. Topics covered include Einstein''s special relativity, quantization of atomic energy levels and photons, the atomic models of Rutherford and Bohr, and wave-particle duality. (PHYS 0109, MATH 0122, PHYS 0110 concurrent or prior) 3 hrs. lect.', NULL);

--
-- Dumping data for table `SCRATTR`
--


--
-- Dumping data for table `SCREQIV`
--

INSERT INTO `SCREQIV` (`SCREQIV_SUBJ_CODE`, `SCREQIV_CRSE_NUMB`, `SCREQIV_EFF_TERM`, `SCREQIV_SUBJ_CODE_EQIV`, `SCREQIV_CRSE_NUMB_EQIV`, `SCREQIV_START_TERM`, `SCREQIV_END_TERM`, `SCREQIV_ACTIVITY_DATE`) VALUES
('GEOG', '0250', '200390', 'GEOL', '0250', '200390', '999999', '2003-02-24'),
('GEOG', '0250', '200390', 'GG', '250', '000000', '200390', '2003-07-02'),
('GEOG', '0250', '200390', 'GL', '250', '000000', '200390', '2003-07-02'),
('GEOL', '0250', '200390', 'GEOG', '0250', '200390', '999999', '2003-07-02'),
('GEOL', '0250', '200390', 'GG', '250', '000000', '200390', '2003-03-26'),
('GEOL', '0250', '200390', 'GL', '250', '000000', '200390', '2003-03-26');

--
-- Dumping data for table `SCRLEVL`
--

INSERT INTO `SCRLEVL` (`SCRLEVL_SUBJ_CODE`, `SCRLEVL_CRSE_NUMB`, `SCRLEVL_EFF_TERM`, `SCRLEVL_LEVL_CODE`, `SCRLEVL_ACTIVITY_DATE`) VALUES
('CHEM', '0104', '200390', 'UG', '2003-01-09'),
('GEOG', '0250', '200390', 'UG', '2003-02-24'),
('GEOL', '0250', '200390', 'UG', '2003-03-26'),
('PHYS', '0201', '200390', 'UG', '2003-01-09');

--
-- Dumping data for table `SIRASGN`
--


--
-- Dumping data for table `SSBDESC`
--


--
-- Dumping data for table `SSBSECT`
--

INSERT INTO `SSBSECT` (`SSBSECT_TERM_CODE`, `SSBSECT_CRN`, `SSBSECT_PTRM_CODE`, `SSBSECT_SUBJ_CODE`, `SSBSECT_CRSE_NUMB`, `SSBSECT_SEQ_NUMB`, `SSBSECT_SSTS_CODE`, `SSBSECT_SCHD_CODE`, `SSBSECT_CAMP_CODE`, `SSBSECT_CRSE_TITLE`, `SSBSECT_CREDIT_HRS`, `SSBSECT_BILL_HRS`, `SSBSECT_GMOD_CODE`, `SSBSECT_SAPR_CODE`, `SSBSECT_SESS_CODE`, `SSBSECT_LINK_IDENT`, `SSBSECT_PRNT_IND`, `SSBSECT_GRADABLE_IND`, `SSBSECT_TUIW_IND`, `SSBSECT_REG_ONEUP`, `SSBSECT_PRIOR_ENRL`, `SSBSECT_PROJ_ENRL`, `SSBSECT_MAX_ENRL`, `SSBSECT_ENRL`, `SSBSECT_SEATS_AVAIL`, `SSBSECT_TOT_CREDIT_HRS`, `SSBSECT_CENSUS_ENRL`, `SSBSECT_CENSUS_ENRL_DATE`, `SSBSECT_ACTIVITY_DATE`, `SSBSECT_PTRM_START_DATE`, `SSBSECT_PTRM_END_DATE`, `SSBSECT_PTRM_WEEKS`, `SSBSECT_RESERVED_IND`, `SSBSECT_WAIT_CAPACITY`, `SSBSECT_WAIT_COUNT`, `SSBSECT_WAIT_AVAIL`, `SSBSECT_LEC_HR`, `SSBSECT_LAB_HR`, `SSBSECT_OTH_HR`, `SSBSECT_CONT_HR`, `SSBSECT_ACCT_CODE`, `SSBSECT_ACCL_CODE`, `SSBSECT_CENSUS_2_DATE`, `SSBSECT_ENRL_CUT_OFF_DATE`, `SSBSECT_ACAD_CUT_OFF_DATE`, `SSBSECT_DROP_CUT_OFF_DATE`, `SSBSECT_CENSUS_2_ENRL`, `SSBSECT_VOICE_AVAIL`, `SSBSECT_CAPP_PREREQ_TEST_IND`, `SSBSECT_GSCH_NAME`, `SSBSECT_BEST_OF_COMP`, `SSBSECT_SUBSET_OF_COMP`, `SSBSECT_INSM_CODE`, `SSBSECT_REG_FROM_DATE`, `SSBSECT_REG_TO_DATE`, `SSBSECT_LEARNER_REGSTART_FDATE`, `SSBSECT_LEARNER_REGSTART_TDATE`, `SSBSECT_DUNT_CODE`, `SSBSECT_NUMBER_OF_UNITS`, `SSBSECT_NUMBER_OF_EXTENSIONS`, `SSBSECT_DATA_ORIGIN`, `SSBSECT_USER_ID`, `SSBSECT_INTG_CDE`) VALUES
('200390', '90260', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '35', '0', '25', '45', '29', '16', '29.000', '30', '2003-10-03', '2003-04-09', '2003-09-08', '2003-12-16', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '29', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20242', '1', 'PHYS', '0201', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '0', '21', '25', '45', '0', '45', '0.000', '0', '2004-03-05', '2003-08-25', '2004-02-09', '2004-05-18', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200490', '90231', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '27', '29', '25', '30', '21', '9', '21.000', '21', '2004-10-08', '2004-03-02', '2004-09-13', '2004-12-10', '12', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2004-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '21', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200590', '90193', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '30', '21', '30', '30', '27', '3', '27.000', '27', '2005-09-23', '2005-02-28', '2005-09-12', '2005-12-09', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2005-10-07', '1969-12-31', '1969-12-31', '1969-12-31', '27', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200690', '90176', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '31', '27', '30', '30', '28', '2', '28.000', '28', '2006-09-22', '2006-10-13', '2006-09-11', '2006-12-08', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200695', '90176', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '4', '20', '30', '30', '4', '26', '4.000', '4', '2006-09-22', '2006-06-21', '2006-09-11', '2006-12-08', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200790', '90152', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '26', '28', '30', '30', '23', '7', '23.000', '23', '2007-09-21', '2007-09-19', '2007-09-10', '2007-12-07', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200793', '90152', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '7', '0', '30', '30', '7', '23', '7.000', '7', '2007-09-21', '2007-04-25', '2007-09-10', '2007-12-18', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200794', '90152', '1', 'PHYS', '0201', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '0', '19', '30', '30', '0', '30', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200795', '90152', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '6', '19', '30', '30', '6', '24', '6.000', '6', '2007-09-21', '2007-06-27', '2007-09-10', '2007-12-07', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200890', '90143', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '33', '23', '30', '30', '25', '5', '25.000', '26', '2008-09-19', '2008-10-10', '2008-09-08', '2008-12-05', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200893', '90143', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '6', '0', '30', '30', '6', '24', '6.000', '6', '2008-09-19', '2008-04-22', '2008-09-08', '2008-12-16', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200894', '90143', '1', 'PHYS', '0201', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '0', '19', '30', '30', '0', '30', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200895', '90143', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '2', '19', '30', '30', '2', '28', '2.000', '2', '2008-09-19', '2008-06-25', '2008-09-08', '2008-12-05', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '2', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200990', '90125', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '0', '25', '30', '30', '0', '30', '0.000', '0', '2009-09-18', '2009-02-10', '2009-09-07', '2009-12-04', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200993', '90125', '1', 'PHYS', '0201', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, NULL, 'Y', 'Y', NULL, '4', '0', '30', '30', '2', '28', '2.000', '2', '2009-09-18', '2009-04-17', '2009-09-07', '2009-12-04', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200390', '90683', '1', 'GEOG', '0250', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '1', '0', '18', '24', '0', '24', '0.000', '1', '2003-10-03', '2003-04-18', '2003-09-08', '2003-12-16', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '1', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200390', '90684', '1', 'GEOG', '0250', 'Y', 'A', 'LAB', 'M', 'Arctic and Alpine Environ Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '9', '15', '0', '15', '0.000', '0', '2003-10-03', '2003-09-23', '2003-09-08', '2003-12-16', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200390', '90685', '1', 'GEOG', '0250', 'Z', 'A', 'LAB', 'M', 'Arctic and Alpine Environ Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '1', '0', '9', '15', '0', '15', '0.000', '1', '2003-10-03', '2003-09-23', '2003-09-08', '2003-12-16', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '1', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200390', '90712', '1', 'GEOL', '0250', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '9', '0', '15', '24', '9', '15', '9.000', '8', '2003-10-03', '2003-05-28', '2003-09-08', '2003-12-16', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '8', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200390', '90713', '1', 'GEOL', '0250', 'Y', 'A', 'LAB', 'M', 'Arctic and Alpine Environ Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '9', '15', '0', '15', '0.000', '0', '2003-10-03', '2003-06-16', '2003-09-08', '2003-12-16', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'N', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200390', '90714', '1', 'GEOL', '0250', 'Z', 'A', 'LAB', 'M', 'Arctic and Alpine Environ Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '6', '0', '9', '15', '6', '9', '0.000', '6', '2003-10-03', '2003-06-16', '2003-09-08', '2003-12-16', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '6', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20636', '1', 'GEOG', '0250', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '1', '18', '24', '0', '24', '0.000', '0', '2004-03-05', '2003-09-02', '2004-02-09', '2004-05-18', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20637', '1', 'GEOG', '0250', 'Y', 'I', 'LAB', 'M', 'Arctic and Alpine Environ. Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '9', '15', '0', '15', '0.000', '0', '2004-03-05', '2003-09-02', '2004-02-09', '2004-05-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20638', '1', 'GEOG', '0250', 'Z', 'I', 'LAB', 'M', 'Arctic and Alpine Environ. Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '1', '9', '15', '0', '15', '0.000', '0', '2004-03-05', '2003-09-02', '2004-02-09', '2004-05-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20661', '1', 'GEOL', '0250', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '5', '15', '24', '0', '24', '0.000', '0', '2004-03-05', '2003-09-04', '2004-02-09', '2004-05-18', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20662', '1', 'GEOL', '0250', 'Y', 'I', 'LAB', 'M', 'Arctic and Alpine Environ Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '9', '15', '0', '15', '0.000', '0', '2004-03-05', '2003-09-04', '2004-02-09', '2004-05-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'N', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20663', '1', 'GEOL', '0250', 'Z', 'I', 'LAB', 'M', 'Arctic and Alpine Environ Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '5', '9', '15', '0', '15', '0.000', '0', '2004-03-05', '2003-09-04', '2004-02-09', '2004-05-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200890', '92418', '1', 'GEOL', '0250', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '18', '0', '14', '14', '13', '1', '13.000', '13', '2008-09-19', '2008-09-16', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200890', '92423', '1', 'GEOL', '0250', 'Z', 'A', 'LAB', 'M', 'Arctic and Alpine Environ. Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '18', '0', '14', '14', '13', '1', '0.000', '13', '2008-09-19', '2008-09-16', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200890', '92443', '1', 'GEOG', '0250', 'A', 'A', 'LCT', 'M', 'Please register via GEOL 0250A', '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '0', '0', '0', '0', '0', '0.000', '0', '2008-09-19', '2008-03-06', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MCLEAN', NULL),
('200890', '92449', '1', 'GEOG', '0250', 'Z', 'A', 'LAB', 'M', 'Please register via GEOL 0250Z', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '0', '0', '0', '0', '0.000', '0', '2008-09-19', '2008-03-06', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MCLEAN', NULL),
('200893', '92418', '1', 'GEOL', '0250', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '6', '0', '14', '14', '4', '10', '4.000', '4', '2008-09-19', '2008-04-17', '2008-09-08', '2008-12-16', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200893', '92423', '1', 'GEOL', '0250', 'Z', 'A', 'LAB', 'M', 'Arctic and Alpine Environ. Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '6', '0', '14', '14', '4', '10', '0.000', '4', '2008-09-19', '2008-04-17', '2008-09-08', '2008-12-16', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200893', '92443', '1', 'GEOG', '0250', 'A', 'A', 'LCT', 'M', 'Please register via GEOL 0250A', '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '0', '0', '0', '0', '0', '0.000', '0', '2008-09-19', '2008-04-10', '2008-09-08', '2008-12-16', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200893', '92449', '1', 'GEOG', '0250', 'Z', 'A', 'LAB', 'M', 'Please register via GEOL 0250Z', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '0', '0', '0', '0', '0.000', '0', '2008-09-19', '2008-04-10', '2008-09-08', '2008-12-16', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200894', '92418', '1', 'GEOL', '0250', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '14', '14', '14', '0', '14', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '1.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200894', '92423', '1', 'GEOL', '0250', 'Z', 'I', 'LAB', 'M', 'Arctic and Alpine Environ. Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '14', '14', '14', '0', '14', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200894', '92443', '1', 'GEOG', '0250', 'A', 'I', 'LCT', 'M', 'Please register via GEOL 0250A', '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '0', '0', '0', '0', '0', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '1.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200894', '92449', '1', 'GEOG', '0250', 'Z', 'I', 'LAB', 'M', 'Please register via GEOL 0250Z', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '0', '0', '0', '0', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200895', '92418', '1', 'GEOL', '0250', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '14', '14', '14', '0', '14', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '1.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200895', '92423', '1', 'GEOL', '0250', 'Z', 'I', 'LAB', 'M', 'Arctic and Alpine Environ. Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '14', '14', '14', '0', '14', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200895', '92443', '1', 'GEOG', '0250', 'A', 'I', 'LCT', 'M', 'Please register via GEOL 0250A', '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '0', '0', '0', '0', '0', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '1.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200895', '92449', '1', 'GEOG', '0250', 'Z', 'I', 'LAB', 'M', 'Please register via GEOL 0250Z', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '0', '0', '0', '0', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'Y', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200390', '90085', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '31', '0', '35', '48', '27', '21', '27.000', '29', '2003-10-03', '2003-04-16', '2003-09-08', '2003-12-16', '14', 'Y', '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '27', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200390', '90093', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '28', '0', '35', '48', '25', '23', '0.000', '25', '2003-10-03', '2003-05-19', '2003-09-08', '2003-12-16', '14', 'Y', '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '25', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200390', '90105', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'Fundamentals Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '19', '0', '18', '24', '17', '7', '0.000', '18', '2003-10-03', '2003-05-19', '2003-09-08', '2003-12-16', '14', 'Y', '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '17', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200390', '90113', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'Fundamentals Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '13', '0', '18', '24', '9', '15', '0.000', '10', '2003-10-03', '2003-05-19', '2003-09-08', '2003-12-16', '14', 'Y', '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2003-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '9', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20073', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '85', '22', '76', '96', '68', '28', '192.000', '68', '2004-03-05', '2003-11-24', '2004-02-09', '2004-05-18', '14', 'Y', '50', '0', '50', '1.000', NULL, NULL, '1.000', 'E', NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '68', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20081', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '30', '20', '32', '32', '22', '10', '0.000', '22', '2004-03-05', '2003-11-24', '2004-02-09', '2004-05-18', '14', 'Y', '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '22', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20092', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'Fundamentals Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '27', '12', '18', '24', '22', '2', '0.000', '22', '2004-03-05', '2003-09-25', '2004-02-09', '2004-05-18', '14', 'Y', '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '22', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '20100', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'Fundamentals Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '17', '9', '18', '24', '11', '13', '0.000', '11', '2004-03-05', '2003-08-21', '2004-02-09', '2004-05-18', '14', 'Y', '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '11', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '21470', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '29', '0', '32', '32', '19', '13', '0.000', '19', '2004-03-05', '2003-11-24', '2004-02-09', '2004-05-18', '14', 'Y', '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '19', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '21475', '1', 'CHEM', '0104', 'V', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '29', '0', '32', '32', '26', '6', '0.000', '26', '2004-03-05', '2003-11-24', '2004-02-09', '2004-05-18', '14', 'Y', '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '26', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '21479', '1', 'CHEM', '0104', 'X', 'A', 'LAB', 'M', 'Fundamentals Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '33', '0', '18', '24', '23', '1', '0.000', '23', '2004-03-05', '2003-09-25', '2004-02-09', '2004-05-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '23', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200420', '21483', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'Fundamentals Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '27', '0', '18', '24', '12', '12', '0.000', '12', '2004-03-05', '2003-09-25', '2004-02-09', '2004-05-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-05-01', '1969-12-31', '1969-12-31', '1969-12-31', '12', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200490', '90066', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '28', '27', '35', '48', '24', '24', '24.000', '24', '2004-10-08', '2004-02-05', '2004-09-13', '2004-12-10', '12', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2004-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '24', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200490', '90074', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '28', '25', '25', '48', '24', '24', '0.000', '24', '2004-10-08', '2004-02-27', '2004-09-13', '2004-12-10', '12', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '24', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200490', '90083', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'Fundamentals Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '15', '17', '25', '48', '11', '37', '0.000', '11', '2004-10-08', '2004-02-27', '2004-09-13', '2004-12-10', '12', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '11', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200490', '90091', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'Fundamentals Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '15', '9', '25', '48', '13', '35', '0.000', '13', '2004-10-08', '2004-02-27', '2004-09-13', '2004-12-10', '12', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-12-01', '1969-12-31', '1969-12-31', '1969-12-31', '13', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200520', '20019', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '81', '68', '76', '96', '63', '33', '63.000', '61', '2005-02-18', '2004-09-30', '2005-02-07', '2005-05-06', '14', NULL, '50', '0', '50', '1.000', NULL, NULL, '1.000', 'E', NULL, '2004-03-04', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200520', '20022', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '38', '22', '36', '36', '29', '7', '0.000', '29', '2005-02-18', '2004-09-30', '2005-02-07', '2005-05-06', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-03-04', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200520', '20024', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '22', '22', '18', '24', '15', '9', '0.000', '15', '2005-02-18', '2004-11-02', '2005-02-07', '2005-05-06', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-03-04', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200520', '20027', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '21', '11', '18', '24', '15', '9', '0.000', '13', '2005-02-18', '2004-11-02', '2005-02-07', '2005-05-06', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-03-04', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200520', '20714', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '45', '19', '36', '36', '33', '3', '0.000', '32', '2005-02-18', '2004-09-30', '2005-02-07', '2005-05-06', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-03-04', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200520', '20719', '1', 'CHEM', '0104', 'V', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'N', 'N', NULL, '0', '26', '36', '36', '0', '36', '0.000', '0', '2005-02-18', '2004-09-30', '2005-02-07', '2005-05-06', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-03-04', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'N', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200520', '20723', '1', 'CHEM', '0104', 'X', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '27', '23', '18', '24', '22', '2', '0.000', '21', '2005-02-18', '2004-11-02', '2005-02-07', '2005-05-06', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-03-04', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200520', '20727', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '18', '12', '18', '24', '11', '13', '0.000', '11', '2005-02-18', '2004-11-02', '2005-02-07', '2005-05-06', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2004-03-04', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200590', '90056', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '33', '24', '35', '48', '30', '18', '30.000', '28', '2005-09-23', '2005-09-27', '2005-09-12', '2005-12-09', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2005-10-07', '1969-12-31', '1969-12-31', '1969-12-31', '30', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, 'JMNUCEDE', NULL),
('200590', '90062', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '33', '24', '25', '48', '30', '18', '0.000', '28', '2005-09-23', '2005-09-27', '2005-09-12', '2005-12-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2005-10-07', '1969-12-31', '1969-12-31', '1969-12-31', '30', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, 'JMNUCEDE', NULL),
('200590', '90068', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '19', '11', '24', '24', '16', '8', '0.000', '14', '2005-09-23', '2005-09-27', '2005-09-12', '2005-12-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2005-10-07', '1969-12-31', '1969-12-31', '1969-12-31', '16', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, 'JMNUCEDE', NULL),
('200590', '90074', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '15', '13', '24', '24', '14', '10', '0.000', '14', '2005-09-23', '2005-09-09', '2005-09-12', '2005-12-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2005-10-07', '1969-12-31', '1969-12-31', '1969-12-31', '14', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, NULL, NULL),
('200620', '20017', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '60', '63', '76', '96', '49', '47', '49.000', '50', '2006-03-10', '2006-03-21', '2006-02-13', '2006-05-12', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '2006-03-17', '1969-12-31', '1969-12-31', '1969-12-31', '50', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200620', '20020', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '19', '29', '36', '36', '15', '21', '0.000', '15', '2006-03-10', '2006-02-21', '2006-02-13', '2006-05-12', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2006-03-17', '1969-12-31', '1969-12-31', '1969-12-31', '15', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, 'WWW_USER', NULL),
('200620', '20022', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '13', '15', '18', '18', '10', '8', '0.000', '8', '2006-03-10', '2006-04-03', '2006-02-13', '2006-05-12', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2006-03-17', '1969-12-31', '1969-12-31', '1969-12-31', '8', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200620', '20024', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '19', '15', '18', '18', '13', '5', '0.000', '15', '2006-03-10', '2006-04-03', '2006-02-13', '2006-05-12', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2006-03-17', '1969-12-31', '1969-12-31', '1969-12-31', '15', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200620', '20628', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '37', '33', '36', '36', '29', '7', '0.000', '30', '2006-03-10', '2006-03-21', '2006-02-13', '2006-05-12', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2006-03-17', '1969-12-31', '1969-12-31', '1969-12-31', '30', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', NULL, 'GGOTTLIE', NULL),
('200620', '20631', '1', 'CHEM', '0104', 'V', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '9', '0', '36', '36', '7', '29', '0.000', '7', '2006-03-10', '2006-02-24', '2006-02-13', '2006-05-12', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2006-03-17', '1969-12-31', '1969-12-31', '1969-12-31', '7', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200620', '20634', '1', 'CHEM', '0104', 'X', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '19', '22', '18', '18', '13', '5', '0.000', '14', '2006-03-10', '2006-04-03', '2006-02-13', '2006-05-12', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2006-03-17', '1969-12-31', '1969-12-31', '1969-12-31', '14', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200620', '20638', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '20', '11', '18', '18', '14', '4', '0.000', '14', '2006-03-10', '2006-02-24', '2006-02-13', '2006-05-12', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2006-03-17', '1969-12-31', '1969-12-31', '1969-12-31', '14', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200690', '90051', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '43', '30', '48', '60', '36', '24', '36.000', '36', '2006-09-22', '2006-10-10', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200690', '90057', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '30', '30', '25', '20', '19', '1', '0.000', '19', '2006-09-22', '2006-10-10', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200690', '90062', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '22', '16', '20', '20', '16', '4', '0.000', '16', '2006-09-22', '2006-10-10', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200690', '92704', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '6', '0', '20', '20', '0', '20', '0.000', '0', '2006-09-22', '2007-02-14', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JAUDET', NULL),
('200690', '93032', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '19', '0', '20', '20', '17', '3', '0.000', '17', '2006-09-22', '2006-09-22', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200690', '93036', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '15', '0', '25', '20', '14', '6', '0.000', '14', '2006-09-22', '2006-09-22', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200690', '93037', '1', 'CHEM', '0104', 'V', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '3', '0', '25', '20', '0', '20', '0.000', '0', '2006-09-22', '2007-02-14', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JAUDET', NULL),
('200695', '90051', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '5', '25', '48', '60', '5', '55', '5.000', '5', '2006-09-22', '2006-06-21', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200695', '90057', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '13', '25', '20', '0', '20', '0.000', '0', '2006-09-22', '2006-06-08', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200695', '90062', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '10', '20', '20', '0', '20', '0.000', '0', '2006-09-22', '2006-06-08', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200695', '92704', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '5', '20', '20', '0', '20', '0.000', '0', '2006-09-22', '2006-06-08', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200695', '93032', '1', 'CHEM', '0104', 'Y', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '10', '20', '20', '0', '20', '0.000', '0', '2006-09-22', '2006-06-08', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200695', '93036', '1', 'CHEM', '0104', 'U', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '9', '25', '20', '0', '20', '0.000', '0', '2006-09-22', '2006-06-08', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200695', '93037', '1', 'CHEM', '0104', 'V', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '3', '25', '20', '0', '20', '0.000', '0', '2006-09-22', '2006-06-08', '2006-09-11', '2006-12-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200720', '20017', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '68', '49', '76', '72', '57', '15', '57.000', '58', '2007-02-23', '2007-03-05', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200720', '20020', '1', 'CHEM', '0104', 'S', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '24', '15', '22', '22', '22', '0', '0.000', '22', '2007-02-23', '2007-02-22', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL);
INSERT INTO `SSBSECT` (`SSBSECT_TERM_CODE`, `SSBSECT_CRN`, `SSBSECT_PTRM_CODE`, `SSBSECT_SUBJ_CODE`, `SSBSECT_CRSE_NUMB`, `SSBSECT_SEQ_NUMB`, `SSBSECT_SSTS_CODE`, `SSBSECT_SCHD_CODE`, `SSBSECT_CAMP_CODE`, `SSBSECT_CRSE_TITLE`, `SSBSECT_CREDIT_HRS`, `SSBSECT_BILL_HRS`, `SSBSECT_GMOD_CODE`, `SSBSECT_SAPR_CODE`, `SSBSECT_SESS_CODE`, `SSBSECT_LINK_IDENT`, `SSBSECT_PRNT_IND`, `SSBSECT_GRADABLE_IND`, `SSBSECT_TUIW_IND`, `SSBSECT_REG_ONEUP`, `SSBSECT_PRIOR_ENRL`, `SSBSECT_PROJ_ENRL`, `SSBSECT_MAX_ENRL`, `SSBSECT_ENRL`, `SSBSECT_SEATS_AVAIL`, `SSBSECT_TOT_CREDIT_HRS`, `SSBSECT_CENSUS_ENRL`, `SSBSECT_CENSUS_ENRL_DATE`, `SSBSECT_ACTIVITY_DATE`, `SSBSECT_PTRM_START_DATE`, `SSBSECT_PTRM_END_DATE`, `SSBSECT_PTRM_WEEKS`, `SSBSECT_RESERVED_IND`, `SSBSECT_WAIT_CAPACITY`, `SSBSECT_WAIT_COUNT`, `SSBSECT_WAIT_AVAIL`, `SSBSECT_LEC_HR`, `SSBSECT_LAB_HR`, `SSBSECT_OTH_HR`, `SSBSECT_CONT_HR`, `SSBSECT_ACCT_CODE`, `SSBSECT_ACCL_CODE`, `SSBSECT_CENSUS_2_DATE`, `SSBSECT_ENRL_CUT_OFF_DATE`, `SSBSECT_ACAD_CUT_OFF_DATE`, `SSBSECT_DROP_CUT_OFF_DATE`, `SSBSECT_CENSUS_2_ENRL`, `SSBSECT_VOICE_AVAIL`, `SSBSECT_CAPP_PREREQ_TEST_IND`, `SSBSECT_GSCH_NAME`, `SSBSECT_BEST_OF_COMP`, `SSBSECT_SUBSET_OF_COMP`, `SSBSECT_INSM_CODE`, `SSBSECT_REG_FROM_DATE`, `SSBSECT_REG_TO_DATE`, `SSBSECT_LEARNER_REGSTART_FDATE`, `SSBSECT_LEARNER_REGSTART_TDATE`, `SSBSECT_DUNT_CODE`, `SSBSECT_NUMBER_OF_UNITS`, `SSBSECT_NUMBER_OF_EXTENSIONS`, `SSBSECT_DATA_ORIGIN`, `SSBSECT_USER_ID`, `SSBSECT_INTG_CDE`) VALUES
('200720', '20022', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '20', '10', '18', '18', '12', '6', '0.000', '13', '2007-02-23', '2007-04-09', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200720', '20024', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '22', '13', '18', '18', '14', '4', '0.000', '13', '2007-02-23', '2007-04-09', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200720', '20571', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '22', '29', '18', '18', '18', '0', '0.000', '18', '2007-02-23', '2007-02-22', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200720', '20573', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '5', '7', '14', '14', '3', '11', '0.000', '3', '2007-02-23', '2007-02-13', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200720', '20575', '1', 'CHEM', '0104', 'X', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '19', '13', '18', '18', '15', '3', '0.000', '16', '2007-02-23', '2007-03-27', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200720', '20578', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '24', '14', '18', '18', '16', '2', '0.000', '16', '2007-02-23', '2007-03-27', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200720', '22922', '1', 'CHEM', '0104', 'V', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '19', '0', '18', '18', '14', '4', '0.000', '15', '2007-02-23', '2007-03-05', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200723', '20017', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '31', '0', '76', '72', '20', '52', '20.000', '20', '2007-02-23', '2006-11-16', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200723', '20020', '1', 'CHEM', '0104', 'S', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '17', '0', '18', '18', '9', '9', '0.000', '9', '2007-02-23', '2006-11-16', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200723', '20022', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '5', '0', '18', '18', '1', '17', '0.000', '1', '2007-02-23', '2006-11-16', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200723', '20024', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '2', '0', '18', '18', '1', '17', '0.000', '1', '2007-02-23', '2006-11-16', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200723', '20571', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '13', '0', '18', '18', '10', '8', '0.000', '10', '2007-02-23', '2006-11-16', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200723', '20573', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '1', '0', '18', '18', '1', '17', '0.000', '1', '2007-02-23', '2006-11-08', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200723', '20575', '1', 'CHEM', '0104', 'X', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '17', '0', '18', '18', '11', '7', '0.000', '11', '2007-02-23', '2006-11-16', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200723', '20578', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '7', '0', '18', '18', '7', '11', '0.000', '7', '2007-02-23', '2006-11-16', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200723', '22922', '1', 'CHEM', '0104', 'V', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '0', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-11-02', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200724', '20017', '1', 'CHEM', '0104', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '57', '76', '72', '0', '72', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200724', '20020', '1', 'CHEM', '0104', 'S', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '19', '22', '22', '0', '22', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200724', '20022', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '8', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200724', '20024', '1', 'CHEM', '0104', 'Y', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '13', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200724', '20571', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200724', '20573', '1', 'CHEM', '0104', 'U', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '5', '14', '14', '0', '14', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200724', '20575', '1', 'CHEM', '0104', 'X', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200724', '20578', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200724', '22922', '1', 'CHEM', '0104', 'V', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '15', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200725', '20017', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '2', '57', '76', '72', '2', '70', '2.000', '2', '2007-02-23', '2007-01-04', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200725', '20020', '1', 'CHEM', '0104', 'S', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '19', '22', '22', '0', '22', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200725', '20022', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '8', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200725', '20024', '1', 'CHEM', '0104', 'Y', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '13', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200725', '20571', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200725', '20573', '1', 'CHEM', '0104', 'U', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '5', '14', '14', '0', '14', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200725', '20575', '1', 'CHEM', '0104', 'X', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200725', '20578', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200725', '22922', '1', 'CHEM', '0104', 'V', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '15', '18', '18', '0', '18', '0.000', '0', '2007-02-23', '2006-12-20', '2007-02-12', '2007-05-11', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200790', '90047', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '39', '36', '48', '60', '30', '30', '30.000', '32', '2007-09-21', '2007-11-15', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200790', '90052', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '23', '19', '25', '30', '17', '13', '0.000', '18', '2007-09-21', '2007-11-15', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200790', '90057', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '21', '16', '20', '20', '13', '7', '0.000', '14', '2007-09-21', '2007-10-17', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200790', '92285', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '20', '0', '20', '20', '16', '4', '0.000', '18', '2007-09-21', '2007-11-15', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200790', '92591', '1', 'CHEM', '0104', 'Y', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '3', '17', '20', '20', '0', '20', '0.000', '0', '2007-09-21', '2007-06-08', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JAUDET', NULL),
('200790', '92595', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '19', '14', '25', '30', '13', '17', '0.000', '14', '2007-09-21', '2007-11-01', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'AROULEAU', NULL),
('200790', '92596', '1', 'CHEM', '0104', 'V', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '0', '25', '20', '0', '20', '0.000', '0', '2007-09-21', '2007-03-07', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JMMAYER', NULL),
('200793', '90047', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '11', '0', '48', '60', '7', '53', '7.000', '7', '2007-09-21', '2007-04-25', '2007-09-10', '2007-12-18', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200793', '90052', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '5', '0', '25', '30', '3', '27', '0.000', '3', '2007-09-21', '2007-04-25', '2007-09-10', '2007-12-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200793', '90057', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '20', '20', '0', '20', '0.000', '0', '2007-09-21', '2007-04-12', '2007-09-10', '2007-12-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200793', '92285', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '8', '0', '20', '20', '6', '14', '0.000', '6', '2007-09-21', '2007-04-25', '2007-09-10', '2007-12-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200793', '92591', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '3', '0', '20', '20', '1', '19', '0.000', '1', '2007-09-21', '2007-04-25', '2007-09-10', '2007-12-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200793', '92595', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '6', '0', '25', '30', '4', '26', '0.000', '4', '2007-09-21', '2007-04-25', '2007-09-10', '2007-12-18', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200794', '90047', '1', 'CHEM', '0104', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '21', '48', '60', '0', '60', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200794', '90052', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '12', '25', '30', '0', '30', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200794', '90057', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '10', '20', '20', '0', '20', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200794', '92285', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '8', '20', '20', '0', '20', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200794', '92595', '1', 'CHEM', '0104', 'U', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '9', '25', '30', '0', '30', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200795', '90047', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '3', '21', '48', '60', '2', '58', '2.000', '2', '2007-09-21', '2007-06-26', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200795', '90052', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '12', '25', '30', '0', '30', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200795', '90057', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '10', '20', '20', '0', '20', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200795', '92285', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '8', '20', '20', '0', '20', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200795', '92595', '1', 'CHEM', '0104', 'U', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '9', '25', '30', '0', '30', '0.000', '0', '2007-09-21', '2007-06-13', '2007-09-10', '2007-12-07', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200820', '20016', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '78', '57', '76', '72', '64', '8', '64.000', '64', '2008-02-22', '2008-02-22', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JRHEAUME', NULL),
('200820', '20019', '1', 'CHEM', '0104', 'S', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '22', '22', '22', '0', '22', '0.000', '0', '2008-02-22', '2007-10-03', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JMMAYER', NULL),
('200820', '20021', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '27', '12', '18', '18', '15', '3', '0.000', '15', '2008-02-22', '2008-02-22', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JRHEAUME', NULL),
('200820', '20023', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '20', '14', '18', '18', '14', '4', '0.000', '14', '2008-02-22', '2008-02-22', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'LEROYG', NULL),
('200820', '20509', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-10-03', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JMMAYER', NULL),
('200820', '20510', '1', 'CHEM', '0104', 'U', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '3', '14', '14', '0', '14', '0.000', '0', '2008-02-22', '2007-10-03', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JMMAYER', NULL),
('200820', '20511', '1', 'CHEM', '0104', 'X', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '23', '15', '18', '18', '16', '2', '0.000', '16', '2008-02-22', '2008-02-21', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200820', '20514', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '23', '16', '18', '18', '19', '-1', '0.000', '19', '2008-02-22', '2008-02-22', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'LEROYG', NULL),
('200820', '22255', '1', 'CHEM', '0104', 'V', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '14', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-10-03', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JMMAYER', NULL),
('200823', '20016', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '35', '0', '76', '72', '27', '45', '27.000', '27', '2008-02-22', '2007-11-15', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200823', '20021', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '5', '0', '18', '18', '5', '13', '0.000', '5', '2008-02-22', '2007-11-13', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200823', '20023', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '8', '0', '18', '18', '5', '13', '0.000', '5', '2008-02-22', '2007-11-15', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200823', '20511', '1', 'CHEM', '0104', 'X', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '16', '0', '18', '18', '11', '7', '0.000', '11', '2008-02-22', '2007-11-13', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200823', '20514', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '8', '0', '18', '18', '6', '12', '0.000', '6', '2008-02-22', '2007-11-14', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200824', '20016', '1', 'CHEM', '0104', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '65', '76', '72', '0', '72', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200824', '20021', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '13', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200824', '20023', '1', 'CHEM', '0104', 'Y', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '16', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200824', '20511', '1', 'CHEM', '0104', 'X', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200824', '20514', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200825', '20016', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '65', '76', '72', '0', '72', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200825', '20021', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '13', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200825', '20023', '1', 'CHEM', '0104', 'Y', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '16', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200825', '20511', '1', 'CHEM', '0104', 'X', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200825', '20514', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2008-02-22', '2007-12-11', '2008-02-11', '2008-05-09', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'KWEISS', NULL),
('200890', '90040', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '32', '30', '48', '40', '24', '16', '24.000', '28', '2008-09-19', '2008-12-12', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'AROULEAU', NULL),
('200890', '90045', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '32', '17', '25', '40', '24', '16', '0.000', '28', '2008-09-19', '2008-12-12', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'AROULEAU', NULL),
('200890', '90050', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '17', '13', '20', '20', '13', '7', '0.000', '14', '2008-09-19', '2008-09-19', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200890', '91368', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '15', '16', '20', '20', '11', '9', '0.000', '14', '2008-09-19', '2008-12-12', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'AROULEAU', NULL),
('200890', '91460', '1', 'CHEM', '0104', 'U', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '13', '25', '30', '0', '30', '0.000', '0', '2008-09-19', '2008-03-06', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JMMAYER', NULL),
('200893', '90040', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '7', '0', '48', '40', '6', '34', '6.000', '6', '2008-09-19', '2008-04-22', '2008-09-08', '2008-12-16', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200893', '90045', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '7', '0', '25', '40', '6', '34', '0.000', '6', '2008-09-19', '2008-04-22', '2008-09-08', '2008-12-16', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200893', '90050', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '5', '0', '20', '20', '4', '16', '0.000', '4', '2008-09-19', '2008-04-22', '2008-09-08', '2008-12-16', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200893', '91368', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '2', '0', '20', '20', '2', '18', '0.000', '2', '2008-09-19', '2008-04-17', '2008-09-08', '2008-12-16', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200894', '90040', '1', 'CHEM', '0104', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '20', '48', '40', '0', '40', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200894', '90045', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '20', '25', '40', '0', '40', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200894', '90050', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '12', '20', '20', '0', '20', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200894', '91368', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '8', '20', '20', '0', '20', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200895', '90040', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '20', '48', '40', '0', '40', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL);
INSERT INTO `SSBSECT` (`SSBSECT_TERM_CODE`, `SSBSECT_CRN`, `SSBSECT_PTRM_CODE`, `SSBSECT_SUBJ_CODE`, `SSBSECT_CRSE_NUMB`, `SSBSECT_SEQ_NUMB`, `SSBSECT_SSTS_CODE`, `SSBSECT_SCHD_CODE`, `SSBSECT_CAMP_CODE`, `SSBSECT_CRSE_TITLE`, `SSBSECT_CREDIT_HRS`, `SSBSECT_BILL_HRS`, `SSBSECT_GMOD_CODE`, `SSBSECT_SAPR_CODE`, `SSBSECT_SESS_CODE`, `SSBSECT_LINK_IDENT`, `SSBSECT_PRNT_IND`, `SSBSECT_GRADABLE_IND`, `SSBSECT_TUIW_IND`, `SSBSECT_REG_ONEUP`, `SSBSECT_PRIOR_ENRL`, `SSBSECT_PROJ_ENRL`, `SSBSECT_MAX_ENRL`, `SSBSECT_ENRL`, `SSBSECT_SEATS_AVAIL`, `SSBSECT_TOT_CREDIT_HRS`, `SSBSECT_CENSUS_ENRL`, `SSBSECT_CENSUS_ENRL_DATE`, `SSBSECT_ACTIVITY_DATE`, `SSBSECT_PTRM_START_DATE`, `SSBSECT_PTRM_END_DATE`, `SSBSECT_PTRM_WEEKS`, `SSBSECT_RESERVED_IND`, `SSBSECT_WAIT_CAPACITY`, `SSBSECT_WAIT_COUNT`, `SSBSECT_WAIT_AVAIL`, `SSBSECT_LEC_HR`, `SSBSECT_LAB_HR`, `SSBSECT_OTH_HR`, `SSBSECT_CONT_HR`, `SSBSECT_ACCT_CODE`, `SSBSECT_ACCL_CODE`, `SSBSECT_CENSUS_2_DATE`, `SSBSECT_ENRL_CUT_OFF_DATE`, `SSBSECT_ACAD_CUT_OFF_DATE`, `SSBSECT_DROP_CUT_OFF_DATE`, `SSBSECT_CENSUS_2_ENRL`, `SSBSECT_VOICE_AVAIL`, `SSBSECT_CAPP_PREREQ_TEST_IND`, `SSBSECT_GSCH_NAME`, `SSBSECT_BEST_OF_COMP`, `SSBSECT_SUBSET_OF_COMP`, `SSBSECT_INSM_CODE`, `SSBSECT_REG_FROM_DATE`, `SSBSECT_REG_TO_DATE`, `SSBSECT_LEARNER_REGSTART_FDATE`, `SSBSECT_LEARNER_REGSTART_TDATE`, `SSBSECT_DUNT_CODE`, `SSBSECT_NUMBER_OF_UNITS`, `SSBSECT_NUMBER_OF_EXTENSIONS`, `SSBSECT_DATA_ORIGIN`, `SSBSECT_USER_ID`, `SSBSECT_INTG_CDE`) VALUES
('200895', '90045', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '20', '25', '40', '0', '40', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200895', '90050', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '12', '20', '20', '0', '20', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200895', '91368', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '8', '20', '20', '0', '20', '0.000', '0', '2008-09-19', '2008-05-27', '2008-09-08', '2008-12-05', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '2008-10-01', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200920', '20016', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '67', '64', '76', '72', '60', '12', '60.000', '59', '2009-02-20', '2009-03-11', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200920', '20020', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '19', '15', '18', '18', '16', '2', '0.000', '16', '2009-02-20', '2009-02-13', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200920', '20022', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '17', '14', '18', '18', '14', '4', '0.000', '13', '2009-02-20', '2009-03-11', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200920', '20489', '1', 'CHEM', '0104', 'X', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '23', '16', '18', '18', '17', '1', '0.000', '17', '2009-02-20', '2009-02-13', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200920', '20492', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '16', '19', '18', '18', '13', '5', '0.000', '13', '2009-02-20', '2009-02-16', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200920', '22357', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '31', '0', '24', '24', '27', '-3', '0.000', '27', '2009-02-20', '2009-02-19', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200920', '22358', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '26', '0', '24', '24', '16', '8', '0.000', '15', '2009-02-20', '2009-03-11', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'GGOTTLIE', NULL),
('200920', '22359', '1', 'CHEM', '0104', 'V', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '25', '0', '24', '24', '17', '7', '0.000', '17', '2009-02-20', '2009-02-19', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'MBARTZ', NULL),
('200923', '20016', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '37', '0', '76', '72', '26', '46', '26.000', '26', '2009-02-20', '2008-11-11', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200923', '20020', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '9', '0', '18', '18', '6', '12', '0.000', '6', '2009-02-20', '2008-11-10', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200923', '20022', '1', 'CHEM', '0104', 'Y', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '10', '0', '18', '18', '8', '10', '0.000', '8', '2009-02-20', '2008-11-11', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200923', '20489', '1', 'CHEM', '0104', 'X', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '13', '0', '18', '18', '9', '9', '0.000', '9', '2009-02-20', '2008-11-11', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200923', '20492', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '6', '0', '18', '18', '4', '14', '0.000', '4', '2009-02-20', '2008-11-10', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200923', '22357', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '29', '0', '24', '24', '19', '5', '0.000', '19', '2009-02-20', '2008-11-11', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200923', '22358', '1', 'CHEM', '0104', 'U', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '1', '0', '24', '24', '0', '24', '0.000', '0', '2009-02-20', '2008-11-10', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200923', '22359', '1', 'CHEM', '0104', 'V', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '7', '0', '24', '24', '5', '19', '0.000', '5', '2009-02-20', '2008-11-10', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200924', '20016', '1', 'CHEM', '0104', 'A', 'I', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '52', '76', '72', '0', '72', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200924', '20020', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '14', '18', '18', '0', '18', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200924', '20022', '1', 'CHEM', '0104', 'Y', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '10', '18', '18', '0', '18', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200924', '20489', '1', 'CHEM', '0104', 'X', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200924', '20492', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '10', '18', '18', '0', '18', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200924', '22357', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '24', '24', '24', '0', '24', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200924', '22358', '1', 'CHEM', '0104', 'U', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '13', '24', '24', '0', '24', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200924', '22359', '1', 'CHEM', '0104', 'V', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '15', '24', '24', '0', '24', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200925', '20016', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '1', '52', '76', '72', '1', '71', '1.000', '1', '2009-02-20', '2009-01-06', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', 'E', NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200925', '20020', '1', 'CHEM', '0104', 'W', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '14', '18', '18', '0', '18', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200925', '20022', '1', 'CHEM', '0104', 'Y', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '10', '18', '18', '0', '18', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200925', '20489', '1', 'CHEM', '0104', 'X', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '18', '18', '18', '0', '18', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200925', '20492', '1', 'CHEM', '0104', 'Z', 'I', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '10', '18', '18', '0', '18', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200925', '22357', '1', 'CHEM', '0104', 'T', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '24', '24', '24', '0', '24', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200925', '22358', '1', 'CHEM', '0104', 'U', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '13', '24', '24', '0', '24', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200925', '22359', '1', 'CHEM', '0104', 'V', 'I', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '15', '24', '24', '0', '24', '0.000', '0', '2009-02-20', '2008-12-15', '2009-02-09', '2009-05-08', '14', NULL, '0', '0', '0', NULL, NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200990', '90036', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '0', '24', '48', '40', '0', '40', '0.000', '0', '2009-09-18', '2009-02-10', '2009-09-07', '2009-12-04', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200990', '90041', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '0', '24', '25', '40', '0', '40', '0.000', '0', '2009-09-18', '2009-02-10', '2009-09-07', '2009-12-04', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200990', '90045', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '13', '20', '20', '0', '20', '0.000', '0', '2009-09-18', '2009-02-10', '2009-09-07', '2009-12-04', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200990', '91245', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '11', '20', '20', '0', '20', '0.000', '0', '2009-09-18', '2009-02-10', '2009-09-07', '2009-12-04', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL),
('200993', '90036', '1', 'CHEM', '0104', 'A', 'A', 'LCT', 'M', NULL, '1.000', '1.000', 'S', NULL, NULL, 'L1', 'Y', 'Y', NULL, '1', '0', '48', '40', '1', '39', '1.000', '1', '2009-09-18', '2009-04-15', '2009-09-07', '2009-12-04', '14', NULL, '0', '0', '0', '1.000', NULL, NULL, '1.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200993', '90041', '1', 'CHEM', '0104', 'T', 'A', 'DSC', 'M', 'Discussion', '0.000', '0.000', 'S', NULL, NULL, 'D1', 'Y', 'N', NULL, '1', '0', '25', '40', '1', '39', '0.000', '1', '2009-09-18', '2009-04-15', '2009-09-07', '2009-12-04', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200993', '90045', '1', 'CHEM', '0104', 'W', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '1', '0', '20', '20', '1', '19', '0.000', '1', '2009-09-18', '2009-04-15', '2009-09-07', '2009-12-04', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'WWW_USER', NULL),
('200993', '91245', '1', 'CHEM', '0104', 'Z', 'A', 'LAB', 'M', 'General Chemistry II Lab', '0.000', '0.000', 'C', NULL, NULL, 'B1', 'Y', 'Y', NULL, '0', '0', '20', '20', '0', '20', '0.000', '0', '2009-09-18', '2009-04-09', '2009-09-07', '2009-12-04', '14', NULL, '0', '0', '0', '0.000', NULL, NULL, '0.000', NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', '0', 'Y', 'N', NULL, NULL, NULL, NULL, '1969-12-31', '1969-12-31', '1969-12-31', '1969-12-31', NULL, NULL, '0', 'Banner', 'JFEEHAN', NULL);

--
-- Dumping data for table `SSBXLST`
--

INSERT INTO `SSBXLST` (`SSBXLST_TERM_CODE`, `SSBXLST_XLST_GROUP`, `SSBXLST_DESC`, `SSBXLST_MAX_ENRL`, `SSBXLST_ENRL`, `SSBXLST_SEATS_AVAIL`, `SSBXLST_ACTIVITY_DATE`) VALUES
('200390', 'D8', NULL, 24, 9, 15, '2003-05-01'),
('200390', 'D9', NULL, 15, 0, 15, '2003-05-01'),
('200390', 'E1', NULL, 15, 6, 9, '2003-05-01'),
('200420', 'D8', NULL, 24, 0, 24, '2003-09-11'),
('200420', 'D9', NULL, 15, 0, 15, '2003-09-11'),
('200420', 'E1', NULL, 15, 0, 15, '2003-09-11'),
('200890', 'G8', NULL, 14, 13, 1, '2008-09-16'),
('200890', 'G9', NULL, 14, 13, 1, '2008-09-16'),
('200893', 'G8', NULL, 14, 4, 10, '2008-04-17'),
('200893', 'G9', NULL, 14, 4, 10, '2008-04-17'),
('200894', 'G8', NULL, 14, 0, 14, '2008-05-27'),
('200894', 'G9', NULL, 14, 0, 14, '2008-05-27'),
('200895', 'G8', NULL, 14, 0, 14, '2008-05-27'),
('200895', 'G9', NULL, 14, 0, 14, '2008-05-27');

--
-- Dumping data for table `SSRATTR`
--

INSERT INTO `SSRATTR` (`SSRATTR_TERM_CODE`, `SSRATTR_CRN`, `SSRATTR_ATTR_CODE`, `SSRATTR_ACTIVITY_DATE`) VALUES
('200390', '90260', 'SCI', '2003-04-09'),
('200420', '20242', 'SCI', '2003-08-21'),
('200490', '90231', 'DED', '2004-03-02'),
('200490', '90231', 'SCI', '2004-02-05'),
('200590', '90193', 'DED', '2005-02-03'),
('200590', '90193', 'SCI', '2005-02-03'),
('200690', '90176', 'DED', '2006-02-15'),
('200690', '90176', 'SCI', '2006-02-15'),
('200695', '90176', 'DED', '2006-06-08'),
('200695', '90176', 'SCI', '2006-06-08'),
('200790', '90152', 'DED', '2007-02-16'),
('200790', '90152', 'SCI', '2007-02-16'),
('200793', '90152', 'DED', '2007-04-12'),
('200793', '90152', 'SCI', '2007-04-12'),
('200794', '90152', 'DED', '2007-06-13'),
('200794', '90152', 'SCI', '2007-06-13'),
('200795', '90152', 'DED', '2007-06-13'),
('200795', '90152', 'SCI', '2007-06-13'),
('200890', '90143', 'DED', '2008-02-15'),
('200890', '90143', 'SCI', '2008-02-15'),
('200893', '90143', 'DED', '2008-04-10'),
('200893', '90143', 'SCI', '2008-04-10'),
('200894', '90143', 'DED', '2008-05-27'),
('200894', '90143', 'SCI', '2008-05-27'),
('200895', '90143', 'DED', '2008-05-27'),
('200895', '90143', 'SCI', '2008-05-27'),
('200990', '90125', 'DED', '2009-02-10'),
('200990', '90125', 'SCI', '2009-02-10'),
('200993', '90125', 'DED', '2009-04-09'),
('200993', '90125', 'SCI', '2009-04-09'),
('200390', '90712', 'DED', '2003-04-22'),
('200390', '90712', 'SCI', '2003-04-22'),
('200420', '20661', 'DED', '2003-08-21'),
('200420', '20661', 'SCI', '2003-08-21'),
('200690', '92757', 'DED', '2006-03-07'),
('200690', '92757', 'SCI', '2006-03-07'),
('200695', '92757', 'DED', '2006-06-08'),
('200695', '92757', 'SCI', '2006-06-08'),
('200790', '92335', 'DED', '2007-02-16'),
('200790', '92335', 'SCI', '2007-02-16'),
('200890', '92418', 'DED', '2008-03-05'),
('200890', '92418', 'SCI', '2008-03-05'),
('200893', '92418', 'DED', '2008-04-10'),
('200893', '92418', 'SCI', '2008-04-10'),
('200894', '92418', 'DED', '2008-05-27'),
('200894', '92418', 'SCI', '2008-05-27'),
('200895', '92418', 'DED', '2008-05-27'),
('200895', '92418', 'SCI', '2008-05-27'),
('200990', '91632', 'DED', '2009-02-10'),
('200990', '91632', 'SCI', '2009-02-10'),
('200390', '90683', 'DED', '2003-09-02'),
('200390', '90683', 'SCI', '2003-09-02'),
('200890', '92443', 'DED', '2008-03-06'),
('200890', '92443', 'SCI', '2008-03-06'),
('200893', '92443', 'DED', '2008-04-10'),
('200893', '92443', 'SCI', '2008-04-10'),
('200894', '92443', 'DED', '2008-05-27'),
('200894', '92443', 'SCI', '2008-05-27'),
('200895', '92443', 'DED', '2008-05-27'),
('200895', '92443', 'SCI', '2008-05-27'),
('200390', '90085', 'DED', '2003-04-02'),
('200390', '90085', 'SCI', '2003-04-02'),
('200420', '20073', 'DED', '2003-08-21'),
('200420', '20073', 'SCI', '2003-08-21'),
('200490', '90066', 'DED', '2004-02-05'),
('200490', '90066', 'SCI', '2004-02-05'),
('200520', '20019', 'DED', '2004-06-08'),
('200520', '20019', 'SCI', '2004-06-08'),
('200590', '90056', 'DED', '2005-02-03'),
('200590', '90056', 'SCI', '2005-02-03'),
('200620', '20017', 'DED', '2005-07-22'),
('200620', '20017', 'SCI', '2005-07-22'),
('200690', '90051', 'DED', '2006-02-15'),
('200690', '90051', 'SCI', '2006-02-15'),
('200695', '90051', 'DED', '2006-06-08'),
('200695', '90051', 'SCI', '2006-06-08'),
('200720', '20017', 'DED', '2006-07-07'),
('200720', '20017', 'SCI', '2006-07-07'),
('200723', '20017', 'DED', '2006-11-02'),
('200723', '20017', 'SCI', '2006-11-02'),
('200724', '20017', 'DED', '2006-12-20'),
('200724', '20017', 'SCI', '2006-12-20'),
('200725', '20017', 'DED', '2006-12-20'),
('200725', '20017', 'SCI', '2006-12-20'),
('200790', '90047', 'DED', '2007-02-16'),
('200790', '90047', 'SCI', '2007-02-16'),
('200793', '90047', 'DED', '2007-04-12'),
('200793', '90047', 'SCI', '2007-04-12'),
('200794', '90047', 'DED', '2007-06-13'),
('200794', '90047', 'SCI', '2007-06-13'),
('200795', '90047', 'DED', '2007-06-13'),
('200795', '90047', 'SCI', '2007-06-13'),
('200820', '20016', 'DED', '2007-07-05'),
('200820', '20016', 'SCI', '2007-07-05'),
('200823', '20016', 'DED', '2007-10-31'),
('200823', '20016', 'SCI', '2007-10-31'),
('200824', '20016', 'DED', '2007-12-11'),
('200824', '20016', 'SCI', '2007-12-11'),
('200825', '20016', 'DED', '2007-12-11'),
('200825', '20016', 'SCI', '2007-12-11'),
('200890', '90040', 'DED', '2008-02-15'),
('200890', '90040', 'SCI', '2008-02-15'),
('200893', '90040', 'DED', '2008-04-10'),
('200893', '90040', 'SCI', '2008-04-10'),
('200894', '90040', 'DED', '2008-05-27'),
('200894', '90040', 'SCI', '2008-05-27'),
('200895', '90040', 'DED', '2008-05-27'),
('200895', '90040', 'SCI', '2008-05-27'),
('200920', '20016', 'DED', '2008-07-17'),
('200920', '20016', 'SCI', '2008-07-17'),
('200920', '22357', 'DED', '2008-09-29'),
('200920', '22357', 'SCI', '2008-09-29'),
('200920', '22358', 'DED', '2008-09-29'),
('200920', '22358', 'SCI', '2008-09-29'),
('200920', '22359', 'DED', '2008-09-29'),
('200920', '22359', 'SCI', '2008-09-29'),
('200923', '20016', 'DED', '2008-10-29'),
('200923', '20016', 'SCI', '2008-10-29'),
('200923', '22357', 'DED', '2008-10-29'),
('200923', '22357', 'SCI', '2008-10-29'),
('200923', '22358', 'DED', '2008-10-29'),
('200923', '22358', 'SCI', '2008-10-29'),
('200923', '22359', 'DED', '2008-10-29'),
('200923', '22359', 'SCI', '2008-10-29'),
('200924', '20016', 'DED', '2008-12-15'),
('200924', '20016', 'SCI', '2008-12-15'),
('200924', '22357', 'DED', '2008-12-15'),
('200924', '22357', 'SCI', '2008-12-15'),
('200924', '22358', 'DED', '2008-12-15'),
('200924', '22358', 'SCI', '2008-12-15'),
('200924', '22359', 'DED', '2008-12-15'),
('200924', '22359', 'SCI', '2008-12-15'),
('200925', '20016', 'DED', '2008-12-15'),
('200925', '20016', 'SCI', '2008-12-15'),
('200925', '22357', 'DED', '2008-12-15'),
('200925', '22357', 'SCI', '2008-12-15'),
('200925', '22358', 'DED', '2008-12-15'),
('200925', '22358', 'SCI', '2008-12-15'),
('200925', '22359', 'DED', '2008-12-15'),
('200925', '22359', 'SCI', '2008-12-15'),
('200990', '90036', 'DED', '2009-02-10'),
('200990', '90036', 'SCI', '2009-02-10'),
('200993', '90036', 'DED', '2009-04-09'),
('200993', '90036', 'SCI', '2009-04-09');

--
-- Dumping data for table `SSRMEET`
--

INSERT INTO `SSRMEET` (`SSRMEET_TERM_CODE`, `SSRMEET_CRN`, `SSRMEET_DAYS_CODE`, `SSRMEET_DAY_NUMBER`, `SSRMEET_BEGIN_TIME`, `SSRMEET_END_TIME`, `SSRMEET_BLDG_CODE`, `SSRMEET_ROOM_CODE`, `SSRMEET_ACTIVITY_DATE`, `SSRMEET_START_DATE`, `SSRMEET_END_DATE`, `SSRMEET_CATAGORY`, `SSRMEET_SUN_DAY`, `SSRMEET_MON_DAY`, `SSRMEET_TUE_DAY`, `SSRMEET_WED_DAY`, `SSRMEET_THU_DAY`, `SSRMEET_FRI_DAY`, `SSRMEET_SAT_DAY`, `SSRMEET_SCHD_CODE`, `SSRMEET_OVER_RIDE`, `SSRMEET_CREDIT_HR_SESS`, `SSRMEET_MEET_NO`, `SSRMEET_HRS_WEEK`, `SSRMEET_FUNC_CODE`, `SSRMEET_COMT_CODE`, `SSRMEET_SCHS_CODE`, `SSRMEET_MTYP_CODE`, `SSRMEET_DATA_ORIGIN`, `SSRMEET_USER_ID`) VALUES
('200390', '90085', NULL, NULL, '1100', '1215', NULL, NULL, '2003-04-02', '2003-09-08', '2003-12-16', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '29', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90093', NULL, NULL, '0800', '0850', NULL, NULL, '2003-05-02', '2003-09-08', '2003-12-16', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'DSC', NULL, '0.000', '14', '0.83', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90105', NULL, NULL, '1330', '1615', NULL, NULL, '2003-04-02', '2003-09-08', '2003-12-16', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '15', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90113', NULL, NULL, '1330', '1615', NULL, NULL, '2003-04-02', '2003-09-08', '2003-12-16', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '14', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90260', NULL, NULL, '1010', '1100', NULL, NULL, '2003-04-09', '2003-09-08', '2003-12-16', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '43', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90712', NULL, NULL, '1115', '1205', NULL, NULL, '2003-04-22', '2003-09-08', '2003-12-16', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '43', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90713', NULL, NULL, '1330', '1615', NULL, NULL, '2003-06-02', '2003-09-08', '2003-12-16', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '15', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90714', NULL, NULL, '1330', '1615', NULL, NULL, '2003-06-02', '2003-09-08', '2003-12-16', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '14', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200420', '20073', NULL, NULL, '1100', '1215', 'MBH', '216', '2003-09-25', '2004-02-09', '2004-05-18', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '29', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200420', '20081', NULL, NULL, '0800', '0850', 'MBH', '438', '2003-09-25', '2004-02-09', '2004-05-18', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'DSC', 'O', '0.000', '14', '0.83', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200420', '20092', NULL, NULL, '1330', '1615', 'MBH', '560', '2003-09-25', '2004-02-09', '2004-05-18', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '15', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200420', '20100', NULL, NULL, '1330', '1615', 'MBH', '560', '2003-09-25', '2004-02-09', '2004-05-18', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '14', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200420', '21470', NULL, NULL, '1435', '1525', 'MBH', '219', '2003-09-25', '2004-02-09', '2004-05-18', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'DSC', NULL, '0.000', '14', '0.83', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200420', '21475', NULL, NULL, '1330', '1420', 'MBH', '219', '2003-09-25', '2004-02-09', '2004-05-18', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'DSC', NULL, '0.000', '14', '0.83', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200420', '21479', NULL, NULL, '1330', '1615', 'MBH', '560', '2003-09-25', '2004-02-09', '2004-05-18', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '15', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200420', '21483', NULL, NULL, '1330', '1615', 'MBH', '560', '2003-09-25', '2004-02-09', '2004-05-18', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '14', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200490', '90066', NULL, NULL, '1100', '1215', 'MBH', '216', '2004-02-26', '2004-09-13', '2004-12-10', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200490', '90074', NULL, NULL, '0800', '0850', 'MBH', '104', '2004-03-03', '2004-09-13', '2004-12-10', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200490', '90083', NULL, NULL, '1330', '1615', 'MBH', '560', '2004-02-27', '2004-09-13', '2004-12-10', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200490', '90091', NULL, NULL, '1330', '1615', 'MBH', '560', '2004-03-03', '2004-09-13', '2004-12-10', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200490', '90231', NULL, NULL, '1010', '1100', 'MBH', '538', '2004-03-04', '2004-09-13', '2004-12-10', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', 'O', '1.000', '39', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200520', '20019', NULL, NULL, '1100', '1215', 'MBH', '216', '2004-09-30', '2005-02-07', '2005-05-06', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200520', '20022', NULL, NULL, '0800', '0850', 'MBH', '219', '2004-09-30', '2005-02-07', '2005-05-06', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200520', '20024', NULL, NULL, '1330', '1615', 'MBH', '560', '2004-09-30', '2005-02-07', '2005-05-06', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200520', '20027', NULL, NULL, '1330', '1615', 'MBH', '560', '2004-09-30', '2005-02-07', '2005-05-06', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200520', '20714', NULL, NULL, '1330', '1420', 'MBH', '219', '2004-09-30', '2005-02-07', '2005-05-06', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200520', '20719', NULL, NULL, '1435', '1525', 'MBH', '219', '2004-09-30', '2005-02-07', '2005-05-06', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200520', '20723', NULL, NULL, '1330', '1615', 'MBH', '560', '2004-09-30', '2005-02-07', '2005-05-06', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200520', '20727', NULL, NULL, '1330', '1615', 'MBH', '560', '2004-09-30', '2005-02-07', '2005-05-06', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200590', '90056', NULL, NULL, '1100', '1215', 'MBH', '216', '2005-02-28', '2005-09-12', '2005-12-09', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200590', '90062', NULL, NULL, '0800', '0850', 'MBH', '219', '2005-02-28', '2005-09-12', '2005-12-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200590', '90068', NULL, NULL, '1330', '1615', 'MBH', '560', '2005-02-28', '2005-09-12', '2005-12-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200590', '90074', NULL, NULL, '1330', '1615', 'MBH', '560', '2005-02-28', '2005-09-12', '2005-12-09', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200590', '90193', NULL, NULL, '0905', '0955', 'MBH', '438', '2005-03-10', '2005-09-12', '2005-12-09', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', 'O', '0.000', '39', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200620', '20017', NULL, NULL, '1100', '1215', 'MBH', '216', '2005-09-28', '2006-02-13', '2006-05-12', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200620', '20020', NULL, NULL, '0800', '0850', 'MBH', '438', '2005-10-24', '2006-02-13', '2006-05-12', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', 'O', '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMNUCEDE'),
('200620', '20022', NULL, NULL, '1330', '1615', 'MBH', '560', '2005-09-28', '2006-02-13', '2006-05-12', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200620', '20024', NULL, NULL, '1330', '1615', 'MBH', '560', '2005-09-28', '2006-02-13', '2006-05-12', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200620', '20628', NULL, NULL, '0825', '0915', 'MBH', '438', '2005-09-28', '2006-02-13', '2006-05-12', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200620', '20631', NULL, NULL, '0800', '0850', 'MBH', '438', '2005-10-24', '2006-02-13', '2006-05-12', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'DSC', 'O', '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMNUCEDE'),
('200620', '20634', NULL, NULL, '1330', '1615', 'MBH', '560', '2005-09-28', '2006-02-13', '2006-05-12', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200620', '20638', NULL, NULL, '1330', '1615', 'MBH', '560', '2005-09-28', '2006-02-13', '2006-05-12', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200690', '90051', NULL, NULL, '0905', '0955', 'MBH', '216', '2006-03-03', '2006-09-11', '2006-12-08', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200690', '90057', NULL, NULL, '1230', '1320', 'MBH', '560', '2006-04-12', '2006-09-11', '2006-12-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200690', '90062', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-03-03', '2006-09-11', '2006-12-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200690', '90176', NULL, NULL, '0905', '0955', 'MBH', '538', '2006-03-07', '2006-09-11', '2006-12-08', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200690', '92757', NULL, NULL, '1100', '1215', 'MBH', '419', '2006-03-07', '2006-09-11', '2006-12-08', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', 'O', '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200690', '92760', NULL, NULL, '1230', '1615', 'MBH', '419', '2006-03-07', '2006-09-11', '2006-12-08', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', NULL, '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200690', '93032', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-04-05', '2006-09-11', '2006-12-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200690', '93036', NULL, NULL, '1230', '1320', 'MBH', '560', '2006-04-12', '2006-09-11', '2006-12-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200695', '90051', NULL, NULL, '0905', '0955', 'MBH', '216', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200695', '90057', NULL, NULL, '1230', '1320', 'MBH', '560', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200695', '90062', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200695', '90176', NULL, NULL, '0905', '0955', 'MBH', '538', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200695', '92704', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200695', '92757', NULL, NULL, '1100', '1215', 'MBH', '419', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', 'O', '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200695', '92760', NULL, NULL, '1230', '1615', 'MBH', '419', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', NULL, '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200695', '93032', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200695', '93036', NULL, NULL, '1230', '1320', 'MBH', '560', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200695', '93037', NULL, NULL, '1230', '1320', 'MBH', '560', '2006-06-08', '2006-09-11', '2006-12-08', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200720', '20017', NULL, NULL, '1115', '1205', 'MBH', '216', '2007-03-02', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200720', '20020', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-01', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMNUCEDE'),
('200720', '20022', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-03-02', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200720', '20024', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-03-02', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200720', '20571', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-01', '2007-02-12', '2007-05-11', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMNUCEDE'),
('200720', '20573', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-01', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMNUCEDE'),
('200720', '20575', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-03-02', '2007-02-12', '2007-05-11', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200720', '20578', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-03-02', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200720', '22922', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-01', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMNUCEDE'),
('200723', '20017', NULL, NULL, '1115', '1205', 'MBH', '216', '2006-11-02', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200723', '20020', NULL, NULL, '1230', '1320', 'MBH', '560', '2006-11-02', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200723', '20022', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-11-02', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200723', '20024', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-11-02', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200723', '20571', NULL, NULL, '1230', '1320', 'MBH', '560', '2006-11-02', '2007-02-12', '2007-05-11', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200723', '20573', NULL, NULL, '1230', '1320', 'MBH', '560', '2006-11-02', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200723', '20575', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-11-02', '2007-02-12', '2007-05-11', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200723', '20578', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-11-02', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200723', '22922', NULL, NULL, '1230', '1320', 'MBH', '560', '2006-11-02', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200724', '20017', NULL, NULL, '1115', '1205', 'MBH', '216', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200724', '20020', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200724', '20022', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200724', '20024', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200724', '20571', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200724', '20573', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200724', '20575', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200724', '20578', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200724', '22922', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200725', '20017', NULL, NULL, '1115', '1205', 'MBH', '216', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200725', '20020', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200725', '20022', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200725', '20024', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200725', '20571', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200725', '20573', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200725', '20575', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200725', '20578', NULL, NULL, '1330', '1615', 'MBH', '560', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200725', '22922', NULL, NULL, '1230', '1320', 'MBH', '438', '2006-12-20', '2007-02-12', '2007-05-11', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200790', '90047', NULL, NULL, '1100', '1215', 'MBH', '216', '2007-03-07', '2007-09-10', '2007-12-07', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200790', '90052', NULL, NULL, '0800', '0850', 'MBH', '438', '2007-03-07', '2007-09-10', '2007-12-07', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200790', '90057', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-03-07', '2007-09-10', '2007-12-07', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200790', '90152', NULL, NULL, '1115', '1205', 'MBH', '538', '2007-03-07', '2007-09-10', '2007-12-07', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200790', '92285', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-03-08', '2007-09-10', '2007-12-07', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200790', '92595', NULL, NULL, '0800', '0850', 'MBH', '438', '2007-03-07', '2007-09-10', '2007-12-07', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200793', '90047', NULL, NULL, '1100', '1215', 'MBH', '216', '2007-04-12', '2007-09-10', '2007-12-18', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200793', '90052', NULL, NULL, '0800', '0850', 'MBH', '438', '2007-04-12', '2007-09-10', '2007-12-18', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200793', '90057', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-04-12', '2007-09-10', '2007-12-18', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200793', '90152', NULL, NULL, '1115', '1205', 'MBH', '538', '2007-04-12', '2007-09-10', '2007-12-18', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200793', '92285', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-04-12', '2007-09-10', '2007-12-18', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200793', '92591', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-04-12', '2007-09-10', '2007-12-18', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200793', '92595', NULL, NULL, '0800', '0850', 'MBH', '438', '2007-04-12', '2007-09-10', '2007-12-18', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200794', '90047', NULL, NULL, '1100', '1215', 'MBH', '216', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200794', '90052', NULL, NULL, '0800', '0850', 'MBH', '438', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200794', '90057', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200794', '90152', NULL, NULL, '1115', '1205', 'MBH', '538', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200794', '92285', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200794', '92595', NULL, NULL, '0800', '0850', 'MBH', '438', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200795', '90047', NULL, NULL, '1100', '1215', 'MBH', '216', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200795', '90052', NULL, NULL, '0800', '0850', 'MBH', '438', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200795', '90057', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200795', '90152', NULL, NULL, '1115', '1205', 'MBH', '538', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', NULL, '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200795', '92285', NULL, NULL, '1330', '1615', 'MBH', '560', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', NULL, '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200795', '92595', NULL, NULL, '0800', '0850', 'MBH', '438', '2007-06-13', '2007-09-10', '2007-12-07', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', NULL, '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200820', '20016', NULL, NULL, '1100', '1215', 'MBH', '216', '2007-09-27', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200820', '20021', NULL, NULL, '1330', '1415', 'MBH', '411', '2007-10-04', '2008-02-11', '2008-05-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '0.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200820', '20021', NULL, NULL, '1430', '1645', 'MBH', '560', '2007-11-13', '2008-02-11', '2008-05-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200820', '20023', NULL, NULL, '1300', '1415', 'MBH', '411', '2007-10-04', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '1.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200820', '20023', NULL, NULL, '1430', '1615', 'MBH', '560', '2007-11-13', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '1.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200820', '20511', NULL, NULL, '1300', '1415', 'MBH', '411', '2007-10-10', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '1.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200820', '20511', NULL, NULL, '1430', '1615', 'MBH', '560', '2007-11-13', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '1.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200820', '20514', NULL, NULL, '1330', '1415', 'MBH', '411', '2007-10-04', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', 'O', '0.000', '13', '0.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200820', '20514', NULL, NULL, '1430', '1645', 'MBH', '560', '2007-11-13', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200823', '20016', NULL, NULL, '1100', '1215', 'MBH', '216', '2007-10-31', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200823', '20021', NULL, NULL, '1330', '1415', 'MBH', '411', '2007-10-31', '2008-02-11', '2008-05-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '0.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200823', '20021', NULL, NULL, '1430', '1645', 'MBH', '560', '2007-11-13', '2008-02-11', '2008-05-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200823', '20023', NULL, NULL, '1300', '1415', 'MBH', '411', '2007-10-31', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '1.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200823', '20023', NULL, NULL, '1430', '1615', 'MBH', '560', '2007-11-13', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '1.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200823', '20511', NULL, NULL, '1300', '1415', 'MBH', '411', '2007-10-31', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '1.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200823', '20511', NULL, NULL, '1430', '1615', 'MBH', '560', '2007-11-13', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '1.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200823', '20514', NULL, NULL, '1330', '1415', 'MBH', '411', '2007-10-31', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', 'O', '0.000', '13', '0.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200823', '20514', NULL, NULL, '1430', '1645', 'MBH', '560', '2007-11-13', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200824', '20016', NULL, NULL, '1100', '1215', 'MBH', '216', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200824', '20021', NULL, NULL, '1330', '1415', 'MBH', '411', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '0.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200824', '20021', NULL, NULL, '1430', '1645', 'MBH', '560', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200824', '20023', NULL, NULL, '1300', '1415', 'MBH', '411', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '1.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200824', '20023', NULL, NULL, '1430', '1615', 'MBH', '560', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '1.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200824', '20511', NULL, NULL, '1300', '1415', 'MBH', '411', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '1.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200824', '20511', NULL, NULL, '1430', '1615', 'MBH', '560', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '1.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200824', '20514', NULL, NULL, '1330', '1415', 'MBH', '411', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', 'O', '0.000', '13', '0.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200824', '20514', NULL, NULL, '1430', '1645', 'MBH', '560', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200825', '20016', NULL, NULL, '1100', '1215', 'MBH', '216', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200825', '20021', NULL, NULL, '1330', '1415', 'MBH', '411', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '0.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200825', '20021', NULL, NULL, '1430', '1645', 'MBH', '560', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200825', '20023', NULL, NULL, '1300', '1415', 'MBH', '411', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '1.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200825', '20023', NULL, NULL, '1430', '1615', 'MBH', '560', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '1.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200825', '20511', NULL, NULL, '1300', '1415', 'MBH', '411', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', 'O', '0.000', '13', '1.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200825', '20511', NULL, NULL, '1430', '1615', 'MBH', '560', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '1.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200825', '20514', NULL, NULL, '1330', '1415', 'MBH', '411', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', 'O', '0.000', '13', '0.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200825', '20514', NULL, NULL, '1430', '1645', 'MBH', '560', '2007-12-11', '2008-02-11', '2008-05-09', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.25', NULL, NULL, NULL, 'CLAS', 'Banner', 'KWEISS'),
('200890', '90040', NULL, NULL, '1100', '1215', 'MBH', '216', '2008-03-06', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200890', '90045', NULL, NULL, '0800', '0850', 'MBH', '104', '2008-03-06', '2008-09-08', '2008-12-05', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200890', '90050', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-03-06', '2008-09-08', '2008-12-05', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200890', '90143', NULL, NULL, '1115', '1205', 'MBH', '538', '2008-03-05', '2008-09-08', '2008-12-05', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '38', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200890', '91368', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-03-06', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200890', '92418', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-03-05', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200890', '92423', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-03-05', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200893', '90040', NULL, NULL, '1100', '1215', 'MBH', '216', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '28', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200893', '90045', NULL, NULL, '0800', '0850', 'MBH', '104', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '15', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200893', '90050', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '15', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200893', '90143', NULL, NULL, '1115', '1205', 'MBH', '538', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '43', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200893', '91368', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '14', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200893', '92418', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '28', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200893', '92423', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '14', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '90040', NULL, NULL, '1100', '1215', 'MBH', '216', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '90045', NULL, NULL, '0800', '0850', 'MBH', '104', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '90050', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '90143', NULL, NULL, '1115', '1205', 'MBH', '538', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '38', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '91368', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '92418', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '92423', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '90040', NULL, NULL, '1100', '1215', 'MBH', '216', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '90045', NULL, NULL, '0800', '0850', 'MBH', '104', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '90050', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '90143', NULL, NULL, '1115', '1205', 'MBH', '538', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '38', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '91368', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '92418', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '92423', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200920', '20016', NULL, NULL, '1100', '1215', 'MBH', '216', '2008-09-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200920', '20020', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-09-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200920', '20022', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-09-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200920', '20489', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-09-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200920', '20492', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-09-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'LAB', NULL, '0.000', '12', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200920', '22357', NULL, NULL, '1345', '1435', 'MBH', '538', '2008-09-29', '2009-02-09', '2009-05-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200920', '22358', NULL, NULL, '1450', '1540', 'MBH', '538', '2008-09-29', '2009-02-09', '2009-05-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200920', '22359', NULL, NULL, '0825', '0915', 'MBH', '538', '2008-09-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200923', '20016', NULL, NULL, '1100', '1215', 'MBH', '216', '2008-10-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200923', '20020', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-10-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200923', '20022', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-10-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200923', '20489', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-10-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200923', '20492', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-10-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'LAB', NULL, '0.000', '12', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200923', '22357', NULL, NULL, '1345', '1435', 'MBH', '538', '2008-10-29', '2009-02-09', '2009-05-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200923', '22358', NULL, NULL, '1450', '1540', 'MBH', '538', '2008-10-29', '2009-02-09', '2009-05-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200923', '22359', NULL, NULL, '0825', '0915', 'MBH', '538', '2008-10-29', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200924', '20016', NULL, NULL, '1100', '1215', 'MBH', '216', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200924', '20020', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200924', '20022', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200924', '20489', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200924', '20492', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'LAB', NULL, '0.000', '12', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200924', '22357', NULL, NULL, '1345', '1435', 'MBH', '538', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200924', '22358', NULL, NULL, '1450', '1540', 'MBH', '538', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200924', '22359', NULL, NULL, '0825', '0915', 'MBH', '538', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200925', '20016', NULL, NULL, '1100', '1215', 'MBH', '216', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200925', '20020', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200925', '20022', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200925', '20489', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, 'W', NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN');
INSERT INTO `SSRMEET` (`SSRMEET_TERM_CODE`, `SSRMEET_CRN`, `SSRMEET_DAYS_CODE`, `SSRMEET_DAY_NUMBER`, `SSRMEET_BEGIN_TIME`, `SSRMEET_END_TIME`, `SSRMEET_BLDG_CODE`, `SSRMEET_ROOM_CODE`, `SSRMEET_ACTIVITY_DATE`, `SSRMEET_START_DATE`, `SSRMEET_END_DATE`, `SSRMEET_CATAGORY`, `SSRMEET_SUN_DAY`, `SSRMEET_MON_DAY`, `SSRMEET_TUE_DAY`, `SSRMEET_WED_DAY`, `SSRMEET_THU_DAY`, `SSRMEET_FRI_DAY`, `SSRMEET_SAT_DAY`, `SSRMEET_SCHD_CODE`, `SSRMEET_OVER_RIDE`, `SSRMEET_CREDIT_HR_SESS`, `SSRMEET_MEET_NO`, `SSRMEET_HRS_WEEK`, `SSRMEET_FUNC_CODE`, `SSRMEET_COMT_CODE`, `SSRMEET_SCHS_CODE`, `SSRMEET_MTYP_CODE`, `SSRMEET_DATA_ORIGIN`, `SSRMEET_USER_ID`) VALUES
('200925', '20492', NULL, NULL, '1330', '1615', 'MBH', '560', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, NULL, NULL, NULL, 'F', NULL, 'LAB', NULL, '0.000', '12', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200925', '22357', NULL, NULL, '1345', '1435', 'MBH', '538', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200925', '22358', NULL, NULL, '1450', '1540', 'MBH', '538', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200925', '22359', NULL, NULL, '0825', '0915', 'MBH', '538', '2008-12-15', '2009-02-09', '2009-05-08', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200990', '90036', NULL, NULL, '0930', '1045', 'MBH', '220', '2009-02-27', '2009-09-07', '2009-12-04', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200990', '90041', NULL, NULL, '0800', '0850', 'MBH', '104', '2009-02-26', '2009-09-07', '2009-12-04', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200990', '90045', NULL, NULL, '1330', '1615', 'MBH', '560', '2009-02-26', '2009-09-07', '2009-12-04', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200990', '90125', NULL, NULL, '0905', '0955', 'MBH', '538', '2009-03-03', '2009-09-07', '2009-12-04', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '38', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200990', '91245', NULL, NULL, '1330', '1615', 'MBH', '560', '2009-02-26', '2009-09-07', '2009-12-04', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JMMAYER'),
('200993', '90036', NULL, NULL, '0930', '1045', 'MBH', '220', '2009-04-09', '2009-09-07', '2009-12-04', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200993', '90041', NULL, NULL, '0800', '0850', 'MBH', '104', '2009-04-09', '2009-09-07', '2009-12-04', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'DSC', NULL, '0.000', '13', '0.83', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200993', '90045', NULL, NULL, '1330', '1615', 'MBH', '560', '2009-04-09', '2009-09-07', '2009-12-04', '01', NULL, 'M', NULL, NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200993', '90125', NULL, NULL, '0905', '0955', 'MBH', '538', '2009-04-09', '2009-09-07', '2009-12-04', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '38', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200993', '91245', NULL, NULL, '1330', '1615', 'MBH', '560', '2009-04-09', '2009-09-07', '2009-12-04', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '13', '2.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200390', '90683', NULL, NULL, '1115', '1205', NULL, NULL, '2003-04-18', '2003-09-08', '2003-12-16', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '43', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90684', NULL, NULL, '1330', '1615', NULL, NULL, '2003-04-18', '2003-09-08', '2003-12-16', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '15', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90685', NULL, NULL, '1330', '1615', NULL, NULL, '2003-04-18', '2003-09-08', '2003-12-16', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '14', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90712', NULL, NULL, '1115', '1205', NULL, NULL, '2003-04-22', '2003-09-08', '2003-12-16', '01', NULL, 'M', NULL, 'W', NULL, 'F', NULL, 'LCT', NULL, '1.000', '43', '2.50', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90713', NULL, NULL, '1330', '1615', NULL, NULL, '2003-06-02', '2003-09-08', '2003-12-16', '01', NULL, NULL, 'T', NULL, NULL, NULL, NULL, 'LAB', NULL, '0.000', '15', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200390', '90714', NULL, NULL, '1330', '1615', NULL, NULL, '2003-06-02', '2003-09-08', '2003-12-16', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '14', '2.75', NULL, NULL, NULL, 'CLAS', NULL, NULL),
('200890', '92418', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-03-05', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200890', '92423', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-03-05', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200890', '92443', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-03-06', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', 'O', '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200890', '92449', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-03-06', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', 'O', '0.000', '13', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'MCLEAN'),
('200893', '92418', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '28', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200893', '92423', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '14', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200893', '92443', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', 'O', '1.000', '28', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200893', '92449', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-04-10', '2008-09-08', '2008-12-16', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', 'O', '0.000', '14', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '92418', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '92423', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '92443', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', 'O', '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200894', '92449', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', 'O', '0.000', '13', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '92418', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', NULL, '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '92423', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', NULL, '0.000', '13', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '92443', NULL, NULL, '1100', '1215', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, 'T', NULL, 'R', NULL, NULL, 'LCT', 'O', '1.000', '26', '2.50', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN'),
('200895', '92449', NULL, NULL, '1230', '1615', 'MBH', '419', '2008-05-27', '2008-09-08', '2008-12-05', '01', NULL, NULL, NULL, NULL, 'R', NULL, NULL, 'LAB', 'O', '0.000', '13', '3.75', NULL, NULL, NULL, 'CLAS', 'Banner', 'JFEEHAN');

--
-- Dumping data for table `SSRXLST`
--

INSERT INTO `SSRXLST` (`SSRXLST_TERM_CODE`, `SSRXLST_XLST_GROUP`, `SSRXLST_CRN`, `SSRXLST_ACTIVITY_DATE`) VALUES
('200390', 'D8', '90683', '2003-05-01'),
('200390', 'D8', '90712', '2003-05-01'),
('200390', 'D9', '90684', '2003-05-01'),
('200390', 'D9', '90713', '2003-05-01'),
('200390', 'E1', '90685', '2003-05-01'),
('200390', 'E1', '90714', '2003-05-01'),
('200420', 'D8', '20636', '2003-09-11'),
('200420', 'D8', '20661', '2003-09-11'),
('200420', 'D9', '20637', '2003-09-11'),
('200420', 'D9', '20662', '2003-09-11'),
('200420', 'E1', '20638', '2003-09-11'),
('200420', 'E1', '20663', '2003-09-11'),
('200890', 'G8', '92418', '2008-03-06'),
('200890', 'G8', '92443', '2008-03-06'),
('200890', 'G9', '92423', '2008-03-06'),
('200890', 'G9', '92449', '2008-03-06'),
('200893', 'G8', '92418', '2008-04-10'),
('200893', 'G8', '92443', '2008-04-10'),
('200893', 'G9', '92423', '2008-04-10'),
('200893', 'G9', '92449', '2008-04-10'),
('200894', 'G8', '92418', '2008-05-27'),
('200894', 'G8', '92443', '2008-05-27'),
('200894', 'G9', '92423', '2008-05-27'),
('200894', 'G9', '92449', '2008-05-27'),
('200895', 'G8', '92418', '2008-05-27'),
('200895', 'G8', '92443', '2008-05-27'),
('200895', 'G9', '92423', '2008-05-27'),
('200895', 'G9', '92449', '2008-05-27');

--
-- Dumping data for table `STVACYR`
--


--
-- Dumping data for table `STVAPRV`
--


--
-- Dumping data for table `STVASTY`
--


--
-- Dumping data for table `STVATTR`
--

INSERT INTO `STVATTR` (`STVATTR_CODE`, `STVATTR_DESC`, `STVATTR_ACTIVITY_DATE`) VALUES
('AAL', ' AAL', '0000-00-00'),
('ART', ' ART', '0000-00-00'),
('CMP', ' CMP', '0000-00-00'),
('CW', ' CW', '0000-00-00'),
('DED', ' DED', '0000-00-00'),
('EUR', ' EUR', '0000-00-00'),
('HIS', ' HIS', '0000-00-00'),
('LIT', ' LIT', '0000-00-00'),
('LNG', ' LNG', '0000-00-00'),
('NOR', ' NOR', '0000-00-00'),
('OTH', ' OTH', '0000-00-00'),
('PE', ' PE', '0000-00-00'),
('PHL', ' PHL', '0000-00-00'),
('SCI', ' SCI', '0000-00-00'),
('SOC', ' SOC', '0000-00-00'),
('USA', ' USA', '0000-00-00');

--
-- Dumping data for table `STVBLDG`
--

INSERT INTO `STVBLDG` (`STVBLDG_CODE`, `STVBLDG_DESC`, `STVBLDG_ACTIVITY_DATE`, `STVBLDG_VR_MSG_NO`) VALUES
('MBH', 'McCardell Bicentennial Hall', '2008-01-21', '1');

--
-- Dumping data for table `STVCAMP`
--

INSERT INTO `STVCAMP` (`STVCAMP_CODE`, `STVCAMP_DESC`, `STVCAMP_ACTIVITY_DATE`, `STVCAMP_DICD_CODE`) VALUES
('BL', 'Bread Loaf Campus-Vermont', '2004-09-02', NULL),
('M', 'Main', '1995-01-04', NULL);

--
-- Dumping data for table `STVCIPC`
--


--
-- Dumping data for table `STVCOLL`
--


--
-- Dumping data for table `STVCOMT`
--


--
-- Dumping data for table `STVCSTA`
--


--
-- Dumping data for table `STVDEPT`
--

INSERT INTO `STVDEPT` (`STVDEPT_CODE`, `STVDEPT_DESC`, `STVDEPT_ACTIVITY_DATE`, `STVDEPT_SYSTEM_REQ_IND`, `STVDEPT_VR_MSG_NO`) VALUES
('CHEM', 'Chemistry & Biochemistry', '0000-00-00', '1', NULL),
('GEOG', 'Geography', '0000-00-00', '1', NULL),
('GEOL', 'Geology', '0000-00-00', '1', NULL),
('PHYS', 'Physics', '0000-00-00', '1', NULL);

--
-- Dumping data for table `STVDIVS`
--

INSERT INTO `STVDIVS` (`STVDIVS_CODE`, `STVDIVS_DESC`, `STVDIVS_ACTIVITY_DATE`) VALUES
('ARTS', 'Arts', '2001-05-30'),
('BLSE', 'Bread Loaf School of English', '2003-01-23'),
('HUMN', 'Humanities', '2003-01-09'),
('IM', 'International Management', '2009-02-19'),
('INTR', 'Interdisciplinary', '2004-10-11'),
('IP', 'International Policy Studies', '2009-02-19'),
('IPMG', 'Int''l Policy & Management', '2009-02-19'),
('LANG', 'Languages', '2001-05-30'),
('LE', 'Language Education', '2009-02-19'),
('LITR', 'Literature', '2003-01-09'),
('LS', 'Language Studies', '2009-02-19'),
('LSCH', 'Language School', '2003-01-09'),
('MSAB', 'Middlebury Schools Abroad', '2003-06-16'),
('NSCI', 'Natural Sciences', '2001-05-30'),
('OCST', 'Approved Off-Campus Study', '2003-06-16'),
('PE', 'Physical Education', '2003-01-17'),
('SSCI', 'Social Sciences', '2001-05-30'),
('TI', 'Translation & Interpretation', '2009-02-19'),
('TILE', 'Transltn, Interpret & Lang Edu', '2009-02-19');

--
-- Dumping data for table `STVFCNT`
--


--
-- Dumping data for table `STVLEVL`
--

INSERT INTO `STVLEVL` (`STVLEVL_CODE`, `STVLEVL_DESC`, `STVLEVL_ACTIVITY_DATE`, `STVLEVL_ACAD_IND`, `STVLEVL_CEU_IND`, `STVLEVL_SYSTEM_REQ_IND`, `STVLEVL_VR_MSG_NO`, `STVLEVL_EDI_EQUIV`) VALUES
('CE', 'Continuing Education', '2003-11-03', NULL, 'Y', NULL, NULL, NULL),
('UG', 'Undergraduate', '2003-10-28', NULL, 'N', NULL, NULL, NULL),
('GR', 'Graduate', '2003-04-17', NULL, 'N', NULL, NULL, NULL),
('ND', 'Non-degree', '2009-04-02', NULL, 'N', NULL, NULL, NULL);

--
-- Dumping data for table `STVMEET`
--


--
-- Dumping data for table `STVPWAV`
--


--
-- Dumping data for table `STVREPS`
--


--
-- Dumping data for table `STVSCHD`
--

INSERT INTO `STVSCHD` (`STVSCHD_CODE`, `STVSCHD_DESC`, `STVSCHD_ACTIVITY_DATE`, `STVSCHD_INSTRUCT_METHOD`, `STVSCHD_COOP_IND`, `STVSCHD_AUTO_SCHEDULER_IND`, `STVSCHD_INSM_CODE`, `STVSCHD_VR_MSG_NO`) VALUES
('DML', 'DML Research Paper', '2003-10-18', NULL, 'N', 'N', NULL, NULL),
('DR1', ' Drill 1', '2003-10-18', NULL, 'N', 'Y', NULL, NULL),
('DR2', ' Drill 2', '2003-10-18', NULL, 'N', 'N', NULL, NULL),
('DSC', ' Discussion', '2003-10-18', NULL, 'N', 'Y', NULL, NULL),
('IND', ' Independent Study', '2003-10-18', NULL, 'N', 'N', NULL, NULL),
('INT', ' Internship', '2003-10-18', NULL, 'N', 'N', NULL, NULL),
('LA2', 'Additional Lab', '2004-04-16', NULL, 'N', 'N', NULL, NULL),
('LA3', 'Additional Lab', '2004-04-16', NULL, 'N', 'N', NULL, NULL),
('LAB', '  Lab', '2003-10-18', NULL, 'N', 'Y', NULL, NULL),
('LCT', '    Lecture', '2003-10-18', NULL, 'N', 'Y', NULL, NULL),
('PE', ' PE Course', '2003-10-18', NULL, 'N', 'Y', NULL, NULL),
('PLB', ' Pre-Lab', '2003-10-18', NULL, 'N', 'Y', NULL, NULL),
('SCR', ' Screening', '2003-10-18', NULL, 'N', 'Y', NULL, NULL),
('SEM', ' Seminar', '2003-10-18', NULL, 'N', 'Y', NULL, NULL),
('SNR', ' Senior Work', '2003-10-18', NULL, 'N', 'N', NULL, NULL),
('WKS', 'Workshop', '2009-02-19', NULL, 'N', 'N', NULL, '8');

--
-- Dumping data for table `STVSUBJ`
--

INSERT INTO `STVSUBJ` (`STVSUBJ_CODE`, `STVSUBJ_DESC`, `STVSUBJ_ACTIVITY_DATE`, `STVSUBJ_VR_MSG_NO`, `STVSUBJ_DISP_WEB_IND`) VALUES
('CHEM', 'Chemistry', '2004-04-01', NULL, 'Y'),
('GEOG', 'Geography', '2002-10-18', NULL, 'Y'),
('GEOL', 'Geology', '2002-10-18', NULL, 'Y'),
('PHYS', 'Physics', '2002-10-18', NULL, 'Y');

--
-- Dumping data for table `STVTERM`
--

INSERT INTO `STVTERM` (`STVTERM_CODE`, `STVTERM_DESC`, `STVTERM_START_DATE`, `STVTERM_END_DATE`, `STVTERM_FA_PROC_YR`, `STVTERM_ACTIVITY_DATE`, `STVTERM_FA_TERM`, `STVTERM_FA_PERIOD`, `STVTERM_FA_END_PERIOD`, `STVTERM_ACYR_CODE`, `STVTERM_HOUSING_START_DATE`, `STVTERM_HOUSING_END_DATE`, `STVTERM_SYSTEM_REQ_IND`, `STVTERM_TRMT_CODE`) VALUES
('200390', 'Fall 2003', '2003-09-08', '2003-12-05', '0304', '2003-04-30', '1', '9', '12', '2004', '0000-00-00', '0000-00-00', NULL, 'S'),
('200420', 'Spring 2004', '2004-02-09', '2004-05-20', '0304', '2004-06-07', '3', '2', '5', '2004', '0000-00-00', '0000-00-00', NULL, 'S'),
('200490', 'Fall 2004', '2004-09-13', '2004-12-21', '0405', '2004-11-03', '1', '9', '12', '2005', '0000-00-00', '0000-00-00', NULL, 'S'),
('200520', 'Spring 2005', '2005-02-07', '2005-05-17', '0405', '2005-05-20', '3', '2', '5', '2005', '0000-00-00', '0000-00-00', NULL, 'S'),
('200590', 'Fall 2005', '2005-09-12', '2005-12-20', '0506', '2005-06-06', '1', '9', '12', '2006', '0000-00-00', '0000-00-00', NULL, 'F'),
('200620', 'Spring 2006', '2006-02-13', '2006-05-23', '0506', '2006-04-04', '3', '2', '5', '2006', '0000-00-00', '0000-00-00', NULL, 'S'),
('200690', 'Fall 2006', '2006-09-11', '2006-12-19', '0607', '2006-04-04', '1', '9', '12', '2007', '0000-00-00', '0000-00-00', NULL, 'S'),
('200695', 'FY Preferences,ADVISING ONLY', '2006-09-11', '2006-12-19', '0607', '2006-06-06', '1', '9', '12', '2007', '0000-00-00', '0000-00-00', NULL, 'S'),
('200720', 'Spring 2007', '2007-02-12', '2007-05-22', '0607', '2006-11-27', '3', '2', '5', '2007', '0000-00-00', '0000-00-00', NULL, 'S'),
('200723', 'Spring 07 Round 1-Check Status', '2007-02-12', '2007-05-22', '0607', '2006-11-02', '3', '2', '5', '2007', '0000-00-00', '0000-00-00', NULL, 'S'),
('200724', 'First Year Seminar Choices', '2007-02-12', '2007-05-22', '0607', '2006-12-20', '3', '2', '5', '2007', '0000-00-00', '0000-00-00', NULL, 'S'),
('200725', 'FY Preferences, ADVISING ONLY', '2007-02-12', '2007-05-22', '0607', '2006-12-20', '3', '2', '5', '2007', '0000-00-00', '0000-00-00', NULL, 'S'),
('200790', 'Fall 2007', '2007-09-10', '2007-12-18', '0708', '2007-07-10', '1', '9', '12', '2008', '0000-00-00', '0000-00-00', NULL, 'S'),
('200793', 'Fall 07 Round 1-Check Status', '2007-09-10', '2007-12-18', '0708', '2007-04-10', '1', '9', '12', '2008', '0000-00-00', '0000-00-00', NULL, 'S'),
('200794', 'First Year Seminar Choices', '2007-09-10', '2007-12-18', '0708', '2007-06-13', '1', '9', '12', '2008', '0000-00-00', '0000-00-00', NULL, 'S'),
('200795', 'FY Preferences,ADVISING ONLY', '2007-09-10', '2007-12-18', '0708', '2007-06-13', '1', '9', '12', '2008', '0000-00-00', '0000-00-00', NULL, 'S'),
('200820', 'Spring 2008', '2008-02-11', '2008-05-20', '0708', '2007-07-05', '3', '2', '5', '2008', '0000-00-00', '0000-00-00', NULL, 'S'),
('200823', 'Spring 08 Round 1-Check Status', '2008-02-11', '2008-05-20', '0708', '2007-10-25', '3', '2', '5', '2008', '0000-00-00', '0000-00-00', NULL, 'S'),
('200824', 'First Year Seminar Choices', '2008-02-11', '2008-05-20', '0708', '2007-12-11', '3', '2', '5', '2008', '0000-00-00', '0000-00-00', NULL, 'S'),
('200825', 'FY Preferences, ADVISING ONLY', '2008-02-11', '2008-05-20', '0708', '2007-12-11', '3', '2', '5', '2008', '0000-00-00', '0000-00-00', NULL, 'S'),
('200890', 'Fall 2008', '2008-09-08', '2008-12-16', '0809', '2008-03-27', '1', '9', '12', '2009', '0000-00-00', '0000-00-00', NULL, 'S'),
('200893', 'Fall 08: Round 1 -Check Status', '2008-09-08', '2008-12-16', '0809', '2008-04-04', '1', '9', '12', '2009', '0000-00-00', '0000-00-00', NULL, 'S'),
('200894', 'First Year Seminar Choices', '2008-09-08', '2008-12-16', '0809', '2008-05-27', '1', '9', '12', '2009', '0000-00-00', '0000-00-00', NULL, 'S'),
('200895', 'FY Preferences,ADVISING ONLY', '2008-09-08', '2008-12-16', '0809', '2008-05-27', '1', '9', '12', '2009', '0000-00-00', '0000-00-00', NULL, 'S'),
('200920', 'Spring 2009', '2009-02-09', '2009-05-19', '0809', '2008-07-17', '3', '2', '5', '2009', '0000-00-00', '0000-00-00', NULL, 'S'),
('200923', 'Spring 09 Round 1-Check Status', '2009-02-09', '2009-05-19', '0809', '2008-10-29', '3', '2', '5', '2009', '0000-00-00', '0000-00-00', NULL, 'S'),
('200924', 'First Year Seminar Choices', '2009-02-09', '2009-05-19', '0809', '2008-12-15', '3', '2', '5', '2009', '0000-00-00', '0000-00-00', NULL, 'S'),
('200925', 'FY Preferences,ADVISING ONLY', '2009-02-09', '2009-05-19', '0809', '2008-12-15', '3', '2', '5', '2009', '0000-00-00', '0000-00-00', NULL, 'S'),
('200990', 'Fall 2009', '2009-09-07', '2009-12-15', '0910', '2009-04-01', '1', '9', '12', '2010', '0000-00-00', '0000-00-00', NULL, 'S'),
('200993', 'Fall 09: Round 1 -Check Status', '2009-09-07', '2009-12-15', '0910', '2009-04-01', '1', '9', '12', '2010', '0000-00-00', '0000-00-00', NULL, 'S');

--
-- Dumping data for table `STVTRMT`
--


--
-- Dumping data for table `SYVINST`
--

INSERT INTO `SYVINST` (`SYVINST_TERM_CODE`, `SYVINST_CRN`, `SYVINST_PIDM`, `SYVINST_LAST_NAME`, `SYVINST_FIRST_NAME`, `WEB_ID`) VALUES
('200390', '90085', '1000001', 'Adams', 'Albert', 'WEBID1000001'),
('200390', '90093', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200390', '90105', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200390', '90113', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200390', '90260', '1000003', 'Clarkson', 'Calvin', 'WEBID1000003'),
('200390', '90712', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200390', '90713', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200390', '90714', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200420', '20073', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200420', '20081', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200420', '20092', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200420', '20100', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200420', '21470', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200420', '21475', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200420', '21479', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200420', '21483', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200490', '90066', '1000006', 'Fontainbleau', 'Fanny', 'WEBID1000006'),
('200490', '90074', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200490', '90074', '1000006', 'Fontainbleau', 'Fanny', 'WEBID1000006'),
('200490', '90083', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200490', '90091', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200490', '90231', '1000003', 'Clarkson', 'Calvin', 'WEBID1000003'),
('200520', '20019', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200520', '20022', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200520', '20022', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200520', '20024', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200520', '20027', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200520', '20714', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200520', '20714', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200520', '20719', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200520', '20719', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200520', '20723', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200520', '20727', '1000002', 'Bancroft', 'Barry', 'WEBID1000002'),
('200590', '90056', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200590', '90062', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200590', '90062', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200590', '90068', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200590', '90074', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200590', '90193', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200620', '20017', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200620', '20020', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200620', '20020', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200620', '20022', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200620', '20024', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200620', '20628', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200620', '20628', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200620', '20631', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200620', '20631', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200620', '20634', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200620', '20638', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200690', '90051', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200690', '90057', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200690', '90057', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200690', '90062', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200690', '90176', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200690', '92757', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200690', '92760', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200690', '93032', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200690', '93036', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200690', '93036', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200695', '90051', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200695', '90057', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200695', '90057', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200695', '90062', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200695', '90176', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200695', '92704', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200695', '92757', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200695', '92760', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200695', '93032', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200695', '93036', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200695', '93036', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200695', '93037', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200695', '93037', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200720', '20017', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200720', '20020', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200720', '20020', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200720', '20022', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200720', '20024', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200720', '20571', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200720', '20571', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200720', '20573', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200720', '20573', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200720', '20575', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200720', '20578', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200720', '22922', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200720', '22922', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200723', '20017', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200723', '20020', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200723', '20020', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200723', '20022', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200723', '20024', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200723', '20571', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200723', '20571', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200723', '20573', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200723', '20573', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200723', '20575', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200723', '20578', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200723', '22922', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200723', '22922', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200724', '20017', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200724', '20020', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200724', '20020', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200724', '20022', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200724', '20024', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200724', '20571', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200724', '20571', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200724', '20573', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200724', '20573', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200724', '20575', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200724', '20578', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200724', '22922', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200724', '22922', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200725', '20017', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200725', '20020', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200725', '20020', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200725', '20022', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200725', '20024', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200725', '20571', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200725', '20571', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200725', '20573', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200725', '20573', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200725', '20575', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200725', '20578', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200725', '22922', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200725', '22922', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200790', '90047', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200790', '90052', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200790', '90052', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200790', '90057', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200790', '90152', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200790', '92285', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200790', '92595', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200790', '92595', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200793', '90047', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200793', '90052', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200793', '90052', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200793', '90057', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200793', '90152', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200793', '92285', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200793', '92591', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200793', '92595', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200793', '92595', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200794', '90047', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200794', '90052', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200794', '90052', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200794', '90057', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200794', '90152', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200794', '92285', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200794', '92595', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200794', '92595', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200795', '90047', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200795', '90052', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200795', '90052', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200795', '90057', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200795', '90152', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200795', '92285', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200795', '92595', '1000008', 'Herrington', 'Henley', 'WEBID1000008'),
('200795', '92595', '1000009', 'Innocente', 'Ian', 'WEBID1000009'),
('200820', '20016', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200820', '20021', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200820', '20023', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200820', '20511', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200820', '20514', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200823', '20016', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200823', '20021', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200823', '20023', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200823', '20511', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200823', '20514', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200824', '20016', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200824', '20021', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200824', '20023', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200824', '20511', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200824', '20514', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200825', '20016', '1000007', 'Gleuseau', 'Georges', 'WEBID1000007'),
('200825', '20021', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200825', '20023', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200825', '20511', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200825', '20514', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200890', '90040', '1000013', 'Monroe', 'Marvin', 'WEBID1000013'),
('200890', '90045', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200890', '90045', '1000013', 'Monroe', 'Marvin', 'WEBID1000013'),
('200890', '90050', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200890', '90143', '1000014', 'Nordemire', 'Nevin', 'WEBID1000014'),
('200890', '91368', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200890', '92418', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200890', '92423', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200893', '90143', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200893', '92418', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200893', '92423', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200894', '90143', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200894', '92418', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200894', '92423', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200895', '90143', '1000010', 'Johnson', 'Jannis', 'WEBID1000010'),
('200895', '92418', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200895', '92423', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200920', '20016', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200920', '20020', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200920', '20022', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200920', '20489', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200920', '20492', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200920', '22357', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200920', '22357', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200920', '22358', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200920', '22358', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200920', '22359', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200920', '22359', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200923', '20016', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200923', '20020', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200923', '20022', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200923', '20489', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200923', '20492', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200923', '22357', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200923', '22357', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200923', '22358', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200923', '22358', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200923', '22359', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200923', '22359', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200924', '20016', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200924', '20020', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200924', '20022', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200924', '20489', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200924', '20492', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200924', '22357', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200924', '22357', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200924', '22358', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200924', '22358', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200924', '22359', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200924', '22359', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200925', '20016', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200925', '20020', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200925', '20022', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200925', '20489', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200925', '20492', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200925', '22357', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200925', '22357', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200925', '22358', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200925', '22358', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200925', '22359', '1000005', 'Erving', 'Edward', 'WEBID1000005'),
('200925', '22359', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200990', '90036', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200990', '90041', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200990', '90041', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200990', '90045', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200990', '90125', '1000003', 'Clarkson', 'Calvin', 'WEBID1000003'),
('200990', '91245', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200993', '90036', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200993', '90041', '1000011', 'Klegmore', 'Kyle', 'WEBID1000011'),
('200993', '90041', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200993', '90045', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200993', '90125', '1000003', 'Clarkson', 'Calvin', 'WEBID1000003'),
('200993', '91245', '1000012', 'Livermore', 'Le Anne', 'WEBID1000012'),
('200390', '90683', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200390', '90684', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200390', '90685', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200890', '92443', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200890', '92449', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200893', '92443', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200893', '92449', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200894', '92443', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200894', '92449', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200895', '92443', '1000004', 'Derringer', 'Dudley', 'WEBID1000004'),
('200895', '92449', '1000004', 'Derringer', 'Dudley', 'WEBID1000004');
