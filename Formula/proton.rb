class Proton < Formula
    desc "Timeplus Proton: A streaming processor, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "3.0.14"

    if Hardware::CPU.arm?
      url "https://d.timeplus.com/proton-v#{version}-Darwin-arm64.tar.gz"
      sha256 "9ffe308b7e3642ae13129719556410c459be7ca888e528de815aea1769f277b9"
    else
      url "https://d.timeplus.com/proton-v#{version}-Darwin-x86_64.tar.gz"
      sha256 "73157d58be005ccfe8be75beb4a698feb498ae3e449ce4391a7fa417ce71f381"
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
          https://docs.timeplus.com/
        EOS
    end
  end
