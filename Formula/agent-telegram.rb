# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.17"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.17/agent-telegram-darwin-x64.zip"
      sha256 "4ecc10f7a7fefc7a8ec4eea69946b1f1f2332a9334ebfbf6940eee2f1c66b9fe"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.17/agent-telegram-darwin-arm64.zip"
      sha256 "ec95de14e39b9aea30e9a78fdbeecc541118b3dda07527dd6acd052f1a515ef8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.17/agent-telegram-linux-x64.tar.gz"
      sha256 "d79230c5e715c58abf382952588a844721c040fae2677b530615b7212ede4ad6"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.17/agent-telegram-linux-arm64.tar.gz"
      sha256 "23e2fb7b3174b71f081ace54342ffc2593e32fbf8eb401ac1c105113c2079d29"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
