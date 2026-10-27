cask "claude-pet" do
  version "0.4.0"
  sha256 "898de301aa9140e15c565ee83d2e6695dcbf8e6be5162035c6991bbb83412764"

  url "https://github.com/PieLord757/claude-pet/releases/download/v#{version}/ClaudePet.zip"
  name "Claude Pet"
  desc "Floating pixel pet showing which Claude Code chats are working, waiting or done"
  homepage "https://github.com/PieLord757/claude-pet"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ClaudePet.app"

  uninstall quit: "local.claudepet"

  zap trash: [
    "~/Library/Application Support/ClaudePet",
    "~/Library/Preferences/local.claudepet.plist",
  ]

  caveats <<~EOS
    Claude Pet isn't notarized yet, so macOS blocks the first launch.
    Allow it once in System Settings > Privacy & Security > Open Anyway,
    or run:
      xattr -dr com.apple.quarantine #{appdir}/ClaudePet.app
  EOS
end
