# typed: false
# frozen_string_literal: true

class AgentTelegram < Formula
  desc "AI-powered Telegram CLI"
  homepage "https://github.com/avemeva/kurier"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.8/agent-telegram-darwin-x64.zip"
      sha256 "a23ad23c2fe3b46b40451cc10eb1f480d0014cb3f466ca9c8d7c48ffbf0f0a66"
    end
    if Hardware::CPU.arm?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.8/agent-telegram-darwin-arm64.zip"
      sha256 "de4c0f86b32afad79a1eff9e2242415c74a53ac53f6dd5e0ab2dd1e024ae74c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.8/agent-telegram-linux-x64.tar.gz"
      sha256 "007fa0c97ee5f72748456d690f5956ca59311a05d9e42588f22a5566e05b2a03"
    end
    if Hardware::CPU.arm? and Hardware::CPU.is_64_bit?
      url "https://github.com/avemeva/kurier/releases/download/v0.1.8/agent-telegram-linux-arm64.tar.gz"
      sha256 "991d3058d20f18f5a701f81226d5f3197789ddc7b484f35ede24e06f2f7853ad"
    end
  end

  def install
    bin.install "bin/agent-telegram"
    (lib/"agent-telegram").install Dir["lib/*"] if (buildpath/"lib").exist?
  end
end
