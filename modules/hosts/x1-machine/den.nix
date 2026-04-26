{ den, ... }:  
{  
  den.aspects.x1-machine = {  
    includes = [  
      den.aspects.sops  
      den.aspects.git  
    ];  
      
    nixos = {  
      imports = [ 
        ./configuration.nix
	./hardware.nix
      ];  
    };  
      
    provides.to-users.homeManager = { pkgs, ... }: {  
      home.packages = [ pkgs.vim ];  
    };  
  };  
}
