cask "agent-telegram" do
  version "0.1.5"

  on_arm do
    sha256 "365e5af079c57ba89714366b2190d789d35c224f1256fadc188a0be42389d0df"
    url "https://github.com/avemeva/kurier/releases/download/v#{version}/agent-telegram-darwin-arm64.zip"
  end

  name "agent-telegram"
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"

  binary "bin/agent-telegram"
end
