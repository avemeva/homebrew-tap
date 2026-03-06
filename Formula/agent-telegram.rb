# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.5/agent-telegram-darwin-arm64.zip"
      sha256 "365e5af079c57ba89714366b2190d789d35c224f1256fadc188a0be42389d0df"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.5/agent-telegram-linux-x64.tar.gz"
      sha256 "cc9d201428c0de1b88db65bb5edf5949bde4772d1a8878664f1b5544d8d5a9de"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
