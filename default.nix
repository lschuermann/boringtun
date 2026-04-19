{
  lib,
  rustPlatform,
  nix-gitignore,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "boringtun";
  version = "0.6.0-vrf-patch";

  src = nix-gitignore.gitignoreSource [] ./.;

  cargoLock.lockFile = ./Cargo.lock;

  # Testing this project requires sudo, Docker and network access, etc.
  doCheck = false;

  meta = {
    description = "Userspace WireGuard® implementation in Rust";
    homepage = "https://github.com/cloudflare/boringtun";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ xrelkd ];
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
    mainProgram = "boringtun-cli";
  };
})
