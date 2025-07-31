# Accessibilité – Application CRA

Ce document décrit les principes d’accessibilité appliqués à l’interface utilisateur de l’application CRA développée pour la DSI du Conseil d’État.

L’accessibilité a été intégrée dès la phase de conception dans un objectif de conformité partielle aux recommandations WCAG 2.1 (niveau AA).

---

## 1. Contexte et objectifs

Le CRA est un outil quotidien destiné à l’ensemble des agents et prestataires de la DSI. Certains utilisateurs peuvent être en situation de handicap temporaire ou permanent.

L’application a donc été pensée pour :

- Être **lisible à 200 % de zoom**
- Offrir une **navigation fluide au clavier**
- Utiliser un **contraste suffisant** entre les éléments d’interface
- Fournir un **retour visuel et textuel clair** lors des erreurs

---

## 2. Principes appliqués

### Zoom 200 %

Toutes les pages de l’application ont été testées à un zoom de 200 %, sans perte de contenu ni chevauchement.  
Les composants sont organisés selon une grille fluide (flex ou grid) avec marges et paddings suffisants.

### Contrastes

Les contrastes texte/fond respectent le ratio minimum de 4.5:1 (norme WCAG AA).  
Les couleurs d’état (vert, rouge, orange) sont associées à des **icônes** ou **textes explicites**.

Exemples :

- Vert : « CRA validé – 20 jours »
- Rouge : « Dépassement – 25 jours sur 22 »
- Orange : « Incomplet – 17 jours sur 20 »

### Saisie accessible

- Champs obligatoires signalés par un **fond rouge + message textuel** (ex. : « 5 lignes en erreur »)
- Listes déroulantes utilisables au clavier
- Feedback immédiat sur chaque champ mal rempli

Voir modèle original CRA : fond rouge sur erreurs, message en haut à droite:contentReference[oaicite:0]{index=0}

### Navigation clavier

Tous les éléments interactifs sont accessibles au clavier :

- Boutons (valider, ajouter une activité)
- Champs de formulaire
- Modales de confirmation
- Menus (navigation latérale, onglets admin)

La gestion du focus est assurée manuellement après actions critiques (soumission, redirection).

### Compatibilité lecteur d’écran

Les composants principaux sont annotés avec :

- `aria-label` pour les champs et boutons ambigus
- `role="alert"` pour les toasts de validation ou d’erreur
- Titres hiérarchisés (`h1`, `h2`, `h3`) pour chaque vue

---

## 3. Exemples d’améliorations concrètes

| Élément               | Accessibilité intégrée                    |
| --------------------- | ----------------------------------------- |
| Formulaire CRA        | Validation couleur + message              |
| Historique CRA        | Table filtrable + titre lisible           |
| Navigation principale | Focus visible + raccourci clavier         |
| Absences              | Saisie simplifiée + calendrier accessible |
| Dashboard             | Graphiques accompagnés de texte synthèse  |

---

## 4. Limitations connues

- Les graphiques PrimeNG ne sont pas tous accessibles aux lecteurs d’écran
- L’interface admin (gestion des entités) reste dense au zoom supérieur à 300 %
- Les messages de validation ne sont pas encore systématiquement lisibles via `screen reader`

---

## 5. Améliorations prévues

- Ajout de messages `aria-live` sur les formulaires dynamiques
- Meilleure gestion du focus dans les dialogues (modales)
- Version mobile à venir avec tests sur VoiceOver / TalkBack
- Audit RGAA via outil automatique type Pa11y ou axe DevTools

---

## 6. Conclusion

L’accessibilité a été prise en compte dès les wireframes, validée avec l’équipe encadrante.  
L'application respecte les **bonnes pratiques d’accessibilité frontend** sans viser une certification RGAA complète à ce stade.

Elle reste évolutive, avec une feuille de route pour atteindre une conformité plus avancée en production.
