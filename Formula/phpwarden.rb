# Homebrew formula for phpwarden. Lives in a tap (github.com/oroma-alfred/homebrew-tap,
# file Formula/phpwarden.rb), because homebrew-core requires a project to be notable first.
#   brew tap oroma-alfred/tap && brew install phpwarden
class Phpwarden < Formula
  include Language::Python::Virtualenv

  desc "PHP vulnerability scanner ranked by real-world exploitation (CISA KEV, EPSS)"
  homepage "https://phpwarden.io"
  url "https://files.pythonhosted.org/packages/c0/63/46110be6451aed8d33fb8969acc03a9f8f5e03112628b19c0ae3e8f8e4c9/phpwarden-2.5.1.tar.gz"
  sha256 "dc4970d62b3ded54c087c2e4f8a2faccffac4ac405f69baef894975c8dec3ed9"
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
