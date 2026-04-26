{ den, inputs, ... }:  
{  
  flake-file.inputs = {  
    sops-nix = {  
      url = "github:Mic92/sops-nix";  
      inputs.nixpkgs.follows = "nixpkgs";  
    };  
  };  
  
  den.aspects.sops = {  
    nixos = { ... }: {  
      imports = [ inputs.sops-nix.nixosModules.sops ];  
        
      sops.defaultSopsFile = ../secrets/secrets.yaml;  
      sops.age.keyFile = "/var/lib/sops-nix/key.txt";  
    };  
      
    provides.user-secrets = {  
      nixos = { ... }: {  
        sops.secrets.user-password.neededForUsers = true;  
        sops.secrets.api-key = {};  
      };  
    };  
  };  
}
