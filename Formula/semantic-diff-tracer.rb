class SemanticDiffTracer < Formula
  desc "Grasp any GitHub PR fast: outcome-based perspectives with an LLM-powered story-mode debugger"
  homepage "https://github.com/amaya382/semantic-diff-tracer"
  url "https://github.com/amaya382/semantic-diff-tracer/releases/download/v0.0.1/semantic-diff-tracer-tui-0.0.1.tar.gz"
  sha256 "9b2270d1b2ac909913c5c552957961244721169916508216d22c6f60135f34f7"
  license "MIT"
  version "0.0.1"

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
