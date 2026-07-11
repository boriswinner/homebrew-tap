class UvcdvCapture < Formula
  desc "Lossless MiniDV capture over USB (UVC DV payload) — no FireWire needed"
  homepage "https://github.com/boriswinner/uvcdv-capture"
  url "https://github.com/boriswinner/uvcdv-capture/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "c36889adc98397902c042956289103bebd83dee429069519b67ef7c2f32a30b0"
  license "GPL-3.0-or-later"

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
