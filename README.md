# Infinity Core - Framework RedM

Framework de base pour serveurs RedM, développé par shepard & iireddev sous l entreprise ALTITUDE-DEV.COM.  
Conçu pour offrir une base solide, optimisée et extensible pour vos projets RedM.

## ✨ Fonctionnalités principales

- Gestion avancée des joueurs et permissions
- Système de notifications et HUD personnalisable
- Intégration Discord
- API partagée pour modules et scripts additionnels
- Système de chat de proximité configurable
- Prise en charge du multilangue (lang/*.lua)
- Gestion de la carte, radar, et options PVP
- Optimisations et protections anti-flood SQL
- Sauvegarde automatique des données

## 📦 Installation

1. Téléchargez ou clonez ce dépôt dans le dossier `resources` de votre serveur RedM :
   ```bash
   git clone https://github.com/<ton-github>/infinity_core.git
   ```
2. Ajoutez la ressource à votre `server.cfg` :
   ```
   ensure infinity_core
   ```
3. Configurez les fichiers [config_server.lua](resources/[framework_core]/[core]/infinity_core/config_server.lua) et [config_discord.lua](resources/[framework_core]/[core]/infinity_core/config_discord.lua) selon vos besoins.

## ⚙️ Configuration

- Toutes les options principales sont dans [config_server.lua](resources/[framework_core]/[core]/infinity_core/config_server.lua).
- Le système de permissions et d’API se trouve dans `shared/`.
- Les fichiers de langue sont dans `lang/`.

Pour plus de détails, consultez les commentaires dans chaque fichier de configuration.

## 🛠 Contribution

Les contributions sont les bienvenues !  
Merci de créer une issue ou une pull request pour toute suggestion ou correction.

## 🤝 Support & liens

- Site officiel : [https://altitude-dev.gitbook.io/doc/](https://altitude-dev.gitbook.io/doc/)
- Discord support : [https://discord.gg/ncH7GX3XJd](https://discord.gg/ncH7GX3XJd)
- Auteur : Shepard, iiRedDev

---

> Framework sous licence ALTITUDE-DEV.COM. Toute reproduction ou distribution non autorisée est interdite.
