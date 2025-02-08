{
  description = "Wolf's NixOS and Home Manager Config Overlay";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    hyprpaper.url = "github:hyprwm/hyprpaper";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-workspace2d.url = "github:404wolf/Hyprland-Workspace-2D";
    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    hyprland-plugins.inputs.hyprland.follows = "hyprland";
    hyprland-plugins.inputs.nixpkgs.follows = "nixpkgs";

    nix-neovim.url = "github:404Wolf/nix-neovim";
    capture-utils.url = "github:404Wolf/Screen-Capture";
    dalleCLI.url = "github:404Wolf/DALLE-CLI";
    nixGpt.url = "github:404Wolf/nixified-gpt-cli";
    remarkable-connection-utility.url = "github:/404wolf/remarkable-connection-utility";
    remarkable-obsidian.url = "github:404Wolf/remarkable-obsidian";
    cartographcf.url = "github:404Wolf/CartographCF";
    dashToDock.url = "github:404wolf/HyprDash";
    valfs.url = "github:404wolf/valfs";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
          # Hyprland and related packages
          hyprland = inputs.hyprland.packages.${system}.default;
          hyprpaper = inputs.hyprpaper.packages.${system}.default;
          hyprland-workspace2d = inputs.hyprland-workspace2d.packages.${system}.workspace2d;
          hyprland-plugins = inputs.hyprland-plugins.packages.${system}.default;

          # Other packages
          wrappedNvim = inputs.nix-neovim.packages.${system}.default;
          capture-utils = inputs.capture-utils.packages.${system}.default;
          dalleCLI = inputs.dalleCLI.packages.${system}.default;
          nixGpt = inputs.nixGpt.packages.${system}.default;
          rcu = inputs.remarkable-connection-utility.packages.${system}.default;
          obsidian = inputs.remarkable-obsidian.packages.${system}.obsidian;
          cartographcf = inputs.cartographcf.packages.${system}.default;
          dashToDock = inputs.dashToDock.packages.${system}.default;
          valfs = inputs.valfs.packages.${system}.default;
          firefox-addons = inputs.firefox-addons.packages.${system};
        };
      }
    );
}
