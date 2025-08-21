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
    # --- Blocs Génériques ---
    { name: 'title', title: 'Titre de la page', part_type: 'Spina::Parts::Line' },
    { name: 'description', title: 'Description / Texte principal', part_type: 'Spina::Parts::Text' },
    { name: 'image_full', title: 'Image pleine largeur', part_type: 'Spina::Parts::Image' },
    { name: 'gallery', title: 'Galerie d\'images', part_type: 'Spina::Parts::ImageCollection' },
    { name: 'short_description', title: 'Description courte', part_type: 'Spina::Parts::MultiLine' },

    # --- Blocs Spécifiques à l'Accueil ---
    { name: 'home_banner_image', title: 'Image de la bannière d\'accueil (Desktop)', part_type: 'Spina::Parts::Image' },
    { name: 'home_banner_image_tablet', title: 'Image de la bannière d\'accueil (Tablette)',
      part_type: 'Spina::Parts::Image' },
    { name: 'home_banner_image_mobile', title: 'Image de la bannière d\'accueil (Mobile)',
      part_type: 'Spina::Parts::Image' },
    { name: 'home_intro_text', title: 'Texte d\'introduction', part_type: 'Spina::Parts::Text' },
    { name: 'home_who_we_are_text', title: 'Paragraphe "Qui sommes-nous ?"', part_type: 'Spina::Parts::Text' },
    { name: 'home_meetup_text', title: 'Paragraphe "Rendez-vous"', part_type: 'Spina::Parts::Text' },
    { name: 'home_poster_image', title: 'Image de l\'affiche', part_type: 'Spina::Parts::Image' },
    { name: 'home_myludo_url', title: 'URL MyLudo', part_type: 'Spina::Parts::Line' },
    { name: 'home_adhesion_embed', title: 'Code d\'intégration HelloAsso', part_type: 'Spina::Parts::MultiLine' },

    # --- Blocs Spécifiques à la Mascotte ---
    { name: 'mascotte_story', title: 'Histoire de la mascotte', part_type: 'Spina::Parts::Text' },
    { name: 'mascotte_illustrations', title: 'Illustrations de la mascotte',
      part_type: 'Spina::Parts::ImageCollection' },

    # --- Blocs Spécifiques aux Galeries Photos ---
    { name: 'photo_albums', title: 'Albums Photos', part_type: 'Spina::Parts::Repeater',
      parts: %w[album_title album_gallery] },
    { name: 'album_title', title: 'Titre de l\'album', part_type: 'Spina::Parts::Line' },
    { name: 'album_gallery', title: 'Galerie de l\'album', part_type: 'Spina::Parts::ImageCollection' },

    # --- Blocs Spécifiques au Contact et Adhésion ---
    { name: 'map_embed_code', title: 'Code d\'intégration de la carte', part_type: 'Spina::Parts::MultiLine' },
    { name: 'iframe_embed_code', title: 'Code d\'intégration (iframe)', part_type: 'Spina::Parts::MultiLine' },

    # --- Blocs pour les Liens Sociaux (Layout Parts) ---
    { name: 'facebook_url', title: 'URL Facebook', part_type: 'Spina::Parts::Line' },
    { name: 'instagram_url', title: 'URL Instagram', part_type: 'Spina::Parts::Line' },
    { name: 'youtube_url', title: 'URL YouTube', part_type: 'Spina::Parts::Line' },
    { name: 'tiktok_url', title: 'URL TikTok', part_type: 'Spina::Parts::Line' }
    # etc... pour les autres réseaux
  ]

  # View templates
  # Every page has a view template stored in app/views/my_theme/pages/*
  # You define which parts you want to enable for every view template
  # by referencing them from the theme.parts configuration above.
  theme.view_templates = [
    { name: 'homepage', title: 'Page d\'accueil',
      parts: %w[home_banner_image home_banner_image_tablet home_banner_image_mobile home_who_we_are_text home_meetup_text home_poster_image home_myludo_url home_adhesion_embed] },
    { name: 'mascotte', title: 'Notre mascotte', parts: %w[title mascotte_story mascotte_illustrations] },
    { name: 'festival', title: 'Festival annuel', parts: %w[title description image_full] },
    { name: 'animations', title: 'Nos animations', parts: %w[title description] },
    { name: 'gallery_index', title: 'Galeries photos', parts: %w[title photo_albums] },
    { name: 'contact', title: 'Contact', parts: %w[title description map_embed_code] },
    { name: 'adhesion', title: 'Adhésion', parts: %w[title description iframe_embed_code] },
    { name: 'legal', title: 'Page légale', parts: %w[title description] },
    { name: 'animation_show', title: 'Détail d\'une animation', parts: %w[title description gallery] },
    { name: 'festival_edition_show', title: 'Détail d\'une édition du festival', parts: %w[title description gallery] }
  ]

  # Custom pages
  # Some pages should not be created by the user, but generated automatically.
  # By naming them you can reference them in your code.
  theme.custom_pages = [
    { name: 'homepage', title: 'Accueil', deletable: false, view_template: 'homepage' },
    { name: 'mascotte', title: 'Notre mascotte', deletable: false, view_template: 'mascotte' },
    { name: 'festival', title: 'Festival annuel', deletable: false, view_template: 'festival' },
    { name: 'animations', title: 'Nos animations', deletable: false, view_template: 'animations' },
    { name: 'galleries', title: 'Galeries photos', deletable: false, view_template: 'gallery_index' },
    { name: 'contact', title: 'Contact', deletable: false, view_template: 'contact' },
    { name: 'adhesion', title: 'Adhésion', deletable: false, view_template: 'adhesion' },
    { name: 'legal', title: 'Mentions légales', deletable: false, view_template: 'legal' }
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
  theme.layout_parts = %w[facebook_url instagram_url youtube_url tiktok_url short_description]

  # Resources (optional)
  # Think of resources as a collection of pages. They are managed separately in Spina
  # allowing you to separate these pages from the 'main' collection of pages.
  theme.resources = [
    { name: 'animations', label: 'Animations', view_template: 'animation_show', slug: 'animations' },
    { name: 'festival_editions', label: 'Éditions du Festival', view_template: 'festival_edition_show',
      slug: 'festival' }
  ]

  # Plugins (optional)
  theme.plugins = []

  # Embeds (optional)
  theme.embeds = []
end
