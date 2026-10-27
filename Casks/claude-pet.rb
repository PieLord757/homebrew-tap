cask "claude-pet" do
  version "0.3.5"
  sha256 "73dcbeb8b5be939a0027adc50981c03eaba35596115b3e3307cb02d41720ef18"

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
    Claude Pet isn't notarized yet. If macOS blocks the first launch,
    right-click ClaudePet in Applications and choose Open.
  EOS
end
