#!/bin/bash
#=============================================
# سكربت إزالة شاملة قبل تنفيذ setup_servers
#=============================================

set -e

echo "============================================="
echo "  ⚠️  تحذير: سيتم حذف جميع البرامج والبيانات"
echo "============================================="
read -p "هل أنت متأكد؟ (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
    echo "تم الإلغاء."
    exit 0
fi

echo ""
echo "🔴 إيقاف جميع الخدمات..."
sudo systemctl stop nginx 2>/dev/null || true
sudo systemctl stop apache2 2>/dev/null || true
sudo systemctl stop mysql 2>/dev/null || true
sudo systemctl stop mariadb 2>/dev/null || true
sudo systemctl stop postgresql 2>/dev/null || true
sudo systemctl stop redis-server 2>/dev/null || true
sudo systemctl stop fail2ban 2>/dev/null || true
sudo systemctl stop php*-fpm 2>/dev/null || true

echo ""
echo "🗑️  إزالة جميع الحزم..."
sudo apt purge -y \
    nginx nginx-common nginx-full nginx-core \
    apache2 apache2-utils apache2-bin apache2-data \
    php* libapache2-mod-php* \
    mysql-server mysql-client mysql-common mysql-server-core-* mysql-client-core-* \
    mariadb-server mariadb-client mariadb-common \
    postgresql postgresql-* \
    phpmyadmin \
    certbot python3-certbot-nginx python3-certbot-apache \
    fail2ban \
    nodejs npm \
    redis-server redis-tools \
    python3-pip python3-venv python3-dev \
    git \
    2>/dev/null || true

echo ""
echo "🧹 تنظيف الحزم غير المستخدمة..."
sudo apt autoremove -y
sudo apt autoclean -y

echo ""
echo "📁 حذف ملفات الإعداد والبيانات..."

# Nginx
sudo rm -rf /etc/nginx /var/www/html /var/log/nginx /var/cache/nginx /usr/share/nginx

# Apache
sudo rm -rf /etc/apache2 /var/log/apache2

# PHP
sudo rm -rf /etc/php /var/lib/php /usr/lib/php
sudo add-apt-repository --remove ppa:ondrej/php -y 2>/dev/null || true

# MySQL/MariaDB
sudo rm -rf /etc/mysql /var/lib/mysql /var/log/mysql /var/run/mysqld
sudo deluser --remove-home mysql 2>/dev/null || true
sudo delgroup mysql 2>/dev/null || true

# PostgreSQL
sudo rm -rf /etc/postgresql /var/lib/postgresql /var/log/postgresql /var/run/postgresql
sudo deluser --remove-home postgres 2>/dev/null || true
sudo delgroup postgres 2>/dev/null || true

# phpMyAdmin
sudo rm -rf /etc/phpmyadmin /usr/share/phpmyadmin /var/lib/phpmyadmin

# Certbot/SSL
sudo rm -rf /etc/letsencrypt /var/lib/letsencrypt /var/log/letsencrypt

# UFW
sudo ufw disable 2>/dev/null || true
sudo apt purge ufw -y 2>/dev/null || true
sudo rm -rf /etc/ufw

# Fail2Ban
sudo rm -rf /etc/fail2ban /var/lib/fail2ban

# Node.js
rm -rf ~/.nvm ~/.npm ~/.node-gyp
sudo rm -f /etc/apt/sources.list.d/nodesource.list
sudo rm -f /etc/apt/keyrings/nodesource.gpg
sudo rm -rf /usr/lib/node_modules /usr/local/lib/node_modules
sed -i '/NVM_DIR/d' ~/.bashrc 2>/dev/null || true
sed -i '/nvm/d' ~/.bashrc 2>/dev/null || true

# Redis
sudo rm -rf /etc/redis /var/lib/redis /var/log/redis

# Composer
sudo rm -f /usr/local/bin/composer /usr/bin/composer
rm -rf ~/.composer ~/.config/composer

# Python
sudo rm -rf ~/.local/lib/python* ~/.local/bin/pip*

# Git
sudo rm -rf ~/.gitconfig

echo ""
echo "🔄 تحديث قائمة الحزم..."
sudo apt update

echo ""
echo "============================================="
echo "  ✅ تم الانتهاء من الإزالة الكاملة!"
echo "  يمكنك الآن تنفيذ سكربت setup_servers"
echo "============================================="
echo ""
echo "💡 يُنصح بإعادة تشغيل السيرفر أولاً:"
echo "   sudo reboot"
