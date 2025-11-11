# 📱 Portfolio Flutter - AKAMBI Olouwashegun Sylvère

Portfolio professionnel développé avec Flutter présentant 10 projets pratiques allant du niveau débutant à expert.

## 🎯 À Propos

Je suis **AKAMBI Olouwashegun Sylvère**, développeur mobile Flutter passionné. J'ai réalisé 10 projets concrets démontrant une progression complète dans le développement mobile.

## ✨ Fonctionnalités

- ✅ **Design Moderne** : Interface Material 3 avec thème clair/sombre
- ✅ **Responsive** : Adapté mobile, tablette et web
- ✅ **Navigation Fluide** : 5 écrans interconnectés
- ✅ **Générateur d'Images** : Création dynamique de visuels colorés
- ✅ **10 Projets Documentés** : Progression Débutant → Expert
- ✅ **Null-Safety** : Code robuste et sécurisé
- ✅ **Optimisé** : Utilisation de `const` pour les performances

## 📂 Structure du Projet

```
lib/
├── main.dart                      # Point d'entrée de l'application
├── models/
│   └── project_model.dart         # Modèle de données des projets
├── data/
│   └── projects_data.dart         # Données des 10 projets
├── screens/
│   ├── home_screen.dart           # Écran d'accueil
│   ├── projects_screen.dart       # Liste et détails des projets
│   ├── about_screen.dart          # À propos et parcours
│   ├── skills_screen.dart         # Compétences techniques
│   └── contact_screen.dart        # Formulaire de contact
├── utils/
│   ├── constants.dart             # Configuration utilisateur
│   ├── app_colors.dart            # Palette de couleurs
│   ├── app_theme.dart             # Thèmes Material 3
│   └── image_generator.dart       # Générateur d'images
```

## 🚀 Lancement

### Prérequis
- Flutter SDK ≥ 3.9.2
- Dart SDK ≥ 3.9.2

### Installation

1. **Cloner le projet**
```bash
git clone https://github.com/VOTRE_USERNAME/portfolio_flutter.git
cd portfolio_flutter
```

2. **Installer les dépendances**
```bash
flutter pub get
```

3. **Lancer l'application**

- **Sur Chrome (Web)**
```bash
flutter run -d chrome
```

- **Sur un appareil mobile**
```bash
flutter run
```

- **Sur un émulateur**
```bash
flutter emulators --launch <emulator_id>
flutter run
```

## 📊 Les 10 Projets

### 🟢 Niveau Débutant
1. **To-Do List App** - Gestion de tâches avec SharedPreferences
2. **Convertisseur de Devises** - Conversion multi-devises via API

### 🔵 Niveau Intermédiaire
3. **Météo en Temps Réel** - Recherche ville + thème dynamique
4. **Notes Sécurisées** - Protection PIN/biométrie + SQLite
5. **Calculatrice Moderne** - Opérations + historique + animations
6. **Recettes du Chef** - API + favoris + recherche

### 🟠 Niveau Avancé
7. **Chat IA** - Intégration API conversationnelle
8. **Suivi de Dépenses** - Graphiques + catégories + export
9. **E-Commerce Mobile** - Paiement Stripe + Firebase Auth

### 🔴 Niveau Expert
10. **Plateforme E-Learning** - Vidéo + quiz + certificats + offline

## 🛠️ Technologies Utilisées

- **Framework** : Flutter 3.9.2+
- **Langage** : Dart 3.9.2+
- **UI** : Material Design 3
- **Architecture** : Clean Architecture
- **État** : Provider / Riverpod (selon projets)
- **Base de données** : SQLite, Hive, Firebase Firestore
- **APIs** : REST, OpenAI, Weather, Spoonacular
- **Auth** : Firebase Auth, Local Auth (biométrie)
- **Paiement** : Stripe
- **Media** : Video Player, Image Picker

## 🎨 Personnalisation

Pour personnaliser le portfolio avec vos informations :

1. Ouvrir `lib/utils/constants.dart`
2. Modifier les valeurs de `UserInfoConfig` :
   - Nom complet
   - Titre professionnel
   - Email, téléphone
   - Bio
   - Liens sociaux (GitHub, LinkedIn, Telegram, WhatsApp)
   - Formations

3. Ouvrir `lib/data/projects_data.dart`
4. Modifier la liste `projects` avec vos propres projets

## 📱 Captures d'Écran

- **Écran d'accueil** : Présentation et navigation rapide
- **Projets** : Liste filtrable par niveau avec détails complets
- **Compétences** : Technologies organisées par catégories
- **À propos** : Parcours et timeline de progression
- **Contact** : Formulaire et liens sociaux

## ✅ Tests

Lancer les tests :
```bash
flutter test
```

## 📈 Analyse de Code

Vérifier la qualité du code :
```bash
flutter analyze
```

## 🏗️ Build Production

### Android (APK)
```bash
flutter build apk --release
```

### iOS (IPA)
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 📞 Contact

- **Email** : votre.email@example.com
- **Téléphone** : +229612345678
- **GitHub** : [VOTRE_USERNAME](https://github.com/VOTRE_USERNAME)
- **LinkedIn** : [VOTRE_PROFIL](https://www.linkedin.com/in/VOTRE_PROFIL)
- **Telegram** : [@VOTRE_USERNAME](https://t.me/VOTRE_USERNAME)

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 🙏 Remerciements

Merci à la communauté Flutter pour leurs ressources et leur soutien !

---

**Développé avec ❤️ par AKAMBI Olouwashegun Sylvère**
