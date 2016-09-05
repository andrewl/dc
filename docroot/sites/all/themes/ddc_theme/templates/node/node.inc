<?php
/**
 * @file
 * Node template functions.
 */

/**
 * Implements hook_preprocess_node().
 */
function ddc_theme_preprocess_node(&$variables) {
  $node_type = $variables['node']->type;

  // We want to theme nodes by type and display mode.
  $variables['theme_hook_suggestions'][] = 'node__' . $node_type . '__' . $variables['view_mode'];

  $function_names = array(
    'ddc_theme_preprocess_node__' . $node_type . '__' . $variables['view_mode'],
    'ddc_theme_preprocess_node__' . $node_type,
  );

  foreach ($function_names as $function_name) {
    if (function_exists($function_name)) {
      $function_name($variables);
    }
  }
}

function ddc_theme_preprocess_node__article__teaser(&$variables) {


  // Create linked title.
  $variables['linked_title'] = l($variables['title'], 'node/' . $variables['nid']);

  // Add a class to the article if the special field is selected
  $variables['article_class'] = "normal";

  // @todo - should check whether we actually have a node, perhaps wrap the object too?
  if ($variables['node']->field_special[LANGUAGE_NONE][0]['value'] == 1) {
    $variables['article_class'] = "special";
  }

}

function ddc_theme_preprocess_node__article__full(&$variables) {
  $other_article_items = array();
  if (isset($variables['field_author'][0]['target_id'])) {
    $this_article_id = $variables['nid'];
    $author_id = $variables['field_author'][0]['target_id'];
    $author_wrapper = new Drupal\ddc_author\Author\AuthorWrapper($author_id);
    $article_ids = $author_wrapper->getArticles();
    foreach ($article_ids as $id => $title) {
      if ($id != $this_article_id) {
        $other_article_items[] = l($title, "/node/{$id}");
      }
    }
  }
  $variables['other_articles'] = array(
    '#title' => t("Other Articles By This Author"),
    '#items' => $other_article_items,
    '#theme' => 'item_list',
  );
}

