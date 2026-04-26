{ den, ... }:  
{  
  den.aspects.git = {  
    # System-level git configuration  
    nixos = { pkgs, ... }: {  
      environment.systemPackages = [ pkgs.git ];  
    };  
      
    # User-level git configuration  
    provides.user-config = {  
      homeManager = { pkgs, ... }: {  
        programs.git = {  
          enable = true;  
          userName = "ssoberun";  
          userEmail = "5744sam@gmail.com";  
        };  
      };  
    };  
  };  
}
