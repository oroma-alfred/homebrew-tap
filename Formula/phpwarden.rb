# Homebrew formula for phpwarden. Lives in a tap (github.com/oroma-alfred/homebrew-tap,
# file Formula/phpwarden.rb), because homebrew-core requires a project to be notable first.
#   brew tap oroma-alfred/tap && brew install phpwarden
class Phpwarden < Formula
  include Language::Python::Virtualenv

  desc "PHP vulnerability scanner ranked by real-world exploitation (CISA KEV, EPSS)"
  homepage "https://phpwarden.io"
  url "https://files.pythonhosted.org/packages/57/78/f8b5922955eb303aa2f13cb7485620d7e247caa3767e87dfd1b4c41ba04f/phpwarden-2.5.2.tar.gz"
  sha256 "66bc7a8500010d212f62e71eb492b280cd7ed7694da8276ba93b9af352d0173f"
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
