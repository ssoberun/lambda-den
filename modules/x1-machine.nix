{ den, pkgs, ... }:  
{  
  den.aspects.x1-machine = { pkgs, input, ...}: {  
    includes = [  
      den.aspects.sops  
      den.aspects.git  
      # (den.provides.import-tree ./hosts/x1-machine)
    ];  
      
    nixos = {  
      imports = [
        ./hosts/x1-machine/_nixos/configuration.nix
	./hosts/x1-machine/_nixos/hardware.nix
      ];
      environment.systemPackages = [
        pkgs.git
	pkgs.hello
      ];
    };  
      
    provides.to-users.homeManager = { pkgs, ... }: {  
      home.packages = [ pkgs.vim ];  
    };  
  };  
}

