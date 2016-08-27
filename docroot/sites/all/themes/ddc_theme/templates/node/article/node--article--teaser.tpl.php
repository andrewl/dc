<?php
/**
 * @file
 * Template file for article teasers.
 */
?>
<div class="contextual-links-region">
  <?php print render($title_suffix); ?>
  <article class="<?php print $article_class?>">
    <div id="node-<?php print $node->nid; ?>" class="<?php print $classes; ?> clearfix"<?php print $attributes; ?>>
      <div class="media">
        <div class="pull-left">
          <?php print render($content['field_image']); ?>
        </div>
        <div class="media-body">
          <h1><?php print $linked_title; ?></h1>
          <p><strong><?php print render($content['field_subtitle']); ?></strong></p>
          <p><?php print render($content['field_author']); ?> <?php print render($content['field_publication_date']); ?></p>
          <?php print render($content['body']); ?>
        </div>
        
      </div>
    </div>
  </article>
</div>
