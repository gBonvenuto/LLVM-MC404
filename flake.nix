{
    inputs = {
        nixpkgs = {
            url = "github:NixOS/nixpkgs/nixos-24.11";
        };
    };

    outputs = inputs:
    let
        system = "x86_64-linux";
        pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    {
        devShells.${system} = {
            default = pkgs.mkShell {
                name = "LLVM Development Env";
                buildInputs = with pkgs;[
                    llvm_18
                ];
                NIX_SHELL=true;
                NIX_BUILD_SHELL=pkgs.zsh;
            };
        };
    };
}
