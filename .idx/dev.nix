{pkgs}: {
  channel = "stable-23.05"; # "stable-23.05" or "unstable"
  packages = [
    pkgs.hugo
  ];
  idx.extensions = [
    "vscodevim.vim"
    "bungcip.better-toml"
  ];
  idx.previews = {
    enable = true;
    previews = [
      {
        command = ["hugo " "server" "--port" "$PORT" "--bind" "0.0.0.0 "];
        manager = "web";
        id = "web";
      }
    ];
  };
}