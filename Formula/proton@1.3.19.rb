class ProtonAT1319 < Formula
    desc "A unified streaming and historical data processing engine in one single binary, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "1.3.19"

    if Hardware::CPU.arm?
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-arm64"
      sha256 "40b5325f4f4f6505b4eb91129c5a62030f9b8e520cb23c56b9c27be1408ec8a9"
    else
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-x86_64"
      sha256 "ebd249d7c768b5e4abe050834f4671291c4d2ce20f908bd1d9cd09a4a708f43f"
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

    test do
      assert_match "proton-robot", shell_output("#{bin}/proton local --query 'SELECT * FROM system.contributors'")
    end
  end
