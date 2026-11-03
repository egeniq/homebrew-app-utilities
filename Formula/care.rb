class Care < Formula
  desc "Configure apps remotely"
  homepage "https://github.com/egeniq/app-remote-config"
  url "https://github.com/egeniq/app-remote-config/releases/download/0.8.3/care-0.8.3-macos.tar.gz"
  sha256 "2b09b509caae6ed058bbf0f6011916af327c0d71f4791b2ba7494335b38c214c"
  license "MIT"
  version_scheme 1
  head "https://github.com/egeniq/app-remote-config.git", branch: "main"

  depends_on xcode: [">= 15.4", :build] if build.head?
  uses_from_macos "swift" if build.head?

  def install
    if build.head?
      system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "care"
      bin.install ".build/release/care"
    else
      bin.install "care"
    end
  end

  test do
    system "true"
  end
end
