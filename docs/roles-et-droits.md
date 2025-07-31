# Gestion des rôles et des droits – Application CRA

Ce document décrit l’organisation des rôles utilisateurs et la logique d’accès aux fonctionnalités de l’application CRA, dans le respect du principe RBAC (Role-Based Access Control).

---

## 1. Vue d’ensemble

L’application CRA gère plusieurs profils utilisateurs, chacun ayant un périmètre fonctionnel défini.  
Les permissions sont contrôlées à la fois côté frontend (Angular guards) et backend (middleware Node.js).

---

## 2. Rôles définis

| Rôle     | Description                                                                |
| -------- | -------------------------------------------------------------------------- |
| admin    | Accès complet à toutes les interfaces (admin, CRA, stats, référentiels)    |
| manager  | Rôle optionnel avec droits d’accès partiels à certains dashboards          |
| user     | Agent interne, accès à son propre CRA uniquement                           |
| external | Prestataire, accès identique à `user` mais rattaché à un bureau spécifique |

---

## 3. Attribution des rôles

Les rôles sont définis dans la table `users` (`role` + `is_active`).  
Les utilisateurs sont également liés à une entité (`entity_id`) représentant leur département ou bureau.

```sql
INSERT INTO users (last_name, first_name, email, is_active, entity_id, role)
VALUES ('Admin', 'CRA', 'admin@cra.local', TRUE, 1, 'admin');
```

---

## 4. Permissions par rôle

### Rôle : `admin`

- Accès à l’ensemble du back-office
- Gestion des utilisateurs, statuts, entités
- Ajout/suppression/modification des référentiels
- Visualisation complète des CRA de tous les agents
- Accès aux statistiques globales (tableaux de bord, exports CSV)
- Création/modification d’absences pour tous les utilisateurs

### Rôle : `user` ou `external`

- Accès à leur propre page CRA mensuelle
- Ajout/modification/suppression de leurs lignes d’activités
- Ajout de leurs absences (en jours ou portions de jour)
- Consultation de l’historique de leurs CRA précédents
- Visualisation des messages d’erreur ou d’alerte

### Rôle : `manager` (optionnel)

- Accès en lecture seule aux CRA de son entité
- Visualisation des statistiques (intermédiaire entre user et admin)
- Non utilisé dans le MVP, mais prévu pour un usage futur

---

## 5. Pages accessibles par rôle

| Page / Fonctionnalité             | admin | manager | user / external |
| --------------------------------- | :---: | :-----: | :-------------: |
| Connexion                         |  ✅   |   ✅    |       ✅        |
| Formulaire CRA (saisie mensuelle) |  ✅   |   ⛔️   |       ✅        |
| Historique CRA                    |  ✅   |   ✅    |       ✅        |
| Dashboard admin (statistiques)    |  ✅   |   ✅    |       ⛔️       |
| Gestion des utilisateurs          |  ✅   |   ⛔️   |       ⛔️       |
| Gestion des entités               |  ✅   |   ⛔️   |       ⛔️       |
| Gestion des référentiels          |  ✅   |   ⛔️   |       ⛔️       |
| Gestion des absences              |  ✅   |   ⛔️   | ✅ (personnel)  |
| Export CSV (statistiques)         |  ✅   |   ✅    |       ⛔️       |

---

## 6. Contrôle d’accès – Backend

Un middleware `authMiddleware` vérifie la présence du JWT, extrait l’`id_user` et le `role`, puis autorise ou bloque l’accès à chaque route selon un mapping centralisé.

Exemple :

```ts
if (user.role !== "admin") {
  return res.status(403).json({ message: "Access denied" });
}
```

---

## 7. Contrôle d’accès – Frontend

Les routes Angular sont protégées via des `canActivate` guards qui valident le rôle utilisateur à partir du token JWT décodé. Le rôle est aussi exploité pour afficher dynamiquement les sections de l’interface.

Exemple :

```ts
canActivate(route: ActivatedRouteSnapshot): boolean {
  return this.authService.getRole() === 'admin';
}
```

---

## 8. Cas particuliers

### Utilisateur désactivé (`is_active = false`)

- L’utilisateur peut se connecter mais est immédiatement redirigé avec un message d’erreur.
- Ce statut est utilisé pour désactiver temporairement un compte sans le supprimer.

### Intervenant externe (`role = 'external'`)

- Même accès que `user`, mais souvent rattaché à un bureau externe ou sous-entité.
- Peut être filtré à des fins statistiques.

---

## 9. Évolutions possibles

- Gestion fine des permissions par module (ACL)
- Attribution dynamique des droits par entité ou projet
- Journalisation des accès sensibles (ex : vue CRA d’un tiers)
- Interface admin pour visualiser et modifier les rôles en masse
