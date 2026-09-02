class SemanticDiffTracer < Formula
  desc "Grasp any GitHub PR fast: outcome-based perspectives with an LLM-powered story-mode debugger"
  homepage "https://github.com/amaya382/semantic-diff-tracer"
  url "https://github.com/amaya382/semantic-diff-tracer/releases/download/0.0.3/semantic-diff-tracer-tui-0.0.3.tar.gz"
  sha256 "5910be18aadaeeb7da6e9297b5aab6c015818a134f24accc6a95c22f4b3795a1"
  license "MIT"
  version "0.0.3"

  depends_on "node"

  def install
    libexec.install "semantic-diff-tracer.mjs"
    (bin/"semantic-diff-tracer").write <<~EOS
      #!/bin/bash
      exec "$(brew --prefix node)/bin/node" "#{libexec}/semantic-diff-tracer.mjs" "$@"
    EOS
    chmod 0755, bin/"semantic-diff-tracer"
    bin.install_symlink "semantic-diff-tracer" => "sdt"
  end

  test do
    assert_match "semantic-diff-tracer TUI", shell_output("#{bin}/semantic-diff-tracer --help")
  end
end
