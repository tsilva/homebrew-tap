class Claudebridge < Formula
  include Language::Python::Virtualenv

  desc "Bridge OpenAI tools to Claude Code SDK"
  homepage "https://github.com/tsilva/claudebridge"
  url "https://files.pythonhosted.org/packages/ab/ce/f52bdf1f53140b24a432c6f40f40769e29a253dd48ff5b6a43a909cbbdf9/py_claudebridge-0.1.7.tar.gz"
  sha256 "aad4831bd14eae060c279900e8fa28d2d4d673a0c80d67d5c5365da8236a41e1"
  license "MIT"

  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install "py-claudebridge==#{version}"
    bin.install_symlink Dir[libexec/"bin/claudebridge"]
  end

  test do
    assert_match "claudebridge", shell_output("#{bin}/claudebridge --version")
  end
end
