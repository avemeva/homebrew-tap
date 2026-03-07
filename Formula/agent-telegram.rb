# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.15"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.15/agent-telegram-darwin-x64.zip"
      sha256 "867807121a748b773e0560278bd034c4b8b053c5d15ac45bc0d3a7c119b0a9b8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.15/agent-telegram-darwin-arm64.zip"
      sha256 "066ecca7206baca0c24c4d8cc830041b831e5fee46c6915179ec05b7199f63ad"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.15/agent-telegram-linux-x64.tar.gz"
      sha256 "c91804e507c4a86123ebff8480ca153334a9bd32b5ecda1108f3b69fe823013f"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.15/agent-telegram-linux-arm64.tar.gz"
      sha256 "4e868993fde4d555eeb8974b37a173c5f326db3c40f9b8c69b5ae0c9409bd9c3"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
