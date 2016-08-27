#!/bin/bash
set -x

DRUPAL_ROOT=/var/www/site/docroot
DBUSER=vlad
DBPASS=wibble
DBHOST=127.0.0.1
DBNAME=vladdb
SITENAME="DDC Publishing"
SITEMAIL=andrew@andrewl.net

drush -r $DRUPAL_ROOT si standard --db-url=mysql://$DBUSER:$DBPASS@$DBHOST/$DBNAME --site-name=$SITENAME --site-mail=$SITEMAIL -y


drush -r $DRUPAL_ROOT en master -y
drush -r $DRUPAL_ROOT master-ensure-modules --scope=local -y 
drush -r $DRUPAL_ROOT en ddc_theme -y
drush -r $DRUPAL_ROOT vset theme_default ddc_theme -y
drush -r $DRUPAL_ROOT dis bartik -y
drush -r $DRUPAL_ROOT fr ddc_search ddc_block -y
drush -r $DRUPAL_ROOT gent tags 7 -y
drush -r $DRUPAL_ROOT genc --types=author 10 0 -y
drush -r $DRUPAL_ROOT genc --types=article 500 0 -y
drush -r $DRUPAL_ROOT eval 'node_access_rebuild();'
