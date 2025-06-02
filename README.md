# Les Dés'Calés

Site web officiel de l'association de jeux de société Les Dés'Calés.

## 🎲 À propos

Les Dés'Calés est une association passionnée de jeux de société qui organise des événements, des soirées de jeu et promeut la culture ludique. Ce site web présente nos activités, événements à venir et permet aux membres de rester connectés avec la communauté.

## 🛠 Technologies

- **Ruby** 3.3.5
- **Rails** 7.1.5+
- **Spina CMS** 2.18+ - Système de gestion de contenu
- **PostgreSQL** - Base de données
- **Tailwind CSS** 4+ - Framework CSS
- **Cloudinary** - Gestion des médias

## 🚀 Installation et configuration

### Prérequis

- Ruby 3.3.5
- PostgreSQL
- Node.js (pour les assets)
- Docker (optionnel)

### Installation locale

1. **Cloner le projet**
   ```bash
   git clone https://github.com/dnj855/lesdescales.git
   cd lesdescales
   ```

2. **Installer les dépendances**
   ```bash
   bundle install
   ```

3. **Configurer la base de données**
   ```bash
   rails db:create
   rails active_storage:install
   rails db:migrate
   ```

4. **Installer Spina CMS**
   ```bash
   rails spina:install
   ```
   
   Cette commande vous guidera pour créer le premier utilisateur administrateur.

5. **Lancer le serveur**
   ```bash
   rails server
   ```

Le site sera accessible à l'adresse : `http://localhost:3000`
L'interface d'administration Spina : `http://localhost:3000/admin`

### Avec Docker

```bash
docker build -t lesdescales .
docker run -p 3000:3000 lesdescales
```

## 🎨 Système de design

Le projet utilise un système de design cohérent documenté dans `DESIGN_SYSTEM.md`. Les couleurs principales sont :

- **Orange chaleureux** (#FF6B35) - Couleur principale
- **Rouge profond** (#C1272D) - Couleur secondaire
- **Tons pêche et crème** - Arrière-plans et accents

## 📁 Structure du projet

```
app/
├── controllers/     # Contrôleurs Rails
├── models/         # Modèles de données
├── views/          # Templates de vues
│   └── default/    # Thème Spina par défaut
├── assets/         # CSS, JS, images
└── javascript/     # Code JavaScript/Stimulus

config/
├── initializers/
│   └── themes/     # Configuration des thèmes Spina
└── routes.rb       # Routes de l'application

db/                 # Migrations et schéma
```

## 🔧 Configuration

### Variables d'environnement

Créez un fichier `.env` pour le développement :

```env
DATABASE_URL=postgresql://username:password@localhost/lesdescales_development
CLOUDINARY_CLOUD_NAME=votre_cloud_name
CLOUDINARY_API_KEY=votre_api_key
CLOUDINARY_API_SECRET=votre_api_secret
```

### Spina CMS

Le CMS est configuré avec :
- Thème personnalisé pour Les Dés'Calés
- Types de contenu : texte, images, galeries, liens
- Navigation principale configurée
- Pages personnalisées (Accueil, Événements, etc.)

## 🚀 Déploiement

Le projet est configuré pour un déploiement avec Docker. Le `Dockerfile` inclut toutes les dépendances nécessaires.

### Production

1. Configurer les variables d'environnement de production
2. Construire l'image Docker
3. Déployer selon votre infrastructure (Heroku, DigitalOcean, etc.)

## 📝 Gestion du contenu

L'interface d'administration Spina permet de :
- Créer et modifier les pages
- Gérer les images et fichiers
- Organiser la navigation
- Configurer les événements et actualités

Accès admin : `/admin` avec les identifiants créés lors de l'installation.

## 🤝 Contribution

Ce projet est maintenu par l'équipe technique de l'association Les Dés'Calés. 

Pour toute suggestion ou rapport de bug :
1. Ouvrir une issue
2. Proposer une solution
3. Respecter les standards de code existants

## 📄 Licence

Projet propriétaire de l'association Les Dés'Calés. Tous droits réservés.

---

**Les Dés'Calés** 🎲
