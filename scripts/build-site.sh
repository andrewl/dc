#!/bin/bash
set -x

if [ -z "$DB_PASSWORD" ]; then
  echo "DB_PASSWORD not set. This might not be a problem."
else
  DB_PASSWORD=":$DB_PASSWORD"
fi


sudo chmod +w $DRUPAL_ROOT/sites/default
drush -r $DRUPAL_ROOT si standard --db-url="mysql://$DB_USERNAME$DB_PASSWORD@127.0.0.1/$DATABASE" --site-name="$SITENAME" --site-mail="$SITEMAIL" -y

sudo chmod +w $DRUPAL_ROOT/sites/default/settings.php
echo "require_once 'sites/all/conf/master.settings.inc';" >> $DRUPAL_ROOT/sites/default/settings.php
sudo chmod -w $DRUPAL_ROOT/sites/default/settings.php

drush -r $DRUPAL_ROOT en features -y

#drush -r $DRUPAL_ROOT en -y coffee
#drush -r $DRUPAL_ROOT en -y ctools
#drush -r $DRUPAL_ROOT en -y date_api
#drush -r $DRUPAL_ROOT en -y ddc_article_permissions
#drush -r $DRUPAL_ROOT en -y ddc_common
#drush -r $DRUPAL_ROOT en -y ddc_filter
#drush -r $DRUPAL_ROOT en -y ddc_image
#drush -r $DRUPAL_ROOT en -y ddc_menu
#drush -r $DRUPAL_ROOT en -y ddc_permission
#drush -r $DRUPAL_ROOT en -y devel
#drush -r $DRUPAL_ROOT en -y devel_generate
#drush -r $DRUPAL_ROOT en -y diff
#drush -r $DRUPAL_ROOT en -y entity
#drush -r $DRUPAL_ROOT en -y entityreference
#drush -r $DRUPAL_ROOT en -y facetapi
#drush -r $DRUPAL_ROOT en -y fe_block
drush -r $DRUPAL_ROOT en -y libraries
drush -r $DRUPAL_ROOT en -y navbar
drush -r $DRUPAL_ROOT en -y search_api
drush -r $DRUPAL_ROOT en -y search_api_facetapi
drush -r $DRUPAL_ROOT en -y search_api_solr
drush -r $DRUPAL_ROOT en -y strongarm
drush -r $DRUPAL_ROOT en -y views
drush -r $DRUPAL_ROOT en -y views_load_more
drush -r $DRUPAL_ROOT en -y views_ui
drush -r $DRUPAL_ROOT en -y xautoload
drush -r $DRUPAL_ROOT en -y date
drush -r $DRUPAL_ROOT en -y ddc_article
drush -r $DRUPAL_ROOT en -y ddc_article_page
drush -r $DRUPAL_ROOT en -y ddc_author
drush -r $DRUPAL_ROOT en -y ddc_block
drush -r $DRUPAL_ROOT en -y ddc_homepage
drush -r $DRUPAL_ROOT en -y ddc_system
drush -r $DRUPAL_ROOT en -y search_api_views
drush -r $DRUPAL_ROOT en -y ddc_search

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
drush -r $DRUPAL_ROOT ucrt ronald --password="password"
