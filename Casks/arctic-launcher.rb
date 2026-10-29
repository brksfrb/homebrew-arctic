cask "arctic-launcher" do
  version "0.5.6"
  sha256 "3bbff7f7bc5efd499a25bba76742c3c6b9fc396c81fc80026013c40a58ea0ad1"

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

