<?php

namespace Drupal\ddc_author\Author;

use \EntityDrupalWrapper;

/**
 * Contains functionality to aid development with Author entity types.
 */
class AuthorWrapper extends EntityDrupalWrapper {

  /**
   * Creates the AuthorWrapper from a nid.
   *
   * @param int $nid
   *   The nid of the author.
   */
  public function __construct($nid) {
    parent::__construct('node', $nid);
  }

  /**
   * Get a list of article nids that the Author has written.
   *
   * @return int[]
   *   An array of article titles keyed by nid of articles that
   *   this author has written.
   */
  public function getArticles() {
    $articles = array();

    $query = new \EntityFieldQuery();
    $query->entityCondition('entity_type', 'node')
      ->entityCondition('bundle', 'article')
      ->fieldCondition('field_author', 'target_id', $this->id, '=');
    $result = $query->execute();

    if (isset($result['node']) && is_array($result['node'])) {
      foreach (node_load_multiple(array_keys($result['node'])) as $nid => $node) {
        $articles[$nid] = $node->title;
      }
    }

    return $articles;
  }

}
