# Homebrew formula for phpwarden. Lives in a tap (github.com/oroma-alfred/homebrew-tap,
# file Formula/phpwarden.rb), because homebrew-core requires a project to be notable first.
#   brew tap oroma-alfred/tap && brew install phpwarden
class Phpwarden < Formula
  include Language::Python::Virtualenv

  desc "PHP vulnerability scanner ranked by real-world exploitation (CISA KEV, EPSS)"
  homepage "https://phpwarden.io"
  url "https://files.pythonhosted.org/packages/1d/3e/4e7a9b77e31ff416a100a8a0d3b61fbfa2baeab71e3d75b3c0c3857711bb/phpwarden-2.6.0.tar.gz"
  sha256 "beeec7f3d3558dc17f9beb21db8702194ff0f81d05ec8c0188fe95b0585da563"
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
