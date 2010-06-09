<?php

/**
 * A helper to provide access to the CourseManager OSID and OSID configuration.
 * 
 * @since 6/9/10
 * 
 * @copyright Copyright &copy; 2009, Middlebury College
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License (GPL)
 */
class Catalog_Action_Helper_OsidId
	extends Catalog_Action_Helper_AbstractOsidIdentifier
{
	
	/**
	 * Get and OSID id object from a string.
	 * 
	 * @param string $idString
	 * @return osid_id_Id
	 * @access public
	 * @since 4/21/09
	 */
	public function fromString ($idString) {
		try {
			return new phpkit_id_URNInetId($idString);
		} catch (osid_InvalidArgumentException $e) {
			if ($this->getIdAuthorityToShorten())
				return new phpkit_id_Id($this->getIdAuthorityToShorten(), 'urn', $idString);
			else
				throw $e;
		}
	}
	
	/**
	 * Answer a string representation of an OSID id object
	 * 
	 * @param osid_id_Id $id
	 * @return string
	 * @access public
	 * @since 4/21/09
	 */
	public function toString (osid_id_Id $id) {
		if ($this->getIdAuthorityToShorten() 
				&& strtolower($id->getIdentifierNamespace()) == 'urn' 
				&& strtolower($id->getAuthority()) == $this->getIdAuthorityToShorten())
			return $id->getIdentifier();
		else
			return phpkit_id_URNInetId::getInetURNString($id);
	}
	
}

?>