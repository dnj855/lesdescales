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

  def events
    @events ||= Spina::Resource.find_by(name: 'events')&.pages&.live || []
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
