# NixConfig

```
# ~/.config/nix/nix.conf

experimental-features = nix-command flakes ca-references
```

# Installation
Install nix https://nixos.org/download.html

```
# Create a shell with all the required dependencies
nix-shell -p git nixFlakes

# Clone this repository
git clone https://github.com/sindrip/NixConfig

# Build and install
./nixconf install
```

