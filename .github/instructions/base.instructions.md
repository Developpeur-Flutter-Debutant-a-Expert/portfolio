---
applyTo: '**'
---
## 📝 Configuration Utilisateur (À REMPLIR D'ABORD)

Remplissez vos informations puis donnez ce fichier à Copilot.

```yaml
applyTo: "**"
USER_INFO:
  fullName: "AKAMBI Olouwashegun Sylvère"
  title: "Développeur Mobile Flutter"
  email: "votre.email@example.com"
  phone: "+229612345678"
  bio: |
    Je suis un développeur mobile passionné par Flutter.
    J'ai réalisé 10 projets concrets allant du niveau débutant à expert.
    Mon objectif est de créer des applications performantes et innovantes.
  github: "https://github.com/VOTRE_USERNAME"
  linkedin: "https://www.linkedin.com/in/VOTRE_PROFIL"
  telegram: "https://t.me/VOTRE_USERNAME"
  whatsapp: "33612345678"
  formations:
    - title: "Devenir Développeur Mobile par la Pratique"
      institution: "Formation en ligne"
      period: "2024-2025"
      description: "Formation complète avec 10 projets pratiques Flutter de débutant à expert"
    - title: "Développement Mobile Flutter & Dart"
      institution: "Auto-formation"
      period: "2023-2024"
      description: "Apprentissage approfondi de Flutter, Dart, Firebase et architectures modernes"
  projects:
    - title: "To-Do List App"
      githubUrl: "https://github.com/VOTRE_USER/todo_flutter"
      description: "Gestion de tâches locale (CRUD + SharedPreferences)."
      level: "Débutant"
      technologies: ["Flutter", "Dart", "SharedPreferences", "Provider"]
      features: ["Ajouter/supprimer/marquer", "Sauvegarde locale", "UI simple"]
      skills: "Widgets de base, état simple"
    - title: "Convertisseur de Devises"
      githubUrl: "https://github.com/VOTRE_USER/currency_converter_flutter"
      description: "Conversion multi-devises via API externe."
      level: "Débutant"
      technologies: ["Flutter", "Dart", "HTTP", "REST API"]
      features: ["Conversion", "Requêtes API", "Interface responsive"]
      skills: "HTTP, JSON parsing"
    - title: "Météo en Temps Réel"
      githubUrl: "https://github.com/VOTRE_USER/weather_flutter"
      description: "Recherche ville + météo temps réel + thème dynamique."
      level: "Intermédiaire"
      technologies: ["Flutter", "Weather API", "Provider", "Geolocator"]
      features: ["Recherche", "Température", "Mode clair/sombre"]
      skills: "Async API, theming"
    - title: "Notes Sécurisées"
      githubUrl: "https://github.com/VOTRE_USER/secure_notes_flutter"
      description: "Notes protégées (PIN / biométrie) + stockage local."
      level: "Intermédiaire"
      technologies: ["Flutter", "SQLite", "Local Auth", "Encryption"]
      features: ["CRUD notes", "Verrouillage sécurisé", "Stockage offline"]
      skills: "SQLite, sécurité basique"
    - title: "Calculatrice Moderne"
      githubUrl: "https://github.com/VOTRE_USER/calculator_flutter"
      description: "Opérations + historique + animations."
      level: "Intermédiaire"
      technologies: ["Flutter", "Animations", "SharedPreferences"]
      features: ["Opérations", "Historique", "Animations UI"]
      skills: "Animations, gestion interactions"
    - title: "Recettes du Chef"
      githubUrl: "https://github.com/VOTRE_USER/recipe_flutter"
      description: "API recettes + favoris + recherche ingrédient."
      level: "Intermédiaire"
      technologies: ["Flutter", "Spoonacular API", "SQLite", "Provider"]
      features: ["Liste API", "Recherche", "Favoris"]
      skills: "Listes + persistance"
    - title: "Chat IA"
      githubUrl: "https://github.com/VOTRE_USER/chat_ai_flutter"
      description: "Chat texte avec intégration API IA."
      level: "Avancé"
      technologies: ["Flutter", "OpenAI API", "Provider", "HTTP"]
      features: ["Chat", "Historique", "UX conversationnelle"]
      skills: "APIs complexes, état async"
    - title: "Suivi de Dépenses"
      githubUrl: "https://github.com/VOTRE_USER/expense_tracker_flutter"
      description: "Catégories + graphiques + export."
      level: "Avancé"
      technologies: ["Flutter", "Riverpod", "Hive", "Charts"]
      features: ["Statistiques", "Budgets", "Export CSV"]
      skills: "Visualisation, storage avancé"
    - title: "E-Commerce Mobile"
      githubUrl: "https://github.com/VOTRE_USER/ecommerce_flutter"
      description: "Catalogue + panier + paiement Stripe + favoris."
      level: "Avancé"
      technologies: ["Flutter", "Stripe", "Firebase Auth", "Firestore"]
      features: ["Catalogue", "Paiement", "Auth + favoris"]
      skills: "Auth, paiement, cloud"
    - title: "Plateforme E-Learning Mobile"
      githubUrl: "https://github.com/VOTRE_USER/elearning_flutter"
      description: "Cours vidéo + quiz + certificats + offline."
      level: "Expert"
      technologies: ["Flutter", "Firebase", "Riverpod", "Video Player", "Cloud Functions"]
      features: ["Streaming", "Progression", "Quiz", "Certificats", "Notifications"]
      skills: "Architecture avancée, scalabilité"
```

---

## 🎯 Objectif

Créer un portfolio Flutter professionnel et performant, entièrement personnalisé avec vos données.

---

## 🧠 Mission de Copilot (critique)

> 1. Lire USER_INFO et extraire toutes les données
> 2. Compléter/adapter les fichiers Flutter listés ci-dessous (web-first)
> 3. Remplacer tous les placeholders par les vraies valeurs
> 4. Utiliser `lib/utils/image_generator.dart` pour générer les images (profil + projets)
> 5. Afficher clairement la progression des 10 projets (Débutant → Expert)
> 6. Assurer `flutter analyze` sans erreurs et un run OK
> 7. Matérial 3, null-safety, const optimisation
> 8. Design orienté web (ne doit pas « sentir Flutter ») : barre de navigation horizontale, sections pleine largeur, grilles responsives
> 9. Responsive solide avec breakpoint principal à 768px (mobile < 768, desktop ≥ 768)
> 10. Utiliser un layout web réutilisable avec NavBar + Footer non fixes et conteneur central (maxWidth 1200, padding 20/80)
> 11. Éviter `withOpacity` (déprécié) et utiliser `.withValues(alpha: ...)`

---

## 📁 Structure Cible (à compléter)

```
lib/
  main.dart
  models/project_model.dart
  data/projects_data.dart
  screens/
  widgets/
    web_layout.dart
  utils/
    app_colors.dart
    app_theme.dart
    constants.dart
    image_generator.dart
pubspec.yaml
README_FLUTTER.md
```

---

## 🔧 Fichiers à Générer / Adapter

### models/project_model.dart
```dart
class Project {
  final String title;
  final String description;
  final String level; // Débutant | Intermédiaire | Avancé | Expert
  final List<String> technologies;
  final List<String> features;
  final String skills;
  final String githubUrl;
  const Project({
    required this.title,
    required this.description,
    required this.level,
    required this.technologies,
    required this.features,
    required this.skills,
    required this.githubUrl,
  });

  // Couleur (int) associée au niveau pour badges
  int getLevelColor() {
    switch (level) {
      case 'Débutant':
        return 0xFF22C55E; // green
      case 'Intermédiaire':
        return 0xFF3B82F6; // blue
      case 'Avancé':
        return 0xFFF59E0B; // amber
      case 'Expert':
        return 0xFFEF4444; // red
      default:
        return 0xFF64748B; // slate
    }
  }
}
```

### utils/constants.dart
```dart
class UserInfoConfig {
  static const fullName = "${USER_INFO.fullName}";
  static const title = "${USER_INFO.title}";
  static const email = "${USER_INFO.email}";
  static const phone = "${USER_INFO.phone}";
  static const bio = """${USER_INFO.bio}""";
  static const links = {
    'github': "${USER_INFO.github}",
    'linkedin': "${USER_INFO.linkedin}",
    'telegram': "${USER_INFO.telegram}",
    'whatsapp': "${USER_INFO.whatsapp}",
  };
  static const formations = [
    {
      'title': "${USER_INFO.formations[0].title}",
      'institution': "${USER_INFO.formations[0].institution}",
      'period': "${USER_INFO.formations[0].period}",
      'description': "${USER_INFO.formations[0].description}",
    },
  ];

  // Regroupez vos compétences ici pour l'écran Compétences
  // Vous pouvez aussi exposer ces listes dans USER_INFO si vous préférez
  static const skills = {
    'languages': [
      'Dart', 'JavaScript', 'TypeScript'
    ],
    'frameworks': [
      'Flutter', 'Riverpod', 'Provider'
    ],
    'tools': [
      'Firebase', 'Git', 'CI/CD', 'REST'
    ],
    'concepts': [
      'Clean Architecture', 'SOLID', 'MVVM', 'Responsive Design'
    ],
  };
}
```

### data/projects_data.dart
```dart
import '../models/project_model.dart';

final List<Project> projects = [
  Project(
    title: "${USER_INFO.projects[0].title}",
    description: "${USER_INFO.projects[0].description}",
    level: "${USER_INFO.projects[0].level}",
    technologies: ${USER_INFO.projects[0].technologies},
    features: ${USER_INFO.projects[0].features},
    skills: "${USER_INFO.projects[0].skills}",
    githubUrl: "${USER_INFO.projects[0].githubUrl}",
  ),
  Project(
    title: "${USER_INFO.projects[1].title}",
    description: "${USER_INFO.projects[1].description}",
    level: "${USER_INFO.projects[1].level}",
    technologies: ${USER_INFO.projects[1].technologies},
    features: ${USER_INFO.projects[1].features},
    skills: "${USER_INFO.projects[1].skills}",
    githubUrl: "${USER_INFO.projects[1].githubUrl}",
  ),
  // ... jusqu'au 10ème
];
```

### main.dart (extrait)
```dart
import 'package:flutter/material.dart';
import 'utils/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/about_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/contact_screen.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio Flutter',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routes: {
+          '/': (_) => const HomeScreen(),
+          '/projects': (_) => const ProjectsScreen(),
+          '/about': (_) => const AboutScreen(),
+          '/skills': (_) => const SkillsScreen(),
+          '/contact': (_) => const ContactScreen(),
        },
      );
}
```

### widgets/web_layout.dart (nouveau)
```dart
import 'package:flutter/material.dart';

class WebNavBar extends StatelessWidget {
  final String currentRoute;
  const WebNavBar({super.key, required this.currentRoute});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0,2))],
      ),
      child: Row(children: [
        Text('Votre Nom', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const Spacer(),
        if (!isMobile) ...[
          _NavItem(label: 'Accueil', route: '/'),
          _NavItem(label: 'Projets', route: '/projects'),
          _NavItem(label: 'À propos', route: '/about'),
          _NavItem(label: 'Compétences', route: '/skills'),
          _NavItem(label: 'Contact', route: '/contact'),
        ],
        if (isMobile) IconButton(onPressed: () { /* ouvrir menu */ }, icon: const Icon(Icons.menu)),
      ]),
    );
  }
}

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: isMobile ? 20 : 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('© ${DateTime.now().year} Votre Nom — Tous droits réservés', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class WebContainer extends StatelessWidget {
  final Widget child; final double maxWidth;
  const WebContainer({super.key, required this.child, this.maxWidth = 1200});
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
          child: child,
        ),
      ),
    );
  }
}

class WebLayout extends StatelessWidget {
  final String currentRoute; final Widget child;
  const WebLayout({super.key, required this.currentRoute, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WebNavBar(currentRoute: currentRoute),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [ child, const WebFooter() ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label; final String route; const _NavItem({required this.label, required this.route});
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => Navigator.pushNamed(context, route), child: Text(label));
  }
}
```

### ImageGenerator (usage)
```dart
import '../utils/image_generator.dart';
Widget projectHeader(int index, String title) =>
    ImageGenerator.generateProjectImage(index + 1, title, height: 160);
```

---

## ✅ Checklist

- [ ] Variables USER_INFO injectées
- [ ] 10 projets présents, progression visible
- [ ] Aucun asset image externe
- [ ] `flutter analyze` OK
- [ ] UI responsive mobile/web (breakpoint 768px)
- [ ] WebLayout utilisé sur toutes les pages (NavBar + Footer non fixés)
- [ ] Footer fait partie du flux de scroll (pas de position: fixed)
- [ ] WebContainer maxWidth 1200, padding horizontal 20/80
- [ ] Pas d'utilisation de `withOpacity` (utiliser `.withValues(alpha: ...)`)

---

## ▶️ Lancement

1. `flutter pub get`
2. `flutter run -d chrome` (ou device)
3. Vérifier navigation, projets, responsive

Astuce de test rapide:

```bash
flutter analyze
flutter run -d chrome --web-port=8080
```

---

Copiez maintenant TOUT ce fichier dans Copilot et envoyez: `Run the task`.
