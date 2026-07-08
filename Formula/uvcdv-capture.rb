class UvcdvCapture < Formula
  desc "Lossless MiniDV capture over USB (UVC DV payload) — no FireWire needed"
  homepage "https://github.com/boriswinner/uvcdv-capture"
  url "https://github.com/boriswinner/uvcdv-capture/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "0555c096daee39e97ad888eeec7240ea5c08d81af1e85acea3fca9d35a90e32b"
  license "MIT"

  depends_on "libusb"
  depends_on "pkg-config" => :build
  depends_on :macos

  def install
    system "make"
    bin.install "uvcdv-capture"
  end

  def caveats
    <<~EOS
      Encoding (--encode/.mp4), terminal preview (--preview) and GUI snapshots
      additionally need ffmpeg at runtime:
        brew install ffmpeg

      The native GUI is not installed by this formula — grab
      "UVCDV Capture.app" from the GitHub releases page, or build it from
      source with `make app`.
    EOS
  end

  test do
    assert_match "uvcdv-capture", shell_output("#{bin}/uvcdv-capture --version")
  end
end
