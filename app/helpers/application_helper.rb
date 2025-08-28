module ApplicationHelper
  def social_networks
    account = current_spina_account
    socials = {}

    account.fr_content.each do |part|
      if part.name.end_with?('_url') && part.content.present?
        network_name = part.name.gsub('_url', '')
        socials[network_name] = part.content
      end
    end
    socials
  end

  def short_description
    current_spina_account.fr_content.find { |p| p.name == 'short_description' }
  end

  def events
    @events ||= Spina::Resource.find_by(name: 'events')&.pages&.live || []
  end

  def festival_editions
    @festival_editions ||= Spina::Resource.find_by(name: 'festival_editions')&.pages&.live || []
  end

  def animations
    # Retourne les animations créées il y a moins d'un an (non archivées)
    @animations ||= begin
      all_animations = Spina::Resource.find_by(name: 'animations')&.pages&.live || []
      one_year_ago = 1.year.ago
      all_animations.select { |animation| animation.created_at > one_year_ago }
    end
  end

  def archived_animations
    # Retourne les animations créées il y a plus d'un an
    @archived_animations ||= begin
      all_animations = Spina::Resource.find_by(name: 'animations')&.pages&.live || []
      one_year_ago = 1.year.ago
      all_animations.select { |animation| animation.created_at <= one_year_ago }
    end
  end

  def all_animations
    # Méthode utilitaire pour récupérer toutes les animations sans filtre de date
    @all_animations ||= Spina::Resource.find_by(name: 'animations')&.pages&.live || []
  end

  def animations_archives_path
    # Récupère le chemin de la page d'archives des animations
    @animations_archives_path ||= begin
      archives_page = Spina::Page.find_by(name: 'animations_archives')
      archives_page&.materialized_path || '/archives-des-animations'
    end
  end

  def nav_items
    @nav_items ||= Spina::Navigation.find_by(name: 'main').navigation_items.roots.sorted
  end

  def nav_item_active?(nav_item_path, current_path)
    return true if current_path == nav_item_path

    return false if nav_item_path == '/'

    current_path.start_with?(nav_item_path + '/') || current_path.start_with?(nav_item_path + '?')
  end
end
