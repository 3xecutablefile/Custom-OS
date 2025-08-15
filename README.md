# Nebula NixOS Configuration

This repository contains the NixOS configuration for Nebula, a custom operating system built with NixOS. It provides a highly reproducible and declarative way to manage your system, from core configurations to user-specific settings and custom packages.

## Features

*   **Declarative System Management:** Manage your entire OS configuration in a single, version-controlled repository.
*   **Reproducible Builds:** Ensure consistent environments across different machines.
*   **Modular Design:** Organized into modules for various aspects like desktop environments, hardware, development tools, and custom packages.
*   **Home Manager Integration:** Seamlessly manage user-specific configurations and dotfiles.
*   **Multiple Desktop Environments:** Includes configurations for various desktop environments (e.g., Mate, XFCE, GNOME, KDE, Cinnamon, BSPWM, Axyl).
*   **Custom Packages:** Integrates custom-built packages like `aegis-nix`, `aegis-tui`, and `Nebula-config-nix`.
*   **ISO Generation:** Easily build installable ISO images for different architectures.

## Getting Started

To get started with this NixOS configuration, you'll need a Linux environment with Nix installed. If you're on Windows, the recommended approach is to use Windows Subsystem for Linux (WSL).

### Prerequisites

*   **Nix:** Ensure Nix is installed on your Linux system or within your WSL environment. Follow the official Nix installation guide: [https://nixos.org/download.html](https://nixos.org/download.html)
*   **Git:** Make sure Git is installed to clone this repository.

### Cloning the Repository

Open your terminal (or WSL terminal) and clone this repository:

```bash
git clone https://github.com/3xecutablefile/Custom-OS.git
cd athena-nix-main 
```

## Building the ISO

This repository includes a `build_iso.sh` script to simplify the process of generating installable NixOS ISO images. You can build ISOs for both `amd64` (x86_64-linux) and `aarch64` (arm64-linux) architectures.

1.  **Make the script executable:**
    ```bash
    chmod +x build_iso.sh
    ```

2.  **Build for `amd64` (x86_64-linux):**
    ```bash
    ./build_iso.sh x86_64-linux
    ```
    (Running `./build_iso.sh` without any arguments will also default to `x86_64-linux`.)

3.  **Build for `aarch64` (arm64-linux):**
    ```bash
    ./build_iso.sh aarch64-linux
    ```

After the build process completes, the resulting `.iso` file will be symlinked into the `result/iso/` directory in your current working directory.

## Applying Your Configuration

Once you've cloned the repository and navigated into the directory, you can apply your NixOS and Home Manager configurations.

### NixOS System Configuration

To apply your system-wide NixOS configuration, use the `nixos-rebuild` command. This will build and activate your system configuration based on the `flake.nix` file.

```bash
sudo nixos-rebuild switch --flake .#your-hostname
```

*   Replace `your-hostname` with the hostname defined in your `nixos/hosts/` directory (e.g., `nixos/hosts/default.nix` or a specific host configuration you've set up). You can find your current hostname by running `hostname` in your terminal.

### Home Manager User Configuration

To apply your user-specific Home Manager configuration, use the `home-manager` command. This manages your dotfiles and user-level packages.

```bash
home-manager switch --flake .#your-username@your-hostname
```

*   Replace `your-username` with your actual username (e.g., `whoami`).
*   Replace `your-hostname` with the same hostname used for your NixOS system configuration.

## Repository Structure

*   `flake.nix`: The main Nix flake file defining the project's inputs and outputs.
*   `flake.lock`: Locks the versions of the flake inputs for reproducible builds.
*   `LICENSE`: Project license information.
*   `docs/`: Documentation related to Nix and Nixpkgs.
*   `nixos/`: Contains the core NixOS configuration.
    *   `configuration.nix`: Main system configuration.
    *   `default.nix`: Entry point for the NixOS configuration.
    *   `home-manager/`: Home Manager configurations for user environments.
    *   `hosts/`: Host-specific configurations.
    *   `installation/`: ISO building configurations and installation scripts.
    *   `modules/`: Modular system configurations (boot, cyber, design, dev, dms, hardware, misc).
    *   `pkgs/`: Custom Nix packages defined for this project.

## License

This project is licensed under the terms specified in the `LICENSE` file.
