#!/bin/bash
set -x


sudo chmod +w $DRUPAL_ROOT/sites/default
drush -r $DRUPAL_ROOT si standard --db-url="mysql://$DB_USERNAME:$DB_PASSWORD@127.0.0.1/$DATABASE" --site-name=$SITENAME --site-mail=$SITEMAIL -y

sudo chmod +w $DRUPAL_ROOT/sites/default/settings.php
echo "require_once 'sites/all/conf/master.settings.inc';" >> $DRUPAL_ROOT/sites/default/settings.php
sudo chmod -w $DRUPAL_ROOT/sites/default/settings.php
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
