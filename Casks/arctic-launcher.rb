cask "arctic-launcher" do
  version "0.5.1"
  sha256 "e165e37ea036824168f60d83d8bd3d7abe628e479e32ae8abebf3641acd1fa99"

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
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Arctic Launcher.app"],
                   sudo: false
  end
end
