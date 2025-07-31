# Conception et méthode – Application CRA

Ce document retrace les étapes de conception du projet CRA, de l’analyse du besoin à la livraison d’un MVP fonctionnel. Il met en lumière la méthodologie utilisée, les choix techniques, et les adaptations au fil du projet.

---

## 1. Contexte initial

Le projet CRA est né d’un besoin exprimé par la DSI du Conseil d’État : remplacer un système de comptes-rendus d’activité entièrement basé sur Excel.

> Chaque agent (interne ou prestataire) devait remplir chaque semaine un modèle Excel, générant plus de 1 000 fichiers annuels.  
> Ces fichiers étaient consolidés manuellement et exploités à des fins statistiques dans des tableaux de bord Excel.

Les limites du système :

- Maintenance lourde à chaque changement d’année
- Risque d’erreurs (jours ouvrés mal comptés, absences non prises en compte)
- Aucun historique ni validation automatisée
- Aucune ergonomie pour les utilisateurs

---

## 2. Objectifs du projet

- Développer une **application web modulaire** remplaçant les fichiers Excel
- Proposer un **formulaire CRA mensuel unifié**, basé sur des saisies hebdomadaires
- Garantir une **vérification automatique des données** (cohérence jours ouvrés, absences)
- Permettre une **administration dynamique des référentiels**
- Assurer une **authentification sécurisée** (OpenID envisagé)
- Faciliter l’**export vers Excel** pour les tableaux de bord existants
- Maintenir une **ergonomie et une accessibilité** conformes aux standards DSI

---

## 3. Analyse du modèle Excel existant

L’analyse du fichier CRA Excel fourni par la DSI a permis d’identifier :

- Un fonctionnement **mensuel avec saisie hebdomadaire**
- Une colonne par jour et des menus déroulants pour les activités, projets, etc.
- Des règles métier implicites (validation des jours, signalement d’erreur en couleur)
- Un onglet « Référentiels » centralisant toutes les données utiles
- Des règles manuelles de copie des modèles et de nommage des fichiers

> Ce modèle a servi de base pour construire le schéma relationnel, la structure du formulaire Angular et les règles de validation backend.

---

## 4. Méthodologie adoptée

- Découpage du projet en **phases itératives** (type Kanban / mini-sprints)
- Priorisation des fonctionnalités minimales pour un **MVP fonctionnel**
- Rétroplannings et suivi sous Notion, validés régulièrement avec la tutrice

---

## 5. Planning et jalons

| Tâche                                 | Période                    | Statut   |
| ------------------------------------- | -------------------------- | -------- |
| Point lancement + cadrage             | 16 avril 2025              | Réalisé  |
| Réalisation des wireframes            | 17 → 25 avril 2025         | Réalisé  |
| Validation des wireframes             | 23 → 25 avril 2025         | Réalisé  |
| Mise en place socle + BDD             | 28 avril → 9 mai 2025      | Réalisé  |
| Création des formulaires CRA          | 19 → 30 mai 2025           | Réalisé  |
| Authentification + extraction données | 1er juillet → 31 août 2025 | Réalisé  |
| Recette + documentation + dépôt       | 1er → 31 juillet 2025      | En cours |

Sources : [planning officiel CRA](./planning/planning_CRA.jpg)

---

## 6. Choix techniques majeurs

- **Angular standalone** pour une architecture modulaire et scalable
- **Node.js + TypeScript** pour le backend, avec séparation claire des services
- **MariaDB** pour rester cohérent avec l’environnement DSI existant
- Utilisation de **GitLab CI** pour automatiser tests, build et conventions
- Respect de la **Charte des bonnes pratiques** Angular / Node interne

---

## 7. Contraintes rencontrées

- Nécessité de **ne pas exposer de données métiers** dans les captures
- Projet développé sans production réelle, uniquement en environnement simulé
- Adaptation de l’authentification OpenID à un mock JWT en local
- Contrainte d’affichage à 200 % (accessibilité DSI)
- Synchronisation régulière avec des interlocuteurs non techniques

---

## 8. Livrables finaux

- Interface CRA complète : formulaire, historique, absences
- Interface admin : référentiels, entités, utilisateurs
- Backend modulaire : validation, contrôles métier, seed SQL
- Base de données relationnelle avec cohérence et extensibilité
- Documentation complète (architecture, rôles, accessibilité, CI/CD)

---

## 9. Bilan

Ce projet a permis de couvrir l’ensemble des volets d’un projet web professionnel :

- Analyse du besoin et audit d’un existant complexe
- Définition d’un MCD adapté à l’usage réel
- Conception UI/UX puis développement frontend complet
- Mise en place d’une API REST propre et sécurisée
- Intégration d’une logique métier rigoureuse
- CI/CD, accessibilité et documentation orientée usage réel

Il constitue une **étude de cas complète** valorisable pour tout poste de développeur ou de chef de projet technique junior.
