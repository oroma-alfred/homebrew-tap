class Phpwarden < Formula
  include Language::Python::Virtualenv

  desc "PHP vulnerability scanner ranked by real-world exploitation (CISA KEV, EPSS)"
  homepage "https://phpwarden.io"
  url "https://files.pythonhosted.org/packages/11/b4/f1e4e870221d05cbc7a844cfe2d839e54d9abfc056740140609ac428994b/phpwarden-2.1.0.tar.gz"
  sha256 "62c406a6a7545ca875a9417c027bd5dc08d6110e8c463e0788a6cf1d7839eefb"
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
