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

4. **Installer Spina CMS** — ⚠️ **uniquement sur une base vierge**
   ```bash
   rails spina:install
   ```

   Cette commande vous guidera pour créer le premier utilisateur administrateur.

   ⚠️ La tâche **réécrit `config/initializers/spina.rb` depuis le template du gem** et
   écrase la configuration du projet (`config.locales`, `backend_title`…). Ne la lancez
   pas sur une installation existante. Si c'est déjà fait :
   `git restore config/initializers/spina.rb`.

   Pour partir du contenu du staging plutôt que d'une base vide, sautez cette étape et
   suivez [Répliquer le staging en local](#répliquer-le-staging-en-local).

5. **Lancer le serveur**
   ```bash
   rails server
   ```

Le site sera accessible à l'adresse : `http://localhost:3000`
L'interface d'administration Spina : `http://localhost:3000/admin`

### Répliquer le staging en local

Le staging est la source de vérité du contenu : les clients l'alimentent, puis il est
cloné sur la production. Pour obtenir le même état en local :

```bash
# 1. Dump depuis le container applicatif (il embarque psql et son propre DATABASE_URL,
#    la base tourne sur le postgresql-server partagé du VPS)
ssh eden-labs 'docker exec lesdescales-web_staging-1 sh -c "pg_dump -Fc \$DATABASE_URL"' > /tmp/staging.dump

# 2. Restauration — --no-owner va sur pg_restore, pas sur pg_dump : en format custom
#    pg_dump l'ignore et l'archive conserve ses ALTER ... OWNER TO lesdescales
dropdb --if-exists lesdescales_development && createdb lesdescales_development
pg_restore --no-owner --no-privileges -d lesdescales_development /tmp/staging.dump

# 3. Aligner le secret_key_base sur celui du staging (obligatoire, cf. ci-dessous —
#    sans ça toutes les images renvoient 404)
ssh eden-labs 'docker exec lesdescales-web_staging-1 bin/rails runner "print Rails.application.secret_key_base"' > tmp/local_secret.txt
```

Ajouter le `CLOUDINARY_URL` du staging dans `.envrc` (cf. *Variables d'environnement*),
puis redémarrer `bin/dev`.

#### Pourquoi le secret_key_base doit être partagé

Spina 2.20 stocke le contenu des pages dans la colonne jsonb
`spina_pages.json_attributes`, et **non** dans `spina_page_parts` — table héritée et
vide, ne concluez pas à l'absence de contenu en la voyant à zéro. Pour les images,
`Spina::Parts::Image` y persiste le **signed_blob_id en dur** :

```json
{"name": "home_banner_image", "type": "Spina::Parts::Image",
 "image_id": 8, "signed_blob_id": "eyJ…--c9b528cf…"}
```

Cette signature dépend du `secret_key_base` de l'environnement qui a enregistré la page.
Transportée par un dump vers un environnement au secret différent, elle devient
invérifiable : `ActiveStorage::SetBlob` répond 404 avant même de requêter la base
(`Filter chain halted as :set_blob rendered or redirected`, `ActiveRecord: 0.0ms`).
Redémarrer le serveur n'y change rien, c'est de la donnée.

En développement, Rails **ignore les credentials** et lit uniquement
`tmp/local_secret.txt` (`Rails.env.local?` → `generate_development_secret`) : ajouter
`config/master.key` ne corrige donc rien, c'est bien ce fichier qu'il faut écraser.

⚠️ **La production doit utiliser le même `secret_key_base` que le staging**, sinon le
clone staging → prod cassera toutes les images de la même façon.

#### Dossier Cloudinary

`config/storage.yml` fixe `folder: production` pour tous les environnements. Un dossier
dérivé de `Rails.env` rendrait les blobs du staging introuvables ailleurs — le dev
chercherait dans `development/`. Contrepartie assumée : un upload de test en local
atterrit dans le même dossier que les vrais fichiers.

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

Le développement utilise [direnv](https://direnv.net) : les variables vont dans `.envrc`
(gitignoré), pas dans un fichier `.env`.

```bash
export CLOUDINARY_URL="cloudinary://<api_key>:<api_secret>@<cloud_name>"
```

Le gem `cloudinary` lit **`CLOUDINARY_URL`**, une seule variable — pas le trio
`CLOUDINARY_CLOUD_NAME` / `_API_KEY` / `_API_SECRET`. Sans elle,
`Cloudinary.config.cloud_name` vaut `nil` et toute génération d'URL lève
`CloudinaryException: Must supply cloud_name`.

Pour récupérer la valeur du staging :

```bash
ssh eden-labs "docker exec lesdescales-web_staging-1 printenv CLOUDINARY_URL"
```

Puis `direnv allow`.

`DATABASE_URL` est inutile en développement : `config/database.yml` cible
`lesdescales_development` via la socket locale.

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
