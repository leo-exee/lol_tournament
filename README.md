# League of Legends Tournament Manager

Une application Ruby on Rails permettant de gérer un tournoi League of Legends :
- Gestion des équipes, joueurs, matchs et résultats
- Interface moderne avec TailwindCSS
- Authentification admin (from scratch avec bcrypt)
- Visualisation dynamique : matchs récents, classement

---

## 🚀 Installation

### 1. Cloner le projet

```bash
git clone https://github.com/leo-exee/lol_tournament
cd lol_tournament
```

### 2. Installer les dépendances

```bash
bundle install
```

---

## 🧱 Base de données

### Créer, migrer et peupler la base de données

```bash
rails db:create
rails db:migrate
rails db:seed
```

---

## 💅 Précompiler les assets

```bash
rails assets:precompile
```

---

## ▶️ Lancer le serveur

```bash
rails s
```

Accède à l'application via : [http://localhost:3000](http://localhost:3000)

---

## ✨ Fonctionnalités

- 🔧 CRUD complet :
  - Équipes (logo, joueurs, nom unique, max 5 joueurs)
  - Joueurs (rôle : Top, Jungle, Mid, ADC, Support)
  - Matchs (2 équipes, date, résultat)
- 🏠 Page d’accueil :
  - 5 derniers matchs joués
  - 5 derniers matchs à venir
  - Classement des 3 meilleures équipes
- 🔐 Authentification admin

---

## 📸 Aperçu

![Page d'accueil](https://cdn.discordapp.com/attachments/1243134920038285372/1365252479226347540/Screenshot_2025-04-25_at_11.00.05.png?ex=680ca1f4&is=680b5074&hm=74f1ff1392c67b518c27591fee6b569b320f09db70f5d97f687295d518b34f5c& "Page d'accueil")
![Liste des matchs](https://cdn.discordapp.com/attachments/1243134920038285372/1365252479859818506/Screenshot_2025-04-25_at_11.00.42.png?ex=680ca1f4&is=680b5074&hm=cc3c23530489718d96cb28b87c2ecdd60cc2795f1a03e044686b4d17ce88a5d0& "Liste des matchs")
![Liste des équipes](https://cdn.discordapp.com/attachments/1243134920038285372/1365252481063321670/Screenshot_2025-04-25_at_11.01.34.png?ex=680ca1f4&is=680b5074&hm=37cd43c2f414b1ca4d7a6cf6271402989acc201a4de8893ec49a3a5883dbdbf2& "Liste des équipes")
![Liste des joueurs](https://media.discordapp.net/attachments/1243134920038285372/1365252482921402420/Screenshot_2025-04-25_at_11.02.40.png?ex=680ca1f5&is=680b5075&hm=967ee04d5394519067b05e1b374ac9b89c94b25b73c1aa6ca255938d8c9796a4&=&format=webp&quality=lossless&width=1433&height=821 "Liste des joueurs")

---

## 👤 Auteur

Projet développé par **Léopold JACQUET** et **Pierre MURAIL** dans le cadre du projet Ruby on Rails.
