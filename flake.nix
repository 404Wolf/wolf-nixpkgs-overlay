{
  description = "Wolf's NixOS and Home Manager Config Overlay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprland-workspace2d.url = "github:404wolf/Hyprland-Workspace-2D";
    nix-neovim.url = "github:404Wolf/nix-neovim";
    capture-utils.url = "github:404Wolf/Screen-Capture";
    dalleCLI.url = "github:404Wolf/DALLE-CLI";
    nixGpt.url = "github:404Wolf/nixified-gpt-cli";
    remarkable-connection-utility.url = "github:/404wolf/remarkable-connection-utility";
    remarkable-obsidian.url = "github:404Wolf/remarkable-obsidian";
    cartographcf.url = "github:404Wolf/CartographCF";
    dashToDock.url = "github:404wolf/HyprDash";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: {
        overlays.default = final: prev: {
          hyprpaper = inputs.hyprpaper.packages.${system}.default;
          hyprland-workspace2d = inputs.hyprland-workspace2d.packages.${system}.workspace2d;
          wrappedNvim = inputs.nix-neovim.packages.${system}.default;
          capture-utils = inputs.capture-utils.packages.${system}.default;
          dalleCLI = inputs.dalleCLI.packages.${system}.default;
          nixGpt = inputs.nixGpt.packages.${system}.default;
          rcu = inputs.remarkable-connection-utility.packages.${system}.default;
          obsidian = inputs.remarkable-obsidian.packages.${system}.obsidian;
          cartographcf = inputs.cartographcf.packages.${system}.default;
          dashToDock = inputs.dashToDock.packages.${system}.default;
        };
      }
    );
}
