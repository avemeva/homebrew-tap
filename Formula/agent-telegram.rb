# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.18"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.18/agent-telegram-darwin-x64.zip"
      sha256 "36235268ab5533639a0b12686d97b4bf08adff5373dfbd634690d86742ac1cba"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.18/agent-telegram-darwin-arm64.zip"
      sha256 "b9c58b2b6e3ac66527e3062df5e3248e766d3c5c50130c02a52d4369cc39e4b8"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.18/agent-telegram-linux-x64.tar.gz"
      sha256 "549784f09f2134b948adef45b62f51c5604fc21ce2ba6f89fb1549ee674bcec1"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.18/agent-telegram-linux-arm64.tar.gz"
      sha256 "3f6213c52915eb3f86d9c933088cc570249543342b1175be72f2d488a464313e"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
