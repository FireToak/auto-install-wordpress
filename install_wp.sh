#!/bin/bash

# -------------
# Title : script d'installation WordPress - Script install WordPress
# Autor : MEDO Louis
# Contact : louis@loutik.fr
# -------------

# --- CHARGEMENT DES VARIABLES ---
# On vérifie si le fichier .env existe
if [ -f .env ]; then
    export $(cat .env | xargs)
else
    echo "Erreur : Fichier .env manquant."
    exit 1
fi

# --- 1. INSTALLATION PAQUETS (LAMP) ---
echo "Mise à jour et installation des paquets..."
sudo apt update -q
# Installation silencieuse (-y) de PHP, Apache, MariaDB
sudo apt install apache2 mariadb-server php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip libapache2-mod-php -y

# --- 2. CONFIGURATION BASE DE DONNÉES AVEC VARIABLES ENVIRONNEMENT ---
echo "Configuration de la base de données $DB_NAME..."

# On exécute les commandes SQL directement sans interaction
# Création BD WordPress et User avec variables d'environnement
sudo mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
sudo mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# --- 3. INSTALLATION WORDPRESS ---
echo "Téléchargement de WordPress..."
cd /tmp
wget -q https://wordpress.org/latest.zip
sudo apt install zip -y

# Nettoyage dossier web
sudo rm -rf /var/www/html/index.html

# Décompression
echo "Installation des fichiers..."
sudo unzip -q latest.zip -d /var/www/html
sudo mv /var/www/html/wordpress/* /var/www/html/
sudo rm -rf /var/www/html/wordpress

# --- 4. PERMISSIONS ---
echo "Application des permissions..."
sudo chown -R www-data:www-data /var/www/html/ 
sudo find /var/www/html/ -type f -exec chmod 644 {} \;
sudo find /var/www/html/ -type d -exec chmod 755 {} \;

# Activation modules Apache
sudo a2enmod deflate rewrite ssl
sudo systemctl restart apache2

# Message de fin d'installation
echo "Installation terminée ! Rendez-vous sur https://${WP_URL}"