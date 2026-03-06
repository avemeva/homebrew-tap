# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.2/agent-telegram-darwin-arm64.zip"
      sha256 "1b68f06e3c062f9e414b74e555d620b6333f1cb676ea38b0f3bebfd30fa492df"
    end
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.2/agent-telegram-darwin-x64.zip"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.2/agent-telegram-linux-x64.tar.gz"
      sha256 "99915891bc0979a3f538b3c0e3a1436406f56d6284148f2863f5cca2ebadcd1a"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.2/agent-telegram-linux-arm64.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
