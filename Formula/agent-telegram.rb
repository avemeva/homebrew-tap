# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.4/agent-telegram-darwin-arm64.zip"
      sha256 "38e9403c037bc296a372adb1fcae40687e551c9dca54a0079f0cae064828e1a9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.4/agent-telegram-darwin-x64.zip"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.4/agent-telegram-linux-x64.tar.gz"
      sha256 "e60f72a7a7779e37ce0ab2b97e7b5ab26bf693fcf6edf9d6e9882a2fd818486b"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.4/agent-telegram-linux-arm64.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
