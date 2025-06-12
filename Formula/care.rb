class Care < Formula
  desc "Configure apps remotely"
  homepage "https://github.com/egeniq/app-remote-config"
  url "https://github.com/egeniq/app-remote-config.git",
    tag:      "0.6.1",
    revision: "0a8e68c01704c53412f3394d468dbb0b38304a56"
  license "MIT"
  version_scheme 1
  head "https://github.com/egeniq/app-remote-config.git", branch: "main"

  depends_on xcode: [">= 15.4", :build]
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "care"
    bin.install ".build/release/care"
  end

  test do
    system "true"
  end
end
