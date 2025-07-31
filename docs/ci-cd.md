# CI/CD – Application CRA

Ce document décrit la stratégie d’intégration continue (CI) et de déploiement continu (CD) utilisée pour l’application CRA dans un environnement encadré.

La mise en place d’un pipeline CI/CD visait à garantir la stabilité, la qualité du code, et la reproductibilité du déploiement à chaque évolution fonctionnelle.

---

## 1. Objectifs de la CI/CD

- **Automatiser les tests** à chaque push
- **Valider les bonnes pratiques** TypeScript, REST et sécurité
- **Préparer un build stable** pour chaque feature
- **Déployer en environnement de test** après validation manuelle

---

## 2. Outils utilisés

| Outil              | Rôle                              |
| ------------------ | --------------------------------- |
| GitLab CI          | Orchestration du pipeline         |
| Node.js v20        | Environnement d’exécution backend |
| Angular CLI        | Build et tests frontend           |
| Docker (optionnel) | Conteneurisation des services     |
| Render.com         | Déploiement test (pré-production) |

---

## 3. Déclenchement du pipeline

Le pipeline GitLab est configuré pour se lancer automatiquement :

- à chaque **push** sur une branche `feature/*`, `bugfix/*` ou `release/*`
- manuellement sur `main` ou `develop` (merge approuvé)

Extrait de `.gitlab-ci.yml` :

```yaml
stages:
  - test
  - lint
  - build

test:
  image: node:20
  script:
    - npm ci
    - npm run test
  only:
    - /^feature\/.*$/

lint:
  image: node:20
  script:
    - npm run lint
  only:
    - /^feature\/.*$/

build:
  image: node:20
  script:
    - npm run build
  only:
    - /^feature\/.*$/
```

---

## 4. Tests automatisés

### Backend

- Tests unitaires sur services, utils, middlewares (Jest)
- Tests API (Supertest) sur routes REST
- Vérification de la couverture minimale (80 %)

### Frontend

- Tests unitaires Angular (`ng test`)
- Tests sur composants et services critiques (`cra-form`, `auth`)
- Couverture minimale : 70 %

---

## 5. Lint et conventions

- Lint TypeScript strict (`tslint` / `eslint`)
- Vérification des noms de fichiers, DTO, routes REST
- Règles importées depuis la `Charte des Bonnes Pratiques` interne

---

## 6. Build et artefacts

- Compilation Angular via `ng build --configuration=production`
- Compilation backend TypeScript via `tsc`
- Les artefacts générés sont testables manuellement avant mise en ligne
- Chaque artefact est horodaté (`dist/` versionnée)

---

## 7. Déploiement test

Un déploiement automatisé a été envisagé sur **Render.com** en pré-production.

> Environnement mocké sans accès aux données sensibles.
> Seuls les comptes tests (admin/user/external) sont chargés via seed SQL.

---

## 8. Résultats visibles

- Badge de réussite du pipeline visible sur les MR (GitLab)
- Historique de build et durée moyenne
- Journalisation colorée (`morgan` + `console.log`) pour la phase de test

---

## 9. Limitations actuelles

- Pas encore de test end-to-end (E2E) Cypress
- Pas de rollback automatique
- Pas de pipeline pour les migrations SQL (scripts exécutés manuellement)

---

## 10. Améliorations envisagées

- Ajout d’un environnement `staging` séparé
- Déploiement Dockerisé sur VPS ou Kubernetes léger
- Tests e2e (Cypress + CI headless)
- Notification Slack / email en cas d’échec

---

## 11. Exemple de badge (mocké)

```md
![CI Status](https://img.shields.io/badge/CI--CRA-passing-brightgreen)
```

---

## Conclusion

Le pipeline CI/CD a permis de professionnaliser le projet tout en sécurisant les déploiements.
Il reste minimaliste mais structuré, avec des possibilités d’évolution selon les besoins à moyen terme.
