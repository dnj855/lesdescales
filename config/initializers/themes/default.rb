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
    { name: 'subtitle', title: 'Sous-titre de la page', part_type: 'Spina::Parts::Line' },
    { name: 'description', title: 'Description / Texte principal', part_type: 'Spina::Parts::Text' },
    { name: 'image_full', title: 'Image pleine largeur', part_type: 'Spina::Parts::Image' },
    { name: 'gallery', title: 'Galerie d\'images', part_type: 'Spina::Parts::ImageCollection' },
    { name: 'cta_text', title: 'Texte du CTA', part_type: 'Spina::Parts::Text' },
    { name: 'short_description', title: 'Description courte', part_type: 'Spina::Parts::MultiLine' },
    { name: 'content', title: 'Contenu', part_type: 'Spina::Parts::Text' },

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
    { name: 'contact_hours', title: 'Horaires', part_type: 'Spina::Parts::MultiLine' },
    { name: 'map_embed_code', title: 'Code d\'intégration de la carte', part_type: 'Spina::Parts::MultiLine' },
    { name: 'iframe_embed_code', title: 'Code d\'intégration (iframe)', part_type: 'Spina::Parts::MultiLine' },

    # --- Blocs Spécifiques au Festival ---
    { name: 'festival_next_title', title: 'Titre du prochain festival', part_type: 'Spina::Parts::Line' },
    { name: 'festival_next_date', title: 'Dates du prochain festival', part_type: 'Spina::Parts::Line' },
    { name: 'festival_next_location', title: 'Lieu du prochain festival', part_type: 'Spina::Parts::Line' },
    { name: 'festival_next_description', title: 'Description du prochain festival', part_type: 'Spina::Parts::Text' },
    { name: 'festival_next_image', title: 'Image principale du prochain festival', part_type: 'Spina::Parts::Image' },
    { name: 'festival_next_price', title: 'Prix d\'entrée', part_type: 'Spina::Parts::Line' },
    { name: 'festival_next_teasing_mode', title: 'Mode Teasing', part_type: 'Spina::Parts::Option',
      options: %w[true false] },
    { name: 'festival_next_teasing_text', title: 'Texte du mode Teasing', part_type: 'Spina::Parts::Text' },
    { name: 'festival_next_teasing_image', title: 'Image du mode Teasing', part_type: 'Spina::Parts::Image' },
    { name: 'festival_next_teasing_image_tablet', title: 'Image du mode Teasing (Tablette)',
      part_type: 'Spina::Parts::Image' },
    { name: 'festival_next_teasing_image_mobile', title: 'Image du mode Teasing (Mobile)',
      part_type: 'Spina::Parts::Image' },

    # --- Statistiques d'Édition du Festival ---
    { name: 'edition_year', title: 'Année de l\'édition', part_type: 'Spina::Parts::Line' },
    { name: 'edition_visitors_count', title: 'Nombre de visiteurs', part_type: 'Spina::Parts::Line' },
    { name: 'edition_games_count', title: 'Nombre de jeux proposés', part_type: 'Spina::Parts::Line' },
    { name: 'edition_tournaments_count', title: 'Nombre de tournois organisés', part_type: 'Spina::Parts::Line' },
    { name: 'edition_hours_count', title: 'Nombre d\'heures de jeu', part_type: 'Spina::Parts::Line' },
    { name: 'edition_date', title: 'Dates de l\'édition', part_type: 'Spina::Parts::Line' },
    { name: 'edition_location', title: 'Lieu de l\'édition', part_type: 'Spina::Parts::Line' },
    { name: 'edition_poster_image', title: 'Affiche de l\'édition', part_type: 'Spina::Parts::Image' },
    # --- Programme Flexible par Jour ---
    { name: 'festival_program_days', title: 'Programme par Jour', part_type: 'Spina::Parts::Repeater',
      parts: %w[program_day_name program_day_hours program_day_content] },
    { name: 'program_day_name', title: 'Nom du jour (ex: Samedi, Dimanche, Vendredi soir...)',
      part_type: 'Spina::Parts::Line' },
    { name: 'program_day_hours', title: 'Horaires du jour (ex: 10h-18h)', part_type: 'Spina::Parts::Line' },
    { name: 'program_day_content', title: 'Programme et activités du jour', part_type: 'Spina::Parts::Text' },

    # --- Blocs Spécifiques aux Animations (pages individuelles) ---
    { name: 'animation_date', title: 'Date(s) de l\'animation', part_type: 'Spina::Parts::Line' },
    { name: 'animation_location', title: 'Lieu de l\'animation', part_type: 'Spina::Parts::Line' },

    { name: 'festival_partners', title: 'Nos partenaires', part_type: 'Spina::Parts::Text' },

    # --- Blocs pour les Liens Sociaux (Layout Parts) ---
    { name: 'facebook_url', title: 'URL Facebook', part_type: 'Spina::Parts::Line' },
    { name: 'instagram_url', title: 'URL Instagram', part_type: 'Spina::Parts::Line' },
    { name: 'youtube_url', title: 'URL YouTube', part_type: 'Spina::Parts::Line' },
    { name: 'tiktok_url', title: 'URL TikTok', part_type: 'Spina::Parts::Line' },
    # etc... pour les autres réseaux

    # --- Blocs pour les mentions légales ---
    { name: 'legal_content', title: 'Contenu des mentions légales', part_type: 'Spina::Parts::Repeater',
      parts: %w[legal_title legal_text] },
    { name: 'legal_title', title: 'Titre de la section', part_type: 'Spina::Parts::Line' },
    { name: 'legal_text', title: 'Contenu de la section', part_type: 'Spina::Parts::Text' },
    { name: 'president_name', title: 'Nom du président', part_type: 'Spina::Parts::Line' },
    { name: 'president_gender', title: 'Genre du président', part_type: 'Spina::Parts::Option',
      options: %w[M F] },
    { name: 'host_name', title: 'Nom de l\'hébergeur', part_type: 'Spina::Parts::Line' },
    { name: 'host_address', title: 'Adresse de l\'hébergeur', part_type: 'Spina::Parts::Line' },
    { name: 'rgpd', title: 'Afficher le bloc RGPD ?', part_type: 'Spina::Parts::Option',
      options: %w[true false] }
  ]

  # View templates
  # Every page has a view template stored in app/views/my_theme/pages/*
  # You define which parts you want to enable for every view template
  # by referencing them from the theme.parts configuration above.
  theme.view_templates = [
    { name: 'homepage', title: 'Page d\'accueil',
      parts: %w[home_banner_image home_banner_image_tablet home_banner_image_mobile home_who_we_are_text home_meetup_text home_poster_image home_myludo_url home_adhesion_embed] },
    { name: 'mascotte', title: 'Notre mascotte', parts: %w[title mascotte_story mascotte_illustrations] },
    { name: 'festival', title: 'Festival annuel',
      parts: %w[title subtitle festival_next_teasing_mode festival_next_title festival_next_date festival_next_location festival_next_description festival_next_image festival_next_price festival_next_teasing_text festival_next_teasing_image festival_next_teasing_image_tablet festival_next_teasing_image_mobile festival_program_days festival_partners] },
    { name: 'animations', title: 'Nos animations', parts: %w[title subtitle description cta_text] },
    { name: 'animations_archives', title: 'Archives des animations', parts: %w[title description] },
    { name: 'gallery_index', title: 'Galeries photos', parts: %w[title subtitle photo_albums] },
    { name: 'contact', title: 'Contact', parts: %w[title subtitle contact_hours map_embed_code iframe_embed_code] },
    { name: 'legal', title: 'Page légale',
      parts: %w[title legal_content president_name president_gender host_name host_address rgpd] },
    { name: 'animation_show', title: 'Détail d\'une animation',
      parts: %w[title description animation_date animation_location gallery] },
    { name: 'gallery_show', title: 'Détail d\'une galerie photo',
      parts: %w[title description gallery] },
    { name: 'festival_edition_show', title: 'Détail d\'une édition du festival',
      parts: %w[title description gallery edition_year edition_visitors_count edition_games_count edition_tournaments_count edition_hours_count edition_date edition_location edition_poster_image] }
  ]

  # Custom pages
  # Some pages should not be created by the user, but generated automatically.
  # By naming them you can reference them in your code.
  theme.custom_pages = [
    { name: 'homepage', title: 'Accueil', deletable: false, view_template: 'homepage' },
    { name: 'mascotte', title: 'Notre mascotte', deletable: false, view_template: 'mascotte' },
    { name: 'festival', title: 'Festival annuel', deletable: false, view_template: 'festival' },
    { name: 'animations', title: 'Nos animations', deletable: false, view_template: 'animations' },
    { name: 'animations_archives', title: 'Archives des animations', deletable: false,
      view_template: 'animations_archives' },
    { name: 'galleries', title: 'Galeries photos', deletable: false, view_template: 'gallery_index' },
    { name: 'contact', title: 'Contact', deletable: false, view_template: 'contact' },
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
      slug: 'festival' },
    { name: 'galleries', label: 'Galeries photos', view_template: 'gallery_show', slug: 'galleries' }
  ]

  # Plugins (optional)
  theme.plugins = []

  # Embeds (optional)
  theme.embeds = []
end
