# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.10/agent-telegram-darwin-x64.zip"
      sha256 "c24e0569003c0d533973124656cdfecca09add414a7ecdcec5f5da313d4ca671"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.10/agent-telegram-darwin-arm64.zip"
      sha256 "265ad329b0cd5285d26ce65a2b56a220704536ae70c773a72783129d0f7af2cf"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.10/agent-telegram-linux-x64.tar.gz"
      sha256 "210a4eaa34f3631543769a3b4cd1c9255644e76054dd47c2d98e820cd026d3ed"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.10/agent-telegram-linux-arm64.tar.gz"
      sha256 "c2e039a73e5b42be07fd2b938fd7c9eddb07d43808afe9d33ec94bb93a0bce19"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
