# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.9/agent-telegram-darwin-x64.zip"
      sha256 "ebac4b6c89fd1b69b23ddbfa9cb4eaaf7da027f7ab4c357ffed618cebcdf8596"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.9/agent-telegram-darwin-arm64.zip"
      sha256 "13432ab19bf0ecea2de9e1a98aca97186e76205cc76be4537fe754b76eb8ff26"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.9/agent-telegram-linux-x64.tar.gz"
      sha256 "464f4c875786f9aeef36d520cfa2816512a6914a1e57907e07261bfa7833ab67"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.9/agent-telegram-linux-arm64.tar.gz"
      sha256 "4e72c5643c7d6c33b32c043a1aae2e8b7dc525408e92d8b9aaa8e8115dd12df9"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (bin/"prebuilds").install Dir["bin/prebuilds/*"] if (buildpath/"bin/prebuilds").exist?
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
