with import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/master.zip") {};
mkShell rec {
    packages = [
        haskell.compiler.ghc914
        haskell.packages.ghc914.cpphs
        cabal-install
        zlib.dev
        pcre.dev
    ];
    shellHook = ''
        [[ -f ~/.local/bin/mhs ]] || cabal install MicroHs
        [[ -f ~/.local/bin/mcabal ]] || cabal install MicroCabal
    '';
}