class Proton < Formula
    desc "Timeplus Proton: A streaming processor, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "3.0.3"

    if Hardware::CPU.arm?
      url "https://d.timeplus.com/proton-v#{version}-Darwin-arm64"
      sha256 "83689793ee00840fdb8eedabede25ea4d6f070acd8a95803e30acdb1b6d600cf"
    else
      url "https://d.timeplus.com/proton-v#{version}-Darwin-x86_64"
      sha256 "d58af92f925de938a6c65c0c37051eccbb60f97378ee9d30a70e3726951beb2d"
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
