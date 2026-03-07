# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.12"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.12/agent-telegram-darwin-x64.zip"
      sha256 "4bf1d830a740d1d7283b6666f78756db314fe66e59c450b6d4bfc05789007116"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.12/agent-telegram-darwin-arm64.zip"
      sha256 "56f049294da213e4cc44b646c6fa9b8a301b245a5f6f87b90350108b3979fe41"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.12/agent-telegram-linux-x64.tar.gz"
      sha256 "f04667d6be2ee9eec5f55717be0d6aa5e8ec54982d54ad73f622b2a2f79f4251"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.12/agent-telegram-linux-arm64.tar.gz"
      sha256 "c9627b067a306ac655ca7de8286539f90513ef623dd1e25c92184bb31836f759"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
