<?php
/**
 * @file
 * ddc_search.features.fe_block_settings.inc
 */

/**
 * Implements hook_default_fe_block_settings().
 */
function ddc_search_default_fe_block_settings() {
  $export = array();

  $export['version'] = '2.0';

  $export['facetapi-llijTky1JsmZyqbPHTaLntkmnJgfcjDo'] = array(
    'cache' => -1,
    'custom' => 0,
    'delta' => 'llijTky1JsmZyqbPHTaLntkmnJgfcjDo',
    'module' => 'facetapi',
    'node_types' => array(),
    'pages' => '',
    'roles' => array(),
    'themes' => array(
      'ddc_theme' => array(
        'region' => 'sidebar_first',
        'status' => 1,
        'theme' => 'ddc_theme',
        'weight' => 0,
      ),
      'seven' => array(
        'region' => '',
        'status' => 0,
        'theme' => 'seven',
        'weight' => 0,
      ),
    ),
    'title' => '',
    'visibility' => 0,
  );

  $export['facetapi-uMqnBexZcDicUKyhREW8cOZi0MjACZnV'] = array(
    'cache' => -1,
    'custom' => 0,
    'delta' => 'uMqnBexZcDicUKyhREW8cOZi0MjACZnV',
    'module' => 'facetapi',
    'node_types' => array(),
    'pages' => '',
    'roles' => array(),
    'themes' => array(
      'ddc_theme' => array(
        'region' => 'sidebar_first',
        'status' => 1,
        'theme' => 'ddc_theme',
        'weight' => 0,
      ),
      'seven' => array(
        'region' => '',
        'status' => 0,
        'theme' => 'seven',
        'weight' => 0,
      ),
    ),
    'title' => 'Filter by Author:',
    'visibility' => 0,
  );

  $export['views--exp-searcjh-page'] = array(
    'cache' => -1,
    'custom' => 0,
    'delta' => '-exp-searcjh-page',
    'module' => 'views',
    'node_types' => array(),
    'pages' => '',
    'roles' => array(),
    'themes' => array(
      'ddc_theme' => array(
        'region' => 'header',
        'status' => 1,
        'theme' => 'ddc_theme',
        'weight' => 0,
      ),
      'seven' => array(
        'region' => '',
        'status' => 0,
        'theme' => 'seven',
        'weight' => 0,
      ),
    ),
    'title' => '',
    'visibility' => 0,
  );

  return $export;
}
