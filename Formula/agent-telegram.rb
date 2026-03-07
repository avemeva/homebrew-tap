# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.14"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.14/agent-telegram-darwin-x64.zip"
      sha256 "089fd21d9fd2c21f2ea60a7f3f339e9a4d57c09c1b68624722a0742adffdd650"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.14/agent-telegram-darwin-arm64.zip"
      sha256 "80e9eeb6ce3c0781f6cf9f4f1600788e870836fa07244fdc55c880e6e99160d0"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.14/agent-telegram-linux-x64.tar.gz"
      sha256 "36a8868f61ba138f0f29a09a627f5ac2adb5bd3c7f532fc6105abb5d29765cc3"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.14/agent-telegram-linux-arm64.tar.gz"
      sha256 "652e4bd2b57a4376f61e71be504137658a024102fa18057df99f2528a711bb8e"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
