{ den, ... }:
{
  # user aspect
  den.aspects.sam = {
    includes = [
      den.provides.define-user
      den.provides.primary-user
      (den.provides.user-shell "fish")
      den.aspects.git.provides.user-config
    ];

    homeManager = { pkgs, ... }: {
      home.packages = [ 
	pkgs.htop 
	pkgs.git
      ];

      programs.git = {
        userName = "ssoberun";
	userEmail = "5744sam@gmail.com";
      };
    };

    # user can provide NixOS configurations
    # to any host it is included on
    provides.to-hosts.nixos = { pkgs, ... }: { 

    };
  };
}
