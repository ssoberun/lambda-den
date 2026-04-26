{
  # host aspect
  den.aspects.x1-machine = {
    # host NixOS configuration
    nixos =
      { pkgs, ... }: {
        environment.systemPackages = [ 
	  pkgs.hello
	  pkgs.git
	];
      };

    # host provides default home environment for its users
    provides.to-users.homeManager =
      { pkgs, ... }: {
        home.packages = [ pkgs.vim ];
      };
  };
}
