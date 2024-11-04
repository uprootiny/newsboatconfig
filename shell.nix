# shell.nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  # Packages necessary for Newsboat and related scripts
  buildInputs = [
    pkgs.newsboat           # Newsboat - RSS feed reader
    pkgs.curl               # Curl - For handling web requests in scripts
    pkgs.git                # Git - For version control
    pkgs.jq                 # jq - For parsing JSON, if needed in future scripts
    pkgs.coreutils          # Core utilities (cat, grep, etc.)
    pkgs.bash               # Bash - Ensures compatibility for shell scripts
    pkgs.libnotify          # libnotify - For notifications in Newsboat
    pkgs.w3m                # w3m - Text-based web browser (alternative renderer)
    pkgs.tree               # tree - Directory structure visualization
    pkgs.python3            # Python 3 - For advanced parsing or scripting if needed
    pkgs.python310Packages.requests # Requests library for Python scripts if needed
  ];

  # Set environment variables for smoother usage
  shellHook = ''
    export NEWSBOAT_CONFIG_FILE=$PWD/config/config  # Set Newsboat config file
    export NEWSBOAT_URL_FILE=$PWD/config/urls       # Set Newsboat URLs file
    export PATH=$PATH:$PWD/scripts                  # Add project scripts to PATH for easier access

    echo "Environment set up for Newsboat project:"
    echo "- Config file: $NEWSBOAT_CONFIG_FILE"
    echo "- URLs file: $NEWSBOAT_URL_FILE"
    echo "- Available commands: validate_config.sh, parse_urls.sh, deploy.sh"
  '';
}

