class LocalizationSync < Formula
  desc "Configure apps remotely"
  homepage "https://github.com/egeniq/localization-sync"
  url "https://github.com/egeniq/localization-sync.git",
    tag:      "0.0.1",
    revision: "4fd7d3631656e411fc7488d47ddb732838cb5e5b"
  version "0.0.1"
  license "MIT"
  version_scheme 1
  head "https://github.com/egeniq/localization-sync.git", branch: "main"

  depends_on xcode: [">= 15.4", :build]
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "localization-sync"
    bin.install ".build/release/localization-sync"
  end

  test do
    system "true"
  end
end
