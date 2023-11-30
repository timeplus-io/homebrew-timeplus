class ProtonAT1318 < Formula
    desc "A unified streaming and historical data processing engine in one single binary, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"
  
    version "1.3.18"
  
    if Hardware::CPU.arm?
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-Darwin-arm64"
      sha256 "75f48bd59c1c0421620b0fbdcd324bb840ec464b3e93e769a23786c9f575785e"
    else
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-Darwin-x86_64"
      sha256 "14e296cd0300931ba82223af0b081ccaddba1775988fc9be2b16553f5ec65591"
    end
  
    def install
      if Hardware::CPU.arm?
        bin.install "proton-Darwin-arm64" => "proton"
      elsif Hardware::CPU.intel?
        bin.install "proton-Darwin-x86_64" => "proton"
      end
    end

    def caveats
        <<~EOS
          Built from Git commit: e2427df64b8c5bde8e9f2816135c93226bf55c20
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
      assert_match "Gimi Liang", shell_output("#{bin}/proton local --query 'SELECT * FROM system.contributors'")
    end
  end
