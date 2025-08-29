class Focussessions < Formula
  desc "Beautiful CLI tool for managing focus sessions and tracking productivity"
  homepage "https://github.com/adibhanna/focussessions"
  url "https://github.com/adibhanna/focussessions/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "68048ee260c0a2e939a8b451760fffca51564f3c1271b8a8c311f20715053a5b"
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

    # Test that the binary can be executed (since this is an interactive app)
    begin
      system bin/"focussessions", "--version"
    rescue
      # Expected to fail since --version is not supported, just verify it's executable
    end
  end
end
