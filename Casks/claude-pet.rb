cask "claude-pet" do
  version "0.4.1"
  sha256 "0f064a5e4c4d050f743d337bfd73cab02755fd6a42d460c897fc9e19fbd53c8f"

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
