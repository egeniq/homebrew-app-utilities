class Care < Formula
  desc "Configure apps remotely"
  homepage "https://github.com/egeniq/app-remote-config-care"
  url "https://github.com/egeniq/app-remote-config-care.git",
    tag:      "0.6.0",
    revision: "8e0c20702c48cea57ec15ba4d96ff3391219af10"
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
