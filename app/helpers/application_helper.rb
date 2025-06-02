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
end
