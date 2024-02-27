class Proton < Formula
    desc "A unified streaming and historical data processing engine in one single binary, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "1.5.2"

    if Hardware::CPU.arm?
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-arm64"
      sha256 "71ac68ad28e4154914a6d50a67c4c841146fe78db735fd0dff30d1891ea362d7"
    else
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-x86_64"
      sha256 "64324a25d7f1a2be4f2ea251dfc76d5e59022bbbddbdca563eb92353d0b5ce20"
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
          To interact with Proton:

          1. Start the Proton server:
             $ proton server start

          2. In a separate terminal, connect to the server:
             $ proton client
             (Note: If you encounter a 'connection refused' error, use: proton client --host 127.0.0.1)

          3. To terminate the server, press ctrl+c in the server terminal.

          For detailed usage and more information, check out the Timeplus documentation:
          https://docs.timeplus.com/
        EOS
    end
  end
