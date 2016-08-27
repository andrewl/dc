#!/bin/bash
set -x

DRUPAL_ROOT=/var/www/site/docroot
DBUSER=vlad
DBPASS=wibble
DBHOST=127.0.0.1
DBNAME=vladdb
SITENAME=DC
SITEMAIL=andrew@andrewl.net

drush -r $DRUPAL_ROOT si standard --db-url=mysql://$DBUSER:$DBPASS@$DBHOST/$DBNAME --site-name=$SITENAME --site-mail=$SITEMAIL -y


drush -r $DRUPAL_ROOT en master -y
drush -r $DRUPAL_ROOT master-ensure-modules --scope=local -y 
drush -r $DRUPAL_ROOT en ddc_theme -y
drush -r $DRUPAL_ROOT vset theme_default ddc_theme -y
drush -r $DRUPAL_ROOT dis bartik -y
drush -r $DRUPAL_ROOT genc --types=articles 500 0 -y
