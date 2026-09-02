class SemanticDiffTracer < Formula
  desc "Grasp any GitHub PR fast: outcome-based perspectives with an LLM-powered story-mode debugger"
  homepage "https://github.com/amaya382/semantic-diff-tracer"
  url "https://github.com/amaya382/semantic-diff-tracer/releases/download/0.0.3/semantic-diff-tracer-tui-0.0.3.tar.gz"
  sha256 "09a2d9b60598c4c9607adc35185527b5687edf77ef3979a283ac4192e8d4503c"
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
