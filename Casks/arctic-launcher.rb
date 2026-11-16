cask "arctic-launcher" do
  version "0.6.3"
  sha256 "bcfc2b6df3d36ccf0da075b687bd6dae06373f71c97a4c0075a36e9da7c633a0"

  url "https://github.com/brksfrb/arctic-launcher/releases/download/v#{version}/arctic-launcher-macos.zip"
  name "Arctic Launcher"
  desc "Minecraft launcher with the Arctic Client mod"
  homepage "https://arcticlauncher.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Arctic Launcher.app"

  # Not notarized yet: clear the download flag so macOS opens it without the warning.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Arctic Launcher.app"],
        sudo: false
  end
end

