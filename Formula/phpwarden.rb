# Homebrew formula for phpwarden. Lives in a tap (github.com/oroma-alfred/homebrew-tap,
# file Formula/phpwarden.rb), because homebrew-core requires a project to be notable first.
#   brew tap oroma-alfred/tap && brew install phpwarden
class Phpwarden < Formula
  include Language::Python::Virtualenv

  desc "PHP vulnerability scanner ranked by real-world exploitation (CISA KEV, EPSS)"
  homepage "https://phpwarden.io"
  url "https://files.pythonhosted.org/packages/9e/8e/b15050b36b3fbed4cb8e521e57ee9ee9b685b0e39b0a493bc8ae2807296e/phpwarden-2.2.1.tar.gz"
  sha256 "20ffda50b1813f2744bf91284425e41d6c01975027b9d2114ca6f913aca0812b"
  license "Apache-2.0"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "phpwarden #{version}", shell_output("#{bin}/phpwarden --version")
    assert_match "146 engine CVEs", shell_output("#{bin}/phpwarden feed status")
  end
end
