# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.13"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.13/agent-telegram-darwin-x64.zip"
      sha256 "d2f48f6fdeb147f9db35e55effd72d353204117c3b74a3d4838710b8d2bfb264"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.13/agent-telegram-darwin-arm64.zip"
      sha256 "afd746b7af6d4f99ee4cda31a1ddd50dbc91411ea8d0ddb38da9a3f411e77eea"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.13/agent-telegram-linux-x64.tar.gz"
      sha256 "0583d260e8c1afc368fe998238caca803006344f73f1589aeea451a0a3c2e937"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.13/agent-telegram-linux-arm64.tar.gz"
      sha256 "b1fb0d3644a8e84e71ed4de3682244f19638ee30e3e6e276b08797d200519ec4"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
