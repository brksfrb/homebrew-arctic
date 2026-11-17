cask "arctic-launcher" do
  version "0.6.4"
  sha256 "cd675de20f7cd76e68fdba12f32684aa4889a0527cf430499afe98c4d0c83553"

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

