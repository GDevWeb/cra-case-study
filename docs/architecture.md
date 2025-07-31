# Architecture logicielle – Application CRA

Ce document décrit l’architecture technique de l’application CRA développée pour la DSI du Conseil d’État. Il couvre la structure frontend, le backend, la base de données, ainsi que les interactions globales du système.

---

## 1. Présentation générale

L’application est organisée en trois couches distinctes :

- **Frontend Angular** (interface utilisateur)
- **Backend Node.js / Express** (logique métier, API REST)
- **Base de données relationnelle MariaDB** (stockage structuré)

Les échanges entre le frontend et le backend se font exclusivement via API REST sécurisée (JWT). La base de données est conçue pour permettre des extractions automatisées vers Excel.

---

## 2. Frontend – Angular 19+ (Standalone)

### Technologies utilisées

- Angular 19+ (standalone API)
- TypeScript strict
- Routing standalone
- Tailwind CSS (optionnel, activé)
- PrimeNG (composants UI)
- Gestion des rôles côté client (guards + services)

### Structure du projet

```bash
apps/frontend/src/app/
├── app.routes.ts
├── components/              # Composants réutilisables (header, footer…)
├── pages/
│   ├── user/                # CRA utilisateur (formulaire, historique…)
│   └── admin/               # Gestion admin (utilisateurs, stats…)
├── services/                # Services API (auth, cra, référentiels…)
├── store/                   # State management via signals ou observables
└── utils/                   # Helpers et formats
```

### Découpage fonctionnel

- `cra-form` : formulaire mensuel CRA avec ligne d’activités, absences, validations temps
- `cra-history` : historique des CRA avec filtres (date, statut)
- `admin-dashboard` : statistiques agrégées (nombre de CRA, taux de complétion…)
- `entities-management` : référentiels (projets, activités, utilisateurs)

---

## 3. Backend – Node.js / Express (TypeScript)

### Stack utilisée

- Node.js v20
- Express.js (routes RESTful)
- TypeScript strict
- JWT (authentification stateless)
- Service Layer (par domaine métier)
- Middleware de validation et contrôle des erreurs

### Organisation des dossiers

```bash
apps/backend/src/
├── routes/                    # Définition des endpoints API
├── controllers/               # Récupération des requêtes HTTP
├── services/                  # Logique métier
├── models/                    # Entités de la base de données (via SQL brut ou ORM)
├── middlewares/              # Auth, validation, erreurs
├── utils/                     # Fonctions partagées
├── config/                    # Connexion DB, variables d’env
└── tests/                     # Supertest + Jest (unitaires et API)
```

### Design REST

- Routes RESTful (pas de verbes dans l’URL)
- Réponses toujours encapsulées dans un objet (`{ data, meta }`)
- Contrôle d’accès via middleware `authMiddleware` + vérification des rôles

---

## 4. Base de données – MariaDB

### Choix techniques

- Modèle relationnel inspiré du classeur Excel CRA
- Données normalisées (projets, activités, catégories…)
- Référentiels modifiables par interface admin
- Historisation CRA par mois/utilisateur

### Tables principales

- `users` : informations agents, rôles, statuts
- `entities` : départements et bureaux
- `projects`, `activities`, `categories` : référentiels métiers
- `monthly_cras` : CRA mensuel par utilisateur
- `cra_lines` : lignes de saisie CRA (jour, activité, projet, temps)
- `absences` : absences sur une période
- `holidays` : jours fériés nationaux
- `cra_history` : audit des CRA

### Extrait de seed anonymisé

Voir [`CRA_Seed_DB.sql`](./seeds/CRA_Seed_DB.sql)

---

## 5. Architecture logique

```
[ Navigateur ]
     ↓ (HTTP)
[ Frontend Angular ]
     ↓ (API REST)
[ Backend Node.js ]
     ↓ (SQL)
[ MariaDB ]
```

Les interactions sont 100 % stateless. Le token JWT est stocké côté client, envoyé dans l’en-tête Authorization.

---

## 6. Sécurité

- Authentification JWT (à terme remplacée par OpenID CE)
- RBAC explicite : admin, manager, user, external
- Protection des routes sensibles par middleware
- Logs d’erreurs filtrés (pas d’infos sensibles)
- Aucune donnée métier exposée dans les réponses en cas d’erreur

---

## 7. Évolutivité

- Architecture modulaire (services Angular, services Node.js)
- Facilité d’extension par ajout de modules (ex : reporting)
- API conforme REST, compatible avec des clients externes (BI, Excel)

---

## 8. Limites et axes futurs

- Migration vers PostgreSQL possible
- Auth OpenID à implémenter en production
- Ajout de tests e2e Cypress
- Monitoring et logging structurés (ex : Sentry, Grafana)

---
