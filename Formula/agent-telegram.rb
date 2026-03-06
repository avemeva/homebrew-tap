# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.11"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.11/agent-telegram-darwin-x64.zip"
      sha256 "4fdcb3f8c51cf070b56d43790ec3787094012e30516b3df4c12af254c7b65870"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.11/agent-telegram-darwin-arm64.zip"
      sha256 "f2fdef3553c4bbcd63d89d71c451a91e5cc5e9aadcca83633a6d25d8d8d64756"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.11/agent-telegram-linux-x64.tar.gz"
      sha256 "d4d2133d4bffb51cd921522dee16bf93f23c74a09e477ac1f8d17b0213200212"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.11/agent-telegram-linux-arm64.tar.gz"
      sha256 "011f3ecb2994af249cc2d7523d22de95ddbfac1c49c514367df41fc2948b0a70"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
