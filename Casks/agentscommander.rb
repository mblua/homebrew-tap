cask "agentscommander" do
  arch arm: "aarch64", intel: "x64"

  version "0.41.0"
  sha256 arm:   "900f18b9fdec802c8c5d9e830242a2d0d538b0526f25b3980d894e933bc30b5d",
         intel: "d434a292211eabb7101605a9d25f1350454b5f35885b44e8d0541112a5903304"

  url "https://github.com/mblua/AgentsCommander/releases/download/v#{version}/Agents.Commander_#{version}_#{arch}.dmg"
  name "Agents Commander"
  desc "Run multiple CLI coding agents as a coordinated team"
  homepage "https://github.com/mblua/AgentsCommander"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Agents Commander.app"

  zap trash: [
    "~/Library/Application Support/dev.agentscommander.app",
    "~/Library/Caches/dev.agentscommander.app",
    "~/Library/Preferences/dev.agentscommander.app.plist",
    "~/Library/Saved Application State/dev.agentscommander.app.savedState",
    "~/Library/WebKit/dev.agentscommander.app",
  ]

  caveats <<~EOS
    Agents Commander is not yet signed or notarized by Apple.
    If macOS blocks it on first launch, run:
      xattr -dr com.apple.quarantine "/Applications/Agents Commander.app"
  EOS
end
