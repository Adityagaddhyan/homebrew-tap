cask "viewdeck" do
  arch arm: "arm64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "41d798881ab4034aba8f8f0ed4af456d01fa436ec1b0f7817fc80dc452d947f9",
         intel: "be35faa2eaecb5b6958c00b0bebd28ce8030700f179a00f99fd9a5ec8de3e2f6"

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
