class Care < Formula
  desc "Configure apps remotely"
  homepage "https://github.com/egeniq/app-remote-config-care"
  url "https://github.com/egeniq/app-remote-config-care.git",
    tag:      "0.4.0",
    revision: "b0fb5137ae4864289a6c88f8eeb0f309e00fd929"
  license "MIT"
  version_scheme 1
  head "https://github.com/egeniq/app-remote-config-care.git", branch: "main"

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
