class Care < Formula
  desc "Configure apps remotely"
  homepage "https://github.com/egeniq/app-remote-config"
  url "https://github.com/egeniq/app-remote-config/releases/download/0.8.0/care-0.8.0-macos.tar.gz"
  sha256 "5d74fd5a69f62dc749be5dfe005af6c70807244de6d8221aa09796a3cf02f4e9"
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
