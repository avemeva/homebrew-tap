# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.3/agent-telegram-darwin-arm64.zip"
      sha256 "12f34fe55a21b94d21bf95f1af65616c85bfc7aa72887addf0319bd365b913cc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.3/agent-telegram-darwin-x64.zip"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.3/agent-telegram-linux-x64.tar.gz"
      sha256 "67703231de36ccf9e7bed15948b5c2ad0658e348b71898fb7fb3f25f676af055"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.3/agent-telegram-linux-arm64.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
