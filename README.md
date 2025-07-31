# Application CRA – Étude de cas Conseil d’État

## Présentation

Ce dépôt présente une étude de cas autour d’une application développée pour la DSI du Conseil d’État, visant à remplacer un système Excel de comptes rendus d’activité (CRA) par une solution web modulaire, sécurisée et évolutive.

L'application, développée dans un cadre pédagogique encadré, a été conçue pour répondre aux besoins internes de pilotage, de suivi d’activités, et de production d’indicateurs consolidés, tout en assurant une meilleure ergonomie pour les agents de la DSI.

> Ce dépôt ne contient volontairement **aucun code source** ni **aucune donnée métier**. Il a été validé en accord avec ma tutrice afin de documenter mon travail de manière conforme à mes engagements de confidentialité.

## Contexte

Depuis plusieurs années, les agents et prestataires de la DSI renseignent leur temps passé sur projets et activités via un modèle Excel partagé. Chaque CRA mensuel est saisi de manière hebdomadaire, puis consolidé manuellement.

Les inconvénients du système historique sont nombreux :

- Multiplication des fichiers (plus de 1 000 par an)
- Risques d’erreurs manuelles (cohérence des jours ouvrés)
- Difficulté de mise à jour des référentiels (projets, activités)
- Absence d’historisation ou de synthèse automatisée

Le projet visait donc à concevoir un **MVP web complet**, avec back-office et gestion des droits, tout en garantissant un bon niveau d’accessibilité et d’ergonomie.

## Fonctionnalités principales

- Authentification via OpenID (mockée en développement)
- Saisie du CRA mensuel avec découpage hebdomadaire
- Gestion des jours ouvrés, fériés, et absences (validation automatique)
- Administration des référentiels (projets, activités, catégories)
- Visualisation et édition des CRA passés
- Export des données pour reporting sous Excel
- Dashboard admin (utilisateurs, complétion, volumétrie)

## Architecture technique

- Frontend : Angular 19+ standalone, avec modularisation par domaine
- Backend : Node.js (Express) avec services découplés en TypeScript
- Base de données : MariaDB (modèle relationnel inspiré du fichier Excel initial)
- Sécurité : JWT mocké, structuration RBAC par rôle et statut
- CI/CD : GitLab CI, scripts de test et de build déclenchés sur chaque feature branch
- Hébergement : plateforme Render (environnement de test)

Voir détails dans [`docs/architecture.md`](./docs/architecture.md)

## Profils utilisateurs

- **Utilisateur agent/prestataire** : saisie CRA, consultation historique
- **Administrateur** : gestion des référentiels, absences, utilisateurs, statistiques

Le système repose sur une logique RBAC explicite, définie dans [`docs/roles-et-droits.md`](./docs/roles-et-droits.md)

## Accessibilité

- Respect partiel du référentiel WCAG 2.1 (contrastes, navigation clavier, zoom 200 %)
- Signalement visuel et textuel des erreurs de saisie
- Structure HTML logique et composants accessibles

Voir détails dans [`docs/accesibilite.md`](./docs/accesibilite.md)

## Pipeline CI/CD

- Tests unitaires déclenchés sur push
- Validation automatique des formats de routes, DTOs et payloads
- Déploiement manuel sur environnement de test

Extrait commenté dans [`docs/ci-cd.md`](./docs/ci-cd.md)

## Planification et méthode

Le projet a été structuré autour de plusieurs jalons :

- Analyse du classeur Excel historique
- Conception du schéma relationnel et des wireframes
- Développement modulaire frontend/backend
- Ajout progressif des contrôles métier
- Documentation et stabilisation

Voir jalons détaillés dans [`docs/conception.md`](./docs/conception.md)

## Fichiers et ressources

- `.github/assets/schema-mcd.png` : Modèle conceptuel des données
- `.github/assets/wireframe-cra.png` : Wireframe utilisateur
- `.github/assets/screenshot-cra-01.png` : Capture floutée de l’interface
- `public/maquette-CRA.pdf` : Extrait annoté du prototype

## Mentions légales

Ce dépôt ne contient **aucun code source**, **aucune donnée sensible**, et ne reflète en aucun cas le contenu des systèmes internes du Conseil d’État.  
Sa publication a été validée verbalement avec l’encadrante du projet, dans un cadre de **valorisation de compétences uniquement**.

## FAQ

**Peut-on consulter l’application en ligne ?**  
Non. Il s’agit d’un projet interne non exposé publiquement. Des captures floutées sont toutefois disponibles.

**Peut-on voir le code source ?**  
Non. Ce projet est protégé par un accord de confidentialité et les sources ne sont pas publiées.

**Puis-je contacter le développeur ?**  
Oui. Le développeur est joignable via GitHub ou LinkedIn [voir profil](https://github.com/GDevWeb).

## Licence

Ce projet est mis à disposition sous licence [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/).
