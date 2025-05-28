{ config, ... }:

{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "sudo"
        "z"
      ];
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
    };

    shellAliases = {
      ll = "ls -alF";
      la = "ls -a";
      ".." = "cd ..";
      rebuild-nix = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      # Alias rebuild-nix-pdanet Anda sudah benar dan tidak terpengaruh masalah interpolasi ini
      # karena URL proxy di-hardcode, yang mana aman.
      rebuild-nix-pdanet = ''
        sudo \
          http_proxy="http://192.168.49.1:8000" \
          https_proxy="http://192.168.49.1:8000" \
          ftp_proxy="http://192.168.49.1:8000" \
          NO_PROXY="localhost,127.0.0.1,.local" \
          nixos-rebuild switch --flake /etc/nixos#nixos
      '';
    };

    initExtra = ''
      # Fungsi untuk PdaNet Proxy
      pdaproxy() {
        export http_proxy="http://192.168.49.1:8000"
        export https_proxy="http://192.168.49.1:8000"
        export ftp_proxy="http://192.168.49.1:8000"

        export HTTP_PROXY="http://192.168.49.1:8000"
        export HTTPS_PROXY="http://192.168.49.1:8000"
        export FTP_PROXY="http://192.168.49.1:8000"

        export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
        export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com"
        
        echo "Proxy PdaNet diaktifkan: http://192.168.49.1:8000"
        echo "Untuk menjalankan rebuild NixOS dengan proxy PdaNet, gunakan alias:"
        echo "  rebuild-nix-pdanet"
      }

      noproxy() {
        unset http_proxy https_proxy ftp_proxy
        # Perbaikan: ftp_proxy harusnya FTP_PROXY agar konsisten dengan yang di-set
        unset HTTP_PROXY HTTPS_PROXY FTP_PROXY 
        unset no_proxy NO_PROXY
        echo "Proxy PdaNet dinonaktifkan."
      }
    '';
  };
}
