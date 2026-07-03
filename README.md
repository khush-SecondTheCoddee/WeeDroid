# WeeDroid OS

WeeDroid is a lightweight, Windows-like Linux desktop image profile designed for low-end PCs (2 GB RAM, Intel i3 5th gen class CPUs) while keeping a polished, beginner-friendly GUI experience.

This repository contains a reproducible Debian Live Build profile, default desktop settings, package selections, and helper scripts for producing a bootable ISO.

## Goals

- **Runs on 2 GB RAM** by using XFCE, LightDM, zram, and conservative background services.
- **Windows-like UX** with bottom panel, application menu, desktop icons, Whisker menu, and familiar keyboard shortcuts.
- **Easy first boot** with bundled onboarding notes, common apps, network tools, media support, and graphical settings utilities.
- **Custom branding** through WeeDroid session defaults, wallpaper placeholder, issue text, and ISO metadata.

## Feature set

- XFCE desktop tuned for low-memory machines.
- LightDM graphical login.
- Thunar file manager with archive and removable media support.
- Firefox ESR, LibreOffice, VLC, GIMP, Geany, Synaptic, GParted, Timeshift, and common firmware packages.
- NetworkManager, Bluetooth tools, printing support, and firewall GUI.
- zram configuration for smoother multitasking on 2 GB systems.
- Windows-like panel layout and desktop defaults.

## Recommended target hardware

| Component | Minimum | Recommended |
| --- | --- | --- |
| CPU | 64-bit dual-core | Intel i3 5th gen or newer |
| RAM | 2 GB | 4 GB |
| Storage | 16 GB | 32 GB SSD |
| Graphics | Intel/AMD/NVIDIA basic modesetting | Intel HD 5500 or newer |

## Build an ISO

Use a Debian/Ubuntu host with `live-build` installed:

```bash
sudo apt update
sudo apt install live-build debootstrap xorriso isolinux syslinux-common squashfs-tools
./scripts/build-iso.sh
```

The finished ISO is written to `build/weedroid-live-amd64.hybrid.iso`.

## Repository layout

```text
live-build/                 Debian live-build profile
live-build/config/package-lists/
                            Desktop, apps, firmware, and tuning package lists
live-build/config/includes.chroot/
                            Files copied into the live system
scripts/build-iso.sh        Reproducible ISO build helper
scripts/clean.sh            Removes generated live-build artifacts
```

## Notes

This is a distro profile, not a full operating system kernel fork. It builds a custom WeeDroid-branded Linux live/installable image from Debian packages so the result stays maintainable, secure, and practical for older hardware.
