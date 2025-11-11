# Portfolio Flutter Web

Portfolio personnel (web-first) construit avec Flutter (Material 3, responsive breakpoint 768px, layout réutilisable).

## 🚀 Déploiement sur Vercel

Ce projet est préparé pour un déploiement direct sur Vercel.

### Fichiers clés
- `vercel.json` : configuration build & rewrites SPA
- `vercel_install.sh` : installation Flutter SDK
- `vercel_build.sh` : build web release
- `.vercelignore` : exclusion dossiers non web

### Prérequis locaux
```bash
flutter pub get
flutter analyze
flutter build web --release --web-renderer canvaskit
```

### Déploiement (Option 1: Vercel CLI)
```bash
npm i -g vercel
vercel login
vercel --prod
```

Assurez-vous que `Output Directory` détecté = `build/web`. Sinon configurez manuellement.

### Déploiement (Option 2: Dashboard Vercel)
1. Créer nouveau projet -> Import GitHub
2. Framework: "Other"
3. Build Command: `bash ./vercel_build.sh`
4. Install Command: `bash ./vercel_install.sh`
5. Output Directory: `build/web`
6. Lancer le premier déploiement

### Cache & Headers
`vercel.json` force SPA (rewrites vers `index.html`) + désactive cache agressif.

### Personnalisation
Adapter `web/index.html` (meta, favicon, SEO) après build si nécessaire.

## 🧩 Architecture Résumé
- `WebLayout` : NavBar + Footer + Scroll container
- `WebContainer` : maxWidth=1200 + padding 20/80
- Breakpoint principal: `< 768px` = mobile
- Génération images dynamiques via `image_generator.dart` (pas d’assets externes)

## 🔧 Scripts
```bash
./vercel_install.sh   # installation flutter pour build CI
./vercel_build.sh     # build web release
```

## ✅ Checklist avant prod
- [ ] `flutter analyze` sans erreurs bloquantes
- [ ] Test navigation toutes routes
- [ ] Responsive OK (mobile / desktop)
- [ ] Aucune utilisation de `withOpacity` (remplacé par `.withValues`) si Flutter >= 3.22
- [ ] Indexation SEO minimale (title + meta description dans `web/index.html`)

## 🛠 Debug rapide
```bash
flutter run -d chrome --web-port=8080
```

## 📄 License
Propriétaire — usage personnel portfolio.

