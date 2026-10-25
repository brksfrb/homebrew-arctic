cask "arctic-launcher" do
  version "0.5.3"
  sha256 "0b49427ffc7c5461a674a12bcdbd74d4d8f288ec62592df24fed171cc9e78d15"

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
