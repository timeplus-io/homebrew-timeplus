class Proton < Formula
    desc "Timeplus Proton: A streaming processor, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "3.0.2"

    if Hardware::CPU.arm?
      url "https://d.timeplus.com/proton-v#{version}-Darwin-arm64"
      sha256 "0ad612ebbb8c6d19d9d6f7399f0e7a91701d98df01c0ed479747929f841714be"
    else
      url "https://d.timeplus.com/proton-v#{version}-Darwin-x86_64"
      sha256 "c16afc84220a2af041fdbfcd707ab2d1c55bb69d9427198b035b0ebf8ff8e07f"
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
