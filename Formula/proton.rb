class Proton < Formula
    desc "A unified streaming and historical data processing engine in one single binary, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "1.3.25"

    if Hardware::CPU.arm?
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-arm64"
      sha256 "3cfe92c2ac379c33fa7589a1d05efc2dc7a93e3ae1d9e253b25b97ba29f7188d"
    else
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-x86_64"
      sha256 "e27812f192d8f6cb98d54b474136072db6ab4cc0aa475ebe6a9b94152a37a770"
    end

    def install
      if Formula["proton"].linked_keg.exist?
        kegs = Formula["proton"].installed_kegs
        kegs.each do |keg|
          if keg.version < version
            ohai "Unlinking and removing older version: Proton #{keg.version}"
            keg.unlink
            keg.remove
          end
        end
      end

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
