# 🚀 Installation automatisée de WordPress

*Script d’installation rapide pour environnements Linux — BTS SIO Project*

<p align="center">
  <!-- Badges à compléter -->
  <a href="#"><img src="https://img.shields.io/badge/Version-1.0-blue?style=for-the-badge"></a>
  <a href="#"><img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge"></a>
  <a href="#"><img src="https://img.shields.io/badge/Status-Stable-success?style=for-the-badge"></a>
  <a href="#"><img src="https://img.shields.io/badge/Maintainer-Louis%20Medo-orange?style=for-the-badge"></a>
</p>

---

## 📌 À propos du projet

Ce script permet d’installer **WordPress automatiquement** sur une machine Linux en configurant à la fois :

* Apache2
* PHP
* MariaDB
* Les répertoires et permissions nécessaires
* Le téléchargement et la configuration initiale de WordPress

Ce projet a été développé dans le cadre de mon **BTS SIO**, afin d’automatiser l’installation d’un service couramment utilisé et de réduire les risques d’erreurs humaines lors des déploiements sur l’hyperviseur de la section.

---

## 🧰 Fonctionnalités principales

✔ Installation complète et automatisée du stack WordPress
✔ Téléchargement et extraction automatique des fichiers WordPress
✔ Configuration Apache + modules essentiels (rewrite, ssl, etc.)
✔ Configuration MariaDB (base + utilisateur)
✔ Vérification des prérequis
✔ Permissions sécurisées sur les fichiers et répertoires
✔ Script simple, léger et modifiable

---

## 📦 Prérequis

Avant d’utiliser le script, assurez-vous que :

* Le paquet **sudo** est installé
* L’utilisateur actuel peut **élever ses privilèges**
* La machine dispose d’un **accès à Internet**
* Vous avez la capacité de modifier les fichiers système

---

## ⬇️ Installation du projet

### 1. Télécharger le dépôt GitHub

```bash
wget https://github.com/FireToak/auto-install-wordpress/archive/refs/heads/main.zip
```

### 2. Décompresser l’archive

```bash
unzip main.zip
```

> Si `unzip` n’est pas installé :
> `sudo apt install zip unzip -y`

### 3. Accéder au dossier

```bash
cd auto-install-wordpress-main
ls -la
```

Vous devez notamment voir :

* `.env`
* `install_wp.sh`
* `README.md`

---

## ⚙️ Configuration

### 1. Ouvrir le fichier `.env`

```bash
nano .env
```

### 2. Renseigner vos paramètres

```env
DB_NAME="nom_de_la_base_de_données"
DB_USER="utilisateur_de_la_base_de_données"
DB_PASS="mot_de_passe"
WP_URL="localhost"
```

🔒 **Conseil sécurité :**
Utilisez un mot de passe d’au moins **32 caractères**, généré aléatoirement. Un gestionnaire tel que **Bitwarden** est vivement recommandé.

### 3. Sauvegarder :

`Ctrl + X` → `Y` → `Entrée`

---

## ▶️ Lancer le script

### 1. Rendre le script exécutable

```bash
chmod 770 install_wp.sh
```

### 2. Exécuter le script

```bash
sudo ./install_wp.sh
```

Vous verrez défiler l’installation des paquets, l’activation des modules Apache et la configuration automatique de WordPress.

---

## 🌐 Finaliser l’installation WordPress

1. Ouvrez un navigateur et entrez l’adresse IP du serveur ou :

```
http://localhost
```

2. Choisissez la langue
3. Cliquez sur **"C’est parti !"**
4. Entrez les informations de votre base de données :

   * Nom de la base : `DB_NAME`
   * Identifiant : `DB_USER`
   * Mot de passe : `DB_PASS`
   * Adresse : `localhost`
   * Préfixe des tables : `wp_` (recommandé : changez-le pour plus de sécurité)
5. Lancez l’installation
6. Créez votre compte administrateur WordPress
7. Profitez de votre installation !

---

## 🧑‍💻 Auteur

**Louis MEDO**

* [GitHub](https://github.com/FireToak)
* [LinkedIn](https://www.linkedin.com/in/louismedo/)
* [Portfolio](https://louis.loutik.fr)
* [Mail](mailto:louis@loutik.fr)

---

## 📜 Licence

Ce projet est distribué sous licence **MIT**.
Vous êtes libre de l’utiliser, le modifier et le redistribuer.

---

## ⭐ Soutenir le projet

Si ce script vous a été utile, n’hésitez pas à :

* ⭐ Star le dépôt GitHub
* 🐛 Ouvrir des issues
* 🔧 Contribuer aux améliorations
