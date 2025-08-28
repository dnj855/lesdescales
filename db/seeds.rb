# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Création automatique de la page d'archives des animations si elle n'existe pas
if defined?(Spina) && Spina::Account.any?
  account = Spina::Account.first
  
  # Vérifier si la page d'archives existe déjà
  unless Spina::Page.joins(:translations).where(spina_page_translations: { materialized_path: '/animations-archives' }).exists?
    # Créer la page d'archives des animations avec traduction française
    page = Spina::Page.new(
      name: 'animations_archives',
      deletable: false,
      show_in_menu: false,
      view_template: 'animations_archives'
    )
    
    # Définir les attributs traduits pour le français
    page.title = 'Archives des animations'
    page.materialized_path = '/animations-archives'
    
    page.save!
    
    puts "✅ Page 'Archives des animations' créée automatiquement"
  end
end
