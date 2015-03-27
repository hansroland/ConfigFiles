# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos"; # Define your hostname.
  networking.hostId = "198f2835";
  # networking.wireless.enable = true;  # Enables wireless.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "sg-latin1";
    defaultLocale = "de_CH.UTF-8";
  };

  # Definitions for Firefox and Chrome browsers
  nixpkgs.config = {
      allowUnfree = true;

      firefox = {
        enableGoolgleTalkPlugin = true;
        enableAdobeFlash = true;
      };

      chromium = {
        enablePepperFlash = true;
        enablePepperPDF = true;
      };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
      firefoxWrapper
      chromium
  #   wget
    ];

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "ch";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.kdm.enable = true;
  services.xserver.desktopManager.kde4.enable = true;
  services.xserver.autorun=false;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.guest = {
    isNormalUser = true;
    uid = 1000;
  };

  
  users.extraUsers.test =
  { name = "test";
    description = "Test user";
    isNormalUser = true;
    group = "users";
    home = "/home/test";
    createHome = true;
    extraGroups = [ "wheel" ];
    # openssh.authorizedKeys.keys = [ "ssh-dss AAAAB3Nza... alice@foobar" ];
  };
}
