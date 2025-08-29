class Focussessions < Formula
  desc "Beautiful CLI tool for managing focus sessions and tracking productivity"
  homepage "https://github.com/adibhanna/focussessions"
  url "https://github.com/adibhanna/focussessions/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "77cc54d00d88324adcd7135df9ef89bcc90eafa023f768fdf5e86789e0ceb3b1"
  license "MIT"
  head "https://github.com/adibhanna/focussessions.git"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/focussessions"
  end

  test do
    # Test that the binary exists and is executable
    assert_path_exists bin/"focussessions"
    assert_predicate bin/"focussessions", :executable?

    # Test version output
    output = shell_output("#{bin}/focussessions --version")
    assert_match "Focus Sessions v#{version}", output
  end
end
