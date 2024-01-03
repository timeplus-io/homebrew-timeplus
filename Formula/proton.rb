class Proton < Formula
    desc "A unified streaming and historical data processing engine in one single binary, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "1.3.30"

    if Hardware::CPU.arm?
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-arm64"
      sha256 "3284ea7a99ef50780152c8eccea0e536f1975d5d24a7743663e4ecab65df8527"
    else
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-x86_64"
      sha256 "196b9a8bb388af8439365833352ec8b9e350e183364bc6e44e4322f620df5604"
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
