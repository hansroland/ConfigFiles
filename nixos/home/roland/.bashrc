# ~/.bashrc

# After changes, reload this file with: source ~/.bashrc

# Little shell function to search nix package database
nix-search(){ echo "Searching"; nix-env -qaP --description .*$1.* ; }
