# Homebrew formula for phpwarden. Lives in a tap (github.com/oroma-alfred/homebrew-tap,
# file Formula/phpwarden.rb), because homebrew-core requires a project to be notable first.
#   brew tap oroma-alfred/tap && brew install phpwarden
class Phpwarden < Formula
  include Language::Python::Virtualenv

  desc "PHP vulnerability scanner ranked by real-world exploitation (CISA KEV, EPSS)"
  homepage "https://phpwarden.io"
  url "https://files.pythonhosted.org/packages/42/d8/d70c955055ff80cbac70bd5cd4ede223c1e2e308e93551f7f9c1bd0eae84/phpwarden-2.1.1.tar.gz"
  sha256 "38a6c06bb824e06463ddb7fab9c8acd06e3d14d4e40cd411cf13e0866d17bdbf"
  license "Apache-2.0"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "phpwarden #{version}", shell_output("#{bin}/phpwarden --version")
    assert_match "145 engine CVEs", shell_output("#{bin}/phpwarden feed status")
  end
end
