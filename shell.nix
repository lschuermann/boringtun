with import <nixpkgs> {};
pkgs.mkShell {
  name = "boringtun-dev";
  buildInputs = with pkgs; [
    rustc
    cargo
    rust-analyzer
    rustfmt
  ];
}
