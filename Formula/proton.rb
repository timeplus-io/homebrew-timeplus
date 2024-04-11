class Proton < Formula
    desc "Timeplus Proton: A streaming processor, powered by ClickHouse"
    homepage "https://timeplus.com"
    license "Apache-2.0"

    version "1.5.6"

    if Hardware::CPU.arm?
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-arm64"
      sha256 "976918ba85d028be674ad51aef866dd41435560c95d38524b4eac871feb6e915"
    else
      url "https://github.com/timeplus-io/proton/releases/download/v#{version}/proton-v#{version}-Darwin-x86_64"
      sha256 "ac889bbd0ec2385cc33e13c16dcb5ae36bb88de0095a767280b7cdbe6978e51a"
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
          https://docs.timeplus.com/install
        EOS
    end
  end
