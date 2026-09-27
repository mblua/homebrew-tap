cask "agentscommander" do
  arch arm: "aarch64", intel: "x64"

  version "0.39.0"
  sha256 arm:   "d50c165b1ff6c7b651a3d72dfb4d0636ade75597f4bdb15874a19759a5c36f82",
         intel: "3e23c611e8e5e20cb791e5dd3c777ff1979aba2b1391672b7ecb3e499b2eaae8"

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
