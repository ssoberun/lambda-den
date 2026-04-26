{ pkgs, config, lib, ... }: {
  imports = [
    ./hardware.nix
  ];
  networking.hostName = "x1-machine";  
  networking.networkmanager.enable = true;  
  time.timeZone = "Australia/Sydney";  
  i18n.defaultLocale = "en_AU.UTF-8";  
    
  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  nixpkgs.config.allowUnfree = true;  
    
  boot.loader.systemd-boot.enable = true;  
  boot.loader.efi.canTouchEfiVariables = true;  
  boot.kernelPackages = pkgs.linuxPackages_latest;  
    
  features.env-vars.enable = true;  
    
  services.displayManager.ly.enable = true;  
  services.xserver = {  
    enable = true;  
    xkb = {  
      layout = "au";  
      variant = "";  
    };  
  };  
    
  services.printing.enable = true;  
  security.rtkit.enable = true;  
  services.pipewire = {  
    enable = true;  
    alsa.enable = true;  
    alsa.support32Bit = true;  
    pulse.enable = true;  
  };  
    
  system.stateVersion = "25.11";  
}
