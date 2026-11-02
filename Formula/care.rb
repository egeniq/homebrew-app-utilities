class Care < Formula
  desc "Configure apps remotely"
  homepage "https://github.com/egeniq/app-remote-config"
  url "https://github.com/egeniq/app-remote-config/releases/download/0.8.2/care-0.8.2-macos.tar.gz"
  sha256 "014a118179ce9b5262647dc893b50cb0120aa3479decbd80167ce0bae90f0c71"
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
