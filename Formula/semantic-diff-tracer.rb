class SemanticDiffTracer < Formula
  desc "Grasp any GitHub PR fast: outcome-based perspectives with an LLM-powered story-mode debugger"
  homepage "https://github.com/amaya382/semantic-diff-tracer"
  url "https://github.com/amaya382/semantic-diff-tracer/releases/download/0.0.2/semantic-diff-tracer-tui-0.0.2.tar.gz"
  sha256 "453a0c4da2a79c9a40723ce6ce96f14e99c839c7c97147dc526ebbf2ed2094b3"
  license "MIT"
  version "0.0.2"

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
