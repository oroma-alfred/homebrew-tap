# Homebrew formula for phpwarden. Lives in a tap (github.com/oroma-alfred/homebrew-tap,
# file Formula/phpwarden.rb), because homebrew-core requires a project to be notable first.
#   brew tap oroma-alfred/tap && brew install phpwarden
class Phpwarden < Formula
  include Language::Python::Virtualenv

  desc "PHP vulnerability scanner ranked by real-world exploitation (CISA KEV, EPSS)"
  homepage "https://phpwarden.io"
  url "https://files.pythonhosted.org/packages/54/21/ba0f81b3b1657a91f96787756bc0f4f59b2fd06e3f6af565c6722ee4cb6d/phpwarden-2.2.0.tar.gz"
  sha256 "098265e3d0c473f1467ece855d96c9fea88ff42bd5d0a4a37ffca0015af15daa"
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
