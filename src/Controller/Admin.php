<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class Admin extends AbstractController
{
    public function __construct(
        private EntityManagerInterface $entityManager,
    ) {
    }

    /**
     * List Admin Screens.
     */
    #[Route('/admin', name: 'admin_index')]
    public function indexAction()
    {
        return $this->render('admin/index.html.twig');
    }

    #[Route('/admin/markup', name: 'markup')]
    public function markupAction()
    {
        if (isset($_POST['sample_text']) && strlen($_POST['sample_text'])) {
            $this->view->sampleText = $_POST['sample_text'];
        } else {
            $this->view->sampleText = "This is some text. Shakespeare wrote /The Merchant of Venice/ as well as /Macbeth/. Words can have slashes in them such as AC/DC, but this does not indicate italics.\n\nSpaces around slashes such as this / don't cause italics either. Quotes may be /\"used inside slashes\",/ or \"/outside of them/\". *Bold Text* should have asterisk characters around it. Like slashes, * can be used surrounded by spaces, or surrounded by letters or numbers and not cause bold formatting: 4*5 = 20 or 4 * 5 = 20. Numbers as well as text can be bold *42* or italic /85/";
        }
        $this->view->sampleText = htmlspecialchars($this->view->sampleText);
        $this->view->output = banner_course_Course::convertDescription($this->view->sampleText);
    }

    #[Route('/admin/masquerade', name: 'masquerade')]
    public function masqueradeAction()
    {
        $masqueradeAuth = $this->_helper->auth->getMasqueradeHelper();

        if ($this->_getParam('masquerade')) {
            // Verify our CSRF key
            if (!$this->_getParam('csrf_key') == $this->_helper->csrfKey()) {
                throw new PermissionDeniedException('Invalid CSRF Key. Please log in again.');
            }

            $masqueradeAuth->changeUser($this->_getParam('masquerade'));
            $this->_redirect('/', ['prependBase' => true, 'exit' => true]);
        }

        $this->view->userId = $this->_helper->auth()->getUserId();
        $this->view->userName = $this->_helper->auth()->getUserDisplayName();
    }

    /**
     * Manage archive export configurations.
     */
    #[Route('/admin/export', name: 'admin_archive_config')]
    public function exportAction()
    {
        $db = Zend_Registry::get('db');

        $this->view->configs = $db->query('SELECT * FROM archive_configurations')->fetchAllAssociative();

        $this->view->config = null;
        if ($this->_getParam('config') && -1 != $this->_getParam('config')) {
            foreach ($this->view->configs as $config) {
                if ($config['id'] == $this->_getParam('config')) {
                    $this->view->config = $config;
                }
            }
        }

        // If user has selected a configuration to modify, get the latest revision.
        if (isset($this->view->config)) {
            $catalogId = $this->_helper->osidId->fromString($this->view->config['catalog_id']);
            $this->view->catalogId = $this->view->config['catalog_id'];
        }
    }

    /**
     * Manage catalog archive scheduling.
     */
    #[Route('/admin/export', name: 'admin_archive_schedule')]
    public function scheduleAction()
    {
    }

    /**
     * Manage antirequisites.
     */
    #[Route('/admin/antirequisites', name: 'admin_antirequisites')]
    public function antirequisitesAction()
    {
        $db = Zend_Registry::get('db');

        // Delete any requested item.
        if ($this->_getParam('delete')) {
            // Verify our CSRF key
            if (!$this->_getParam('csrf_key') == $this->_helper->csrfKey()) {
                throw new PermissionDeniedException('Invalid CSRF Key. Please log in again.');
            }

            // Verify that this is a valid term.
            $deleteStmt = $db->prepare('DELETE FROM antirequisites WHERE subj_code = ? AND crse_numb = ? AND subj_code_eqiv = ? AND crse_numb_eqiv = ?');
            $deleteStmt->execute([
                $this->_getParam('subj_code'),
                $this->_getParam('crse_numb'),
                $this->_getParam('subj_code_eqiv'),
                $this->_getParam('crse_numb_eqiv'),
            ]);
        }

        // Add any chosen items.
        if ($this->_getParam('add')) {
            // Verify our CSRF key
            if (!$this->_getParam('csrf_key') == $this->_helper->csrfKey()) {
                throw new PermissionDeniedException('Invalid CSRF Key. Please log in again.');
            }

            // Verify that this is a valid term.
            $insertStmt = $db->prepare('INSERT INTO antirequisites (subj_code, crse_numb, subj_code_eqiv, crse_numb_eqiv, added_by, comments) VALUES (?, ?, ?, ?, ?, ?)');
            foreach ($this->_getParam('equivalents_to_add') as $toAdd) {
                $params = explode('/', $toAdd);
                $params[] = $this->view->getUserDisplayName();
                $params[] = $this->_getParam($toAdd.'-comments');
                $insertStmt->execute($params);
            }
        }

        // Select our already-created antirequisites
        $data['antirequisites'] = $db->query('SELECT * FROM antirequisites ORDER BY subj_code, crse_numb, subj_code_eqiv, crse_numb_eqiv')->fetchAllAssociative();

        // Supply search results.
        $this->view->search_subj_code = $this->_getParam('search_subj_code');
        $this->view->search_crse_numb = $this->_getParam('search_crse_numb');
        if ($this->_getParam('search_subj_code') && $this->_getParam('search_crse_numb')) {
            $searchStmt = $db->prepare(
                'SELECT
                    *,
                    subj_code IS NOT NULL AS antirequisite
                FROM
                    SCREQIV
                    LEFT JOIN antirequisites
                        ON (SCREQIV_SUBJ_CODE = subj_code AND SCREQIV_CRSE_NUMB = crse_numb
                            AND SCREQIV_SUBJ_CODE_EQIV = subj_code_eqiv AND SCREQIV_CRSE_NUMB_EQIV = crse_numb_eqiv)
                WHERE
                    (SCREQIV_SUBJ_CODE = ? AND SCREQIV_CRSE_NUMB = ?)
                    OR (SCREQIV_SUBJ_CODE_EQIV = ? AND SCREQIV_CRSE_NUMB_EQIV = ?)
                GROUP BY
                    SCREQIV_SUBJ_CODE, SCREQIV_CRSE_NUMB, SCREQIV_SUBJ_CODE_EQIV, SCREQIV_CRSE_NUMB_EQIV
                ORDER BY
                    SCREQIV_SUBJ_CODE, SCREQIV_CRSE_NUMB, SCREQIV_SUBJ_CODE_EQIV, SCREQIV_CRSE_NUMB_EQIV
                ');
            $searchStmt->execute([
                $this->_getParam('search_subj_code'),
                $this->_getParam('search_crse_numb'),
                $this->_getParam('search_subj_code'),
                $this->_getParam('search_crse_numb'),
            ]);
            $this->view->searchResults = $searchStmt->fetchAll(PDO::FETCH_OBJ);
        }
    }
}
