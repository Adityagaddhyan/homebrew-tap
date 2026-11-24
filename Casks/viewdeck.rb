cask "viewdeck" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "88d66357df155914e355ce3dbecd4e206b80f9825db9b7cb9f226c720c52dc4d",
         intel: "ab48b8f03bdfc774aa88749b1b348874fedee5c30a648e9458d10d7ff14b1a35"

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
