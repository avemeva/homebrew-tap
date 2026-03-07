# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.16"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.16/agent-telegram-darwin-x64.zip"
      sha256 "032fe8e90fc30bc8006c7eae1945b11b854c9af4979d3c5500fb624b6111e790"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.16/agent-telegram-darwin-arm64.zip"
      sha256 "83137edaba7f45c9fb6a6db58473d4a3f5324fef71fb441f23135c15b36599d4"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.16/agent-telegram-linux-x64.tar.gz"
      sha256 "e68dc8ed847f2da052fbedfb4bf912db0f60b43f1fbc8d2abab0e953d471fa89"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.16/agent-telegram-linux-arm64.tar.gz"
      sha256 "d648a95ed6fa14c0d0b6f898cbf5a5cbea5359e20df986e23a09cad5f03db879"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
