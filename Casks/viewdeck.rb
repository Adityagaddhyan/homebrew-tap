cask "viewdeck" do
  arch arm: "arm64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "b4101e43c74d3aa1d0d72f732a68337d1590a9d22ee439b89815c16ba8f6154c",
         intel: "06e1c2f4b3cc910aa17ab35d0080e26be1ba063de73d9ad990987e9f8f324e6f"

  url "https://github.com/Adityagaddhyan/viewdeck/releases/download/v#{version}/ViewDeck-#{version}-#{arch}-mac.zip"
  name "ViewDeck"
  desc "Keyboard-first database GUI for PostgreSQL and AWS RDS"
  homepage "https://github.com/Adityagaddhyan/viewdeck"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on cask: "session-manager-plugin"
  depends_on formula: "awscli"
  depends_on macos: :ventura

  app "ViewDeck.app"

  zap trash: [
    "~/Library/Application Support/ViewDeck",
    "~/Library/Caches/dev.viewdeck.app",
    "~/Library/Caches/dev.viewdeck.app.ShipIt",
    "~/Library/Logs/ViewDeck",
    "~/Library/Preferences/dev.viewdeck.app.plist",
    "~/Library/Saved Application State/dev.viewdeck.app.savedState",
  ]

  caveats <<~EOS
    ViewDeck is ad-hoc signed and not notarised by Apple. On first launch macOS
    may block it. To allow it, open System Settings > Privacy & Security and
    click "Open Anyway" next to the ViewDeck message, then launch it again.
  EOS
end
