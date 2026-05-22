class Care < Formula
  desc "Configure apps remotely"
  homepage "https://github.com/egeniq/app-remote-config"
  license "MIT"
  version_scheme 1
  head "https://github.com/egeniq/app-remote-config.git", branch: "main"

  stable do
    url "https://github.com/egeniq/app-remote-config/releases/download/0.7.2/care-0.7.2-macos.tar.gz"
    sha256 "63ad4aa97d1e445d012903de601cb3c5a4da120e513b34275badf5142cd78ae6"
    version "0.7.2"
  end

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
