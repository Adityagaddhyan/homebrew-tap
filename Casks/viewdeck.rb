cask "viewdeck" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "a531bd483c46cf3ba00042639caa6e2f4d609410714a02fd282ad20e20de4065",
         intel: "ce12878a924dd4a05a491d690a0711b69e6bbd3eca3637bc4080d4050d099212"

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
