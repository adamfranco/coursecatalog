<?php
/**
 * @since 2/22/16
 * @package CatalogSync
 *
 * @copyright Copyright &copy; 2016, Middlebury College
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License (GPL)
 */

/**
 * This class implements the Banner-to-Catalog sync using the Banner OCI connection
 * on the source side and a MySQL-PDO connection on the destination side.
 *
 * @since 2/22/16
 * @package CatalogSync
 *
 * @copyright Copyright &copy; 2016, Middlebury College
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License (GPL)
 */
class CatalogSync_Syncer_Oci
	extends CatalogSync_Syncer_PdoMysqlDestination
	implements CatalogSync_Syncer_Interface
{
	protected $source_db;

	/**
	 * Configure this sync instance
	 *
	 * @param Zend_Config $config
	 * @return void
	 * @access public
	 */
	public function configure (Zend_Config $config) {
		parent::configure($config);
		$this->source_db = new CatalogSync_Database_Source_Oci('source_banner_db');
		$this->source_db->configure($config->source_banner_db);

		/**
		 * Custom Error handler function to throw exceptions on any PHP
		 * Warnings or Errors. This should catch any OCI problems that
		 * are not picked up by calls to oci_error().
		 */
		set_error_handler(array($this, 'exception_error_handler'), E_ERROR | E_WARNING);
	}

	/**
	 * Custom Error handler function to throw exceptions on any PHP
	 * Warnings or Errors. This should catch any OCI problems that
	 * are not picked up by calls to oci_error().
	 */
	public function exception_error_handler ($errno, $errstr, $errfile, $errLine, $errcontext) {
		throw new Exception($errstr, $errno);
	}

	/**
	 * Set up connections to our source and destination.
	 *
	 * @return void
	 * @access public
	 */
	public function connect () {
		parent::connect();

		// Connect to Banner
		$this->source_db->connect();
	}

	/**
	 * Disconnect from our databases
	 *
	 * @return void
	 * @access public
	 */
	public function disconnect () {
		parent::disconnect();
		$this->source_db->disconnect();
	}

	/**
	 * Answer the database we should copy from.
	 *
	 * @return CatalogSync_Database_Source
	 * @access public
	 */
	protected function getCopySourceDatabase () {
		return $this->source_db;
	}

	/**
	 * Answer the database we should copy into during copy.
	 *
	 * @return CatalogSync_Database_Destination
	 * @access public
	 */
	protected function getCopyTargetDatabase () {
		return new CatalogSync_Database_Destination_Pdo($this->destination_db);
	}

	/**
	 * Take actions before copying data.
	 *
	 * @return void
	 * @access public
	 */
	public function preCopy () {
		// Nothing to do.
	}

	/**
	 * Take actions after copying data.
	 *
	 * @return void
	 * @access public
	 */
	public function postCopy () {
		// Nothing to do.
	}
	
}