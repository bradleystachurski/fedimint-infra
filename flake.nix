{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
  };

  outputs = { nixpkgs, disko, agenix, flake-utils, ... }@inputs:

    let

      overlays = [
        (final: prev: { })
      ];

      topLevelModule = {
        nixpkgs = {
          inherit overlays;
        };
        nix = {
          registry = {
            nixpkgs.flake = nixpkgs;
          };
          nixPath = [ "nixpkgs=${nixpkgs}" ];
        };
      };

      adminKeys = [
        # dpc
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRa93v8pzO+EXEH73odhh80VjkLVzPCaRw4K0sObdE9mbZqFB6k791Jm1cVQzHA+sCR4bnyOvA563ExLSGArw4IRxCZvZICSb8RI4QaIhCgf0NtwndKaBxnS2aWrJ/VKNmlZ4OsHMxrFtDRg0AHXBkj0H2O06bJ0+fiwiKdun1tqqi78qQPZkjaJoB227ipx3T0f9Oflj09iWVT3C0saaAiCtpa50ggjImom1FAwNF0gLhPGbSgUzsHzAndwexXWD5StAfWuePaapbQ0IIAY9ahlTKCXGSV0oS/IrBDjOfIaXoyzzgT4/xTz6dwie2g255mGTDn6k0CYkWX19H8xzT2TQ7e4ikNrXVdcRRRy4rd22MA75546RVD2mm36C0DnaUsnBUwymuQ02z33iTm8U7CZXQWpiKjwgqCtvs9zrsRx1YECHCw5ehUDt2nMw4ino42jthxV9bgQDQg/On7frBUXeKkd7L0UVfC71DW9AQQTvdHA2POpPhtoi7BznOeFMoVXxBMgJSgwGTH3ErY0zbvMLJNNROXby4rABmb7XTl5bav5DYD2lWzhcseN6a+/PgREyzllQxJqWQVQvA00JFuaNFLI7JeyIULUgyYuS5n/jEvmKKnzhwuGlHnIKF5UPViaF3WRiFSTop6taZNptBFWGBsG7eT8rTxb/FKtylVw== cardno:20_514_157"
        # elsirion
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+t2YktQZWLbv2BmIkWv9G98L5nNwnsVGMszcbnTu3W25bp0CJ4MtBmvmagygfAd+td9dPe44assaU5XNk1+eK9CMx3X3LlkJ4sVr6EYDG+HrBiFSWSIGlYA6EblXXiCIzKh6i+dAM+c35YUZLBxfKaqaWEF1REiR7O1DQxH6TU3qCMStxY5PF1rtiLjVHPBTiWv41zynRRqfA5L+sE+/NYrZj6NIKL5p6zAhKwV8YRavVTOzGDr+Rn+10t907JHjydFK6LfKpUADr4c/XkMY8IRgKCZsBeu9C+N2y93CbyfPua5+s/6caO6wHNjBYi2599Ky84XBtVt/WUQtq5WwXAe97j6Z+3M8bEqUFLUQxQh4r1hOE9ApEUYY6T//wDvqPDVMsKTkMe8HiAjOZawjzjQWYutAjGjuug9efFoP9WJ39J3SfmTDUHo+4Pyf+2ntqUyp6SMmBu7eTHOw1a4kDaQvIltBcokdhMm12RNdTwCLMS0YvFiRcJmzuemiTw78="
      ];

    in
    {
      nixosConfigurations.runner-01 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          topLevelModule

          disko.nixosModules.disko
          agenix.nixosModules.default
          ./hosts/runner-01/configuration.nix
        ];
        specialArgs = {
          inherit inputs;
          inherit adminKeys;
        };
      };

    } //

    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = pkgs.lib;
        in
        {
          devShells = {
            default = pkgs.mkShell {
              packages = [
                inputs.agenix.packages."${pkgs.system}".default

              ];
            };
          };

        }


      );
}

