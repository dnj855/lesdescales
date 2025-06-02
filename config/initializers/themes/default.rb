# Theme configuration file
# ========================
# This file is used for all theme configuration.
# It's where you define everything that's editable in Spina CMS.

Spina::Theme.register do |theme|
  # All views are namespaced based on the theme's name
  theme.name = 'default'
  theme.title = "Les Dés'Calés"

  # Parts
  # Define all editable parts you want to use in your view templates
  #
  # Built-in part types:
  # - Line
  # - MultiLine
  # - Text (Rich text editor)
  # - Image
  # - ImageCollection
  # - Attachment
  # - Option
  # - Repeater
  theme.parts = [
    { name: 'title',
      title: 'Titre',
      part_type: 'Spina::Parts::Line' },
    { name: 'content',
      title: 'Contenu principal',
      part_type: 'Spina::Parts::Text' },
    { name: 'hero_title',
      title: 'Titre principal',
      part_type: 'Spina::Parts::Line',
      hint: 'Le titre en gros' },
    { name: 'hero_description',
      title: 'Description principale',
      part_type: 'Spina::Parts::MultiLine',
      hint: 'La description en dessous du titre' },
    { name: 'main_picture',
      title: 'Image principale',
      part_type: 'Spina::Parts::Image',
      hint: "Celle qui s'affiche en dessous du titre" },
    { name: 'facebook_url', title: 'URL Facebook', part_type: 'Spina::Parts::Line' },
    { name: 'instagram_url', title: 'URL Instagram', part_type: 'Spina::Parts::Line' },
    { name: 'youtube_url', title: 'URL YouTube', part_type: 'Spina::Parts::Line' },
    { name: 'tiktok_url', title: 'URL TikTok', part_type: 'Spina::Parts::Line' },
    { name: 'twitter_url', title: 'URL Twitter', part_type: 'Spina::Parts::Line' },
    { name: 'linkedin_url', title: 'URL LinkedIn', part_type: 'Spina::Parts::Line' },
    { name: 'pinterest_url', title: 'URL Pinterest', part_type: 'Spina::Parts::Line' },
    { name: 'date', title: 'Date', part_type: 'Spina::Parts::Line' },
    { name: 'pictures', title: 'Galerie de photos', part_type: 'Spina::Parts::ImageCollection' }
  ]

  # View templates
  # Every page has a view template stored in app/views/my_theme/pages/*
  # You define which parts you want to enable for every view template
  # by referencing them from the theme.parts configuration above.
  theme.view_templates = [
    { name: 'homepage', title: 'Homepage', parts: %w[hero_title hero_description main_picture] },
    { name: 'events', title: 'Evénements', parts: %w[hero_title hero_description] },
    { name: 'legals', title: 'Mentions légales', parts: %w[title content] },
    { name: 'event', title: 'Evénement', parts: %w[title content date pictures] }
  ]

  # Custom pages
  # Some pages should not be created by the user, but generated automatically.
  # By naming them you can reference them in your code.
  theme.custom_pages = [
    { name: 'homepage', title: 'Homepage', deletable: false, view_template: 'homepage' },
    { name: 'events', title: 'Evénements', deletable: false, view_template: 'events' },
    { name: 'legals', title: 'Mentions légales', deletable: false, view_template: 'legals' }
  ]

  # Navigations (optional)
  # If your project has multiple navigations, it can be useful to configure multiple
  # navigations.
  theme.navigations = [
    { name: 'main', label: 'Navigation principale' }
  ]

  # Layout parts (optional)
  # You can create global content that doesn't belong to one specific page. We call these layout parts.
  # You only have to reference the name of the parts you want to have here.
  theme.layout_parts = %w[facebook_url instagram_url youtube_url tiktok_url twitter_url linkedin_url pinterest_url]

  # Resources (optional)
  # Think of resources as a collection of pages. They are managed separately in Spina
  # allowing you to separate these pages from the 'main' collection of pages.
  theme.resources = [
    { name: 'events', label: 'Evénements', view_template: 'event', slug: 'evenements' }
  ]

  # Plugins (optional)
  theme.plugins = []

  # Embeds (optional)
  theme.embeds = []
end
