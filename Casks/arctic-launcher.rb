cask "arctic-launcher" do
  version "0.5.7"
  sha256 "08f8e75163e30f4ede51f91bd5e2fe97c8da12a50144a6aff9bab13b8a4ece93"

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

