# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.0/tg-darwin-arm64.zip"
      sha256 "7ccc1fce42b151abe8b55978144dad566e244c63eeb62350ca00170c6d723572"

      def install
        bin.install "tg" => "agent-telegram"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.0/tg-darwin-x64.zip"
      sha256 "MISSING"

      def install
        bin.install "tg" => "agent-telegram"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.0/tg-linux-x64.tar.gz"
      sha256 "MISSING"

      def install
        bin.install "tg" => "agent-telegram"
      end
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.0/tg-linux-arm64.tar.gz"
      sha256 "MISSING"

      def install
        bin.install "tg" => "agent-telegram"
      end
    end
  end
end
