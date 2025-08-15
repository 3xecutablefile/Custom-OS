#!/bin/bash

echo "Select target architecture for ISO build:"
echo "1) Build for aarch64 (arm64-linux)"
echo "2) Build for amd64 (x86_64-linux)"
echo "Enter your choice (1 or 2):"

read -r choice

case $choice in
    1)
        TARGET_ARCH="aarch64-linux"
        ;;
    2)
        TARGET_ARCH="x86_64-linux"
        ;;
    *)
        echo "Invalid choice. Please enter 1 or 2."
        exit 1
        ;;
esac

echo "Building NixOS ISO for architecture: $TARGET_ARCH..."
nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=./nixos/installation/iso.nix --argstr system "$TARGET_ARCH"
echo "ISO build process initiated for $TARGET_ARCH. The resulting ISO will be symlinked to ./result/iso/ in your current directory."