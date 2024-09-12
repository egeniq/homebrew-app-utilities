class Care < Formula
  desc "Configure apps remotely"
  homepage "https://github.com/egeniq/app-remote-config-care"
  url "https://github.com/egeniq/app-remote-config-care.git",
    tag:      "0.0.4",
    revision: "99bcb2f104524c63a64c3a57b302e64ef3375dad"
  version "0.0.4"
  license "MIT"
  version_scheme 1
  head "https://github.com/egeniq/app-remote-config-care.git", branch: "main"

  depends_on xcode: ["15.4", :build]
  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "care"
    bin.install ".build/release/care"
  end

  test do
    shell_output("#{bin}/care init test.yaml")
    expected_output = 
"""This configuration is \e[0;32mvalid\e[0;0m.
\e[0;32m[INFO]\e[0;0m This configuration is in YAML. This is not suitable for publication. Use the prepare command to convert to JSON. - \e[0;2m/\e[0;0m
\e[0;36m[HINT]\e[0;0m Use the resolve command to verify the output is as expected for an app.
\e[0;36m[HINT]\e[0;0m Use the prepare command to prepare the configuration for publication.
"""
    assert_equal(expected_output, shell_output("#{bin}/care verify test.yaml"))
  end
end
