# Les Dés'Calés Design System (Spécification Client)

_Guide de style pour le site de l'association de jeux de société Les Dés'Calés._

## Palette de Couleurs

### Couleurs Primaires

- **Rouge Principal (#E31507)** - La couleur de marque principale, utilisée pour les boutons, les liens, les icônes et les éléments d'emphase.
- **Jaune Clair (#FFE698)** - La couleur de fond principale pour donner une atmosphère chaleureuse et lumineuse.

### Couleurs Secondaires et d'Accent

- **Rouge Foncé (#B80F05)** - Pour les états survolés (`hover`) et pressés des éléments interactifs rouges.
- **Jaune Pâle (#FFF9E0)** - Pour les arrière-plans de section ou de cartes, afin de créer une hiérarchie visuelle douce.
- **Gris Foncé (#333333)** - Pour le texte principal, afin de garantir une lisibilité maximale.
- **Gris Moyen (#666666)** - Pour le texte secondaire, les descriptions et les labels.
- **Bordure Grise (#E0E0E0)** - Pour les bordures fines des cartes et des champs de saisie.

### Couleurs Fonctionnelles

- **Succès (Vert) - #28A745** - Pour les messages de confirmation et les états de succès.
- **Erreur (Rouge) - #DC3545** - Pour les messages d'erreur et les actions destructrices.
- **Avertissement (Orange) - #FD7E14** - Pour les avertissements.

## Typographie

### Familles de Polices

- **Police d'Affichage (Display)**: **Feeling Passionate**, cursive (Pour les grands titres de la page d'accueil).
- **Police des Titres**: **Poppins**, sans-serif (Pour tous les titres H1, H2, H3...).
- **Police du Corps de Texte**: **Sniglet**, cursive (Pour tous les paragraphes et textes courants).

**Note :** Tu devras importer ces polices (ex: depuis Google Fonts) dans le layout de ton application pour qu'elles soient disponibles.

### Styles de Texte

#### Titres (Poppins)

- **H1**: 36px, Bold (700)
- **H2**: 28px, Semibold (600)
- **H3**: 22px, Semibold (600)

#### Corps de Texte (Sniglet)

- **Body**: 16px/24px, Regular (400)
- **Body Large**: 18px/26px, Regular (400)
- **Caption**: 14px, Regular (400)

#### Spécial

- **Bouton**: 16px, Poppins, Medium (500)
- **Lien**: 16px, Sniglet, souligné au survol

## Composants

### Boutons

- **Bouton Primaire**
  - Arrière-plan : Rouge Principal (#E31507)
  - Texte : Blanc (#FFFFFF)
  - Hover : Arrière-plan Rouge Foncé (#B80F05)
- **Bouton Secondaire**
  - Arrière-plan : transparent
  - Bordure : 2px Rouge Principal (#E31507)
  - Texte : Rouge Principal (#E31507)
  - Hover : Arrière-plan Jaune Pâle (#FFF9E0)

### Cartes (Cards)

- **Carte Standard**
  - Arrière-plan : Blanc (#FFFFFF)
  - Ombre : `0 2px 8px rgba(0, 0, 0, 0.1)`
  - Rayon de bordure : 12px

### Champs de Saisie (Input)

- **Champ Standard**
  - Bordure : 1px Bordure Grise (#E0E0E0)
  - Focus : Bordure 2px Rouge Principal (#E31507)
  - Arrière-plan : Blanc (#FFFFFF)

## Accessibilité

- **Ratios de contraste** : Le texte Gris Foncé (#333333) sur le Jaune Clair (#FFE698) doit être vérifié pour garantir un ratio suffisant (minimum 4.5:1).
- **États de focus** : Tous les éléments interactifs doivent avoir un état de focus visible (par exemple, un anneau de 2px de la couleur Rouge Principal).
