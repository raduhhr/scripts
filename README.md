# dynamic-mojave-wallpaper

A **dynamic wallpaper script for Linux Mint Cinnamon**, replicating the macOS Mojave dynamic desktop.  
Wallpapers change automatically based on the current time of day, triggered by a cron job.

---

## Overview

- **Script (`dynamic_mojave_wallpaper.sh`)**
  - Reads the current time (in seconds since midnight).
  - Maps time ranges → one of 16 Mojave images.
  - Sets Cinnamon’s wallpaper using `gsettings`.
  - Exports `DISPLAY`, `XAUTHORITY`, and `DBUS_SESSION_BUS_ADDRESS` so cron can access the session.

- **Wallpapers**
  - Folder: `mojave-background`
  - Files: `mojave_dynamic_1.jpeg … mojave_dynamic_16.jpeg`
  - Represent the full cycle from night → sunrise → daylight → sunset → back to night.

- **Scheduler**
  - Cron runs the script every few minutes, keeping the wallpaper in sync with time.

**Result:** Your Linux Mint desktop background smoothly transitions throughout the day, just like macOS Mojave.

---

## How It Works

```
cron → dynamic_mojave_wallpaper.sh
 ├─ export DISPLAY, XAUTHORITY, DBUS vars
 ├─ check current hour & minute
 ├─ calculate seconds since midnight
 ├─ match range → pick mojave_dynamic_X.jpeg
 └─ gsettings sets Cinnamon desktop background
```

---

## Repo Layout

```
dynamic-mojave-wallpaper/
├── dynamic_mojave_wallpaper.sh   # Main script
├── Pics/                         # Wallpapers
│   ├── mojave_dynamic_1.jpeg
│   ├── mojave_dynamic_2.jpeg
│   └── ... mojave_dynamic_16.jpeg
└── README.md
```

---

## Installation

### Prerequisites
- Linux Mint (Cinnamon desktop)
- `gsettings` (preinstalled with Cinnamon)

### Setup
1. Clone/unzip the repo into your home directory:
   ```bash
   git clone https://github.com/youruser/dynamic-mojave-wallpaper.git
   cd dynamic-mojave-wallpaper
   ```

2. Make the script executable:
   ```bash
   chmod +x dynamic_mojave_wallpaper.sh
   ```

3. Test manually:
   ```bash
   ./dynamic_mojave_wallpaper.sh
   ```

---

## Scheduling with Cron

Edit crontab:
```bash
crontab -e
```

Example entry (run every 15 minutes):
```bash
*/15 * * * * /home/radu/dynamic-mojave-wallpaper/dynamic_mojave_wallpaper.sh
```

Save and exit.  
Cron will now update your wallpaper automatically.

---

## Customization

- Replace the Mojave wallpapers with your own images, but keep the filenames consistent (`mojave_dynamic_1.jpeg … 16`).
- Adjust the time ranges in the script to match your preferred schedule.
- Change cron frequency (e.g., every 10 minutes instead of 15).

---

## Why I Made It

Cinnamon doesn’t support macOS-style dynamic wallpapers out of the box.  
I wanted the same Mojave look & feel, so I wrote my own script.  
It’s simple, hackable, and made me realize: *if the tool doesn’t exist, I can build it*.

---

## License

MIT
