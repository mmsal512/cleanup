<p align="center">
  <img src="https://img.shields.io/badge/Shell-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Bash">
  <img src="https://img.shields.io/badge/OS-Ubuntu%20%2F%20Debian-E95420?style=for-the-badge&logo=ubuntu&logoColor=white" alt="Ubuntu/Debian">
  <img src="https://img.shields.io/badge/License-MIT-blue?style=for-the-badge" alt="License">
  <img src="https://img.shields.io/badge/Version-1.0.0-green?style=for-the-badge" alt="Version">
</p>

<h1 align="center">🧹 Server Cleanup Script</h1>

<p align="center">
  <strong>سكربت إزالة شاملة للخوادم — يقوم بتنظيف جميع الحزم والإعدادات والبيانات بالكامل</strong>
</p>

<p align="center">
  A comprehensive server cleanup script that removes all installed packages, configurations, and data — preparing the server for a fresh setup.
</p>

---

## 📋 جدول المحتويات | Table of Contents

- [📖 الوصف | Description](#-الوصف--description)
- [⚡ الميزات | Features](#-الميزات--features)
- [📦 الحزم المستهدفة | Targeted Packages](#-الحزم-المستهدفة--targeted-packages)
- [🚀 طريقة الاستخدام | Usage](#-طريقة-الاستخدام--usage)
- [⚙️ آلية العمل | How It Works](#️-آلية-العمل--how-it-works)
- [⚠️ تحذيرات | Warnings](#️-تحذيرات--warnings)
- [🤝 المساهمة | Contributing](#-المساهمة--contributing)
- [📄 الرخصة | License](#-الرخصة--license)

---

## 📖 الوصف | Description

**🇸🇦 عربي:**
سكربت `cleanup.sh` مصمم لإجراء تنظيف شامل وكامل للسيرفر عن طريق إزالة جميع البرامج المُثبتة، ملفات الإعداد، وقواعد البيانات. يُستخدم هذا السكربت عادةً قبل تشغيل سكربت إعداد جديد مثل `setup_servers` لضمان بيئة نظيفة تمامًا.

**🇬🇧 English:**
`cleanup.sh` is a comprehensive server cleanup script designed to completely remove all installed software, configuration files, and databases. It is typically used before running a fresh setup script (like `setup_servers`) to ensure a completely clean environment.

---

## ⚡ الميزات | Features

| الميزة | Feature | الوصف |
|--------|---------|-------|
| 🛑 | Service Shutdown | إيقاف جميع الخدمات النشطة بأمان قبل الحذف |
| 🗑️ | Package Removal | إزالة شاملة لجميع الحزم المثبتة (`apt purge`) |
| 📁 | Config Cleanup | حذف ملفات الإعداد والبيانات من `/etc` و `/var` |
| 👤 | User Cleanup | حذف المستخدمين والمجموعات المرتبطة بالخدمات |
| 🔐 | SSL Cleanup | إزالة شهادات Let's Encrypt وإعدادات Certbot |
| 🧱 | Firewall Reset | تعطيل وإزالة UFW بالكامل |
| 📦 | Dependency Cleanup | تنظيف الحزم غير المستخدمة (`autoremove`) |
| ✅ | Safety Confirmation | طلب تأكيد قبل البدء لمنع الحذف العرضي |

---

## 📦 الحزم المستهدفة | Targeted Packages

يقوم السكربت بإزالة الحزم والأدوات التالية بالكامل:

| الفئة | Category | الحزم |
|--------|----------|-------|
| 🌐 خوادم الويب | Web Servers | `nginx`, `apache2` |
| 🐘 لغات البرمجة | Languages | `php*`, `python3`, `nodejs` |
| 🗄️ قواعد البيانات | Databases | `mysql`, `mariadb`, `postgresql`, `redis` |
| 🔧 أدوات الإدارة | Management Tools | `phpmyadmin`, `composer`, `npm` |
| 🔒 الأمان | Security | `fail2ban`, `ufw`, `certbot` |
| 📦 أخرى | Others | `git`, `nvm`, `pip` |

---

## 🚀 طريقة الاستخدام | Usage

### 1️⃣ تحميل السكربت | Clone the Repository

```bash
git clone https://github.com/your-username/cleanup.git
cd cleanup
```

### 2️⃣ منح صلاحيات التنفيذ | Make it Executable

```bash
chmod +x cleanup.sh
```

### 3️⃣ تشغيل السكربت | Run the Script

```bash
sudo bash cleanup.sh
```

> **ملاحظة:** سيطلب السكربت تأكيدًا قبل البدء بعملية الحذف. اكتب `yes` للمتابعة.

### 4️⃣ إعادة تشغيل السيرفر (مُوصى به) | Reboot (Recommended)

```bash
sudo reboot
```

---

## ⚙️ آلية العمل | How It Works

يعمل السكربت وفق الخطوات التالية:

```
┌─────────────────────────────────────────────────┐
│            🧹 Server Cleanup Script             │
├─────────────────────────────────────────────────┤
│                                                 │
│  1️⃣  طلب تأكيد من المستخدم                      │
│      └── User Confirmation Prompt               │
│          ↓                                      │
│  2️⃣  إيقاف جميع الخدمات النشطة                  │
│      └── Stop All Running Services              │
│          ↓                                      │
│  3️⃣  إزالة جميع الحزم (apt purge)               │
│      └── Purge All Packages                     │
│          ↓                                      │
│  4️⃣  تنظيف الحزم المتبقية                       │
│      └── Autoremove & Autoclean                 │
│          ↓                                      │
│  5️⃣  حذف ملفات الإعداد والبيانات                 │
│      └── Remove Config & Data Files             │
│          ↓                                      │
│  6️⃣  حذف المستخدمين والمجموعات                   │
│      └── Remove Service Users & Groups          │
│          ↓                                      │
│  7️⃣  تعطيل وإزالة الجدار الناري                  │
│      └── Disable & Remove UFW                   │
│          ↓                                      │
│  8️⃣  تحديث قائمة الحزم                          │
│      └── Update Package Lists                   │
│          ↓                                      │
│  ✅  جاهز لإعداد جديد!                           │
│      └── Ready for Fresh Setup!                 │
│                                                 │
└─────────────────────────────────────────────────┘
```

---

## 📂 هيكل المسارات المحذوفة | Removed Paths

<details>
<summary>🔍 انقر لعرض جميع المسارات | Click to expand</summary>

| الخدمة | المسارات المحذوفة |
|--------|-------------------|
| **Nginx** | `/etc/nginx`, `/var/www/html`, `/var/log/nginx`, `/var/cache/nginx`, `/usr/share/nginx` |
| **Apache** | `/etc/apache2`, `/var/log/apache2` |
| **PHP** | `/etc/php`, `/var/lib/php`, `/usr/lib/php` + PPA removal |
| **MySQL/MariaDB** | `/etc/mysql`, `/var/lib/mysql`, `/var/log/mysql`, `/var/run/mysqld` |
| **PostgreSQL** | `/etc/postgresql`, `/var/lib/postgresql`, `/var/log/postgresql`, `/var/run/postgresql` |
| **phpMyAdmin** | `/etc/phpmyadmin`, `/usr/share/phpmyadmin`, `/var/lib/phpmyadmin` |
| **Let's Encrypt** | `/etc/letsencrypt`, `/var/lib/letsencrypt`, `/var/log/letsencrypt` |
| **UFW** | `/etc/ufw` |
| **Fail2Ban** | `/etc/fail2ban`, `/var/lib/fail2ban` |
| **Node.js** | `~/.nvm`, `~/.npm`, `~/.node-gyp`, `/usr/lib/node_modules`, `/usr/local/lib/node_modules` |
| **Redis** | `/etc/redis`, `/var/lib/redis`, `/var/log/redis` |
| **Composer** | `/usr/local/bin/composer`, `~/.composer`, `~/.config/composer` |
| **Python** | `~/.local/lib/python*`, `~/.local/bin/pip*` |
| **Git** | `~/.gitconfig` |

</details>

---

## ⚠️ تحذيرات | Warnings

> [!CAUTION]
> **🇸🇦 هذا السكربت يقوم بحذف جميع البيانات نهائيًا!**
> - سيتم حذف جميع قواعد البيانات (MySQL, MariaDB, PostgreSQL, Redis)
> - سيتم حذف جميع إعدادات المواقع (Nginx, Apache)
> - سيتم حذف شهادات SSL
> - سيتم تعطيل الجدار الناري
> - **لا يمكن التراجع عن هذه العمليات**

> [!CAUTION]
> **🇬🇧 This script permanently deletes all data!**
> - All databases will be removed (MySQL, MariaDB, PostgreSQL, Redis)
> - All site configurations will be removed (Nginx, Apache)
> - SSL certificates will be deleted
> - Firewall will be disabled
> - **These operations are irreversible**

> [!TIP]
> **💡 نصيحة:** تأكد من أخذ نسخة احتياطية كاملة قبل تشغيل هذا السكربت.
>
> **💡 Tip:** Make sure to take a full backup before running this script.

---

## 📋 المتطلبات | Requirements

| المتطلب | Requirement | التفاصيل |
|---------|-------------|----------|
| 🖥️ نظام التشغيل | Operating System | Ubuntu / Debian |
| 👤 الصلاحيات | Permissions | `sudo` / Root access |
| 🐚 الشل | Shell | Bash |

---

## 🤝 المساهمة | Contributing

المساهمات مرحب بها! يمكنك:

1. **Fork** هذا المستودع
2. إنشاء فرع جديد: `git checkout -b feature/amazing-feature`
3. عمل Commit: `git commit -m 'Add amazing feature'`
4. رفع التغييرات: `git push origin feature/amazing-feature`
5. فتح **Pull Request**

---

## 📄 الرخصة | License

هذا المشروع مرخص تحت رخصة MIT — راجع ملف [LICENSE](LICENSE) للتفاصيل.

---

<p align="center">
  <strong>صُنع بـ ❤️ لتسهيل إدارة الخوادم</strong>
  <br>
  <em>Made with ❤️ to simplify server management</em>
</p>
