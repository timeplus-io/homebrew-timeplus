class Proton < Formula
    desc "A unified streaming and historical data processing engine in one single binary, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "1.3.27"

    if Hardware::CPU.arm?
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-arm64"
      sha256 "a7333cd03ac71ac42de14acd946f4f22a8cfda14ab5b46f7b0688710f8d58246"
    else
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-x86_64"
      sha256 "03b8f37192f6e1a82968cab066d58cf424e2390a2ba44f9ceb9d23cfecaef03f"
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
