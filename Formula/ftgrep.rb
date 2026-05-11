# typed: false
# frozen_string_literal: true

class Ftgrep < Formula
  desc "Full-text grep tool with Japanese morphological analysis indexing"
  homepage "https://github.com/amaya382/ftgrep"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/amaya382/ftgrep/releases/latest/download/ftgrep_Darwin_arm64.tar.gz"
      sha256 "58dcc4f24628401173262c84192adbcaadb44d060f1b2281cf9563dc3bdddd83"

      def install
        bin.install "ftgrep"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/amaya382/ftgrep/releases/latest/download/ftgrep_Linux_x86_64.tar.gz"
      sha256 "2f61d00ffb759013f41c8d621db34da1aff53afd2bc3b3a0fd97437f12e30800"

      def install
        bin.install "ftgrep"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/amaya382/ftgrep/releases/latest/download/ftgrep_Linux_arm64.tar.gz"
      sha256 "1e5027c34702aec900951ce85772a26ad9ed0dda30435755226638c677635258"

      def install
        bin.install "ftgrep"
      end
    end
  end
end
