<?php
/**
 * @file
 * Template file for article full view.
 */
?>
<div id="node-<?php print $node->nid; ?>" class="<?php print $classes; ?> clearfix"<?php print $attributes; ?>>
  <article>
    <div class="media">
      <div class="pull-right">
        <?php print render($content['field_image']); ?>
      </div>
      <div class="media-body">
        <h1><?php print $title; ?></h1>
        <p><strong><?php print render($content['field_subtitle']); ?></strong></p>
        <p><?php print render($content['field_author']); ?> <?php print render($content['field_publication_date']); ?></p>
        <?php print render($content['body']); ?>
        <?php print render($content['tags']); ?>
      </div>
    </div>
  </article>
</div>
