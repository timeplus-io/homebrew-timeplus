class Proton < Formula
    desc "Timeplus Proton: A streaming processor, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "1.6.16"

    if Hardware::CPU.arm?
      url "https://d.timeplus.com/proton-v#{version}-Darwin-arm64"
      sha256 "dfa35787c4ffd69bece2087cb292ac94cbdafe71c9ef3785017f01327ea8dbe3"
    else
      url "https://d.timeplus.com/proton-v#{version}-Darwin-x86_64"
      sha256 "42ae94ee8d47f990a46993c1c0b67a1965f9a8f4168fe83029df848594c9b15f"
    end

    def install

      if Hardware::CPU.arm?
        bin.install "proton-v#{version}-Darwin-arm64" => "proton"
      elsif Hardware::CPU.intel?
        bin.install "proton-v#{version}-Darwin-x86_64" => "proton"
      end
    end

    def caveats
        <<~EOS
          To interact with Timeplus Proton:

          1. Start the Timeplus Proton server with data/log/config in the current folder:
             $ proton server

          2. In a separate terminal, connect to the server:
             $ proton client --host 127.0.0.1

          3. To terminate the server, press Ctrl+C in the server terminal.

          For detailed usage and more information, check out the Timeplus documentation:
          https://docs.timeplus.com/install
        EOS
    end
  end
