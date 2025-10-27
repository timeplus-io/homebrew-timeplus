class Proton < Formula
    desc "Timeplus Proton: A streaming processor, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "3.0.5"

    if Hardware::CPU.arm?
      url "https://d.timeplus.com/proton-v#{version}-Darwin-arm64.tar.gz"
      sha256 "b58cb1605e65c979aafe0e32003317ac7fc2b1ff248aed71510f5ba4975801ba"
    else
      url "https://d.timeplus.com/proton-v#{version}-Darwin-x86_64.tar.gz"
      sha256 "5d45fe6a3f50b1f03d12d1841ce9ae2ff31eab66f81f526e167ca471b6d0707b"
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
