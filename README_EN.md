# Infinity Core - RedM Framework

Core framework for RedM servers, developed by Shepard & iiRedDev under the company ALTITUDE-DEV.COM.  
Designed to offer a solid, optimized, and extensible base for your RedM projects.

## ✨ Main Features

- Advanced player and permissions management
- Customizable notification system and HUD
- Discord integration
- Shared API for modules and additional scripts
- Configurable proximity chat system
- Multi-language support (lang/*.lua)
- Map, radar, and PVP options management
- Optimizations and anti-flood SQL protections
- Automatic data saving

**Infinity Core requires [oxmysql](https://github.com/overextended/oxmysql) to work.**

## 📦 Installation

1. Download or clone this repository into your server's `resources` folder:
   ```bash
   git clone https://github.com/<your-github>/infinity_core.git
   ```
2. Add the resource to your `server.cfg`:
   ```
   ensure infinity_core
   ```
3. Configure the files [config_server.lua](resources/[framework_core]/[core]/infinity_core/config_server.lua) and [config_discord.lua](resources/[framework_core]/[core]/infinity_core/config_discord.lua) as needed.

## ⚙️ Configuration

- All main options are in [config_server.lua](resources/[framework_core]/[core]/infinity_core/config_server.lua).
- The permissions and API system is in `shared/`.
- Language files are in `lang/`.

For more details, refer to the comments in each configuration file.

## 🛠 Contribution

Contributions are welcome!  
Please create an issue or a pull request for any suggestion or fix.

## 🤝 Support & Links

- Official documentation: [https://altitude-dev.gitbook.io/doc/](https://altitude-dev.gitbook.io/doc/)
- Discord support: [https://discord.gg/ncH7GX3XJd](https://discord.gg/ncH7GX3XJd)
- Authors: Shepard, iiRedDev

---

> Framework licensed by ALTITUDE-DEV.COM. Any unauthorized reproduction or distribution is prohibited.
