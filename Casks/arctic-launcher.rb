cask "arctic-launcher" do
  version "0.6.6"
  sha256 "6b1d69c863be9d05b9c0fc86fb09bfeef16d1fcef8ff62eb410b8630f0bef624"

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

