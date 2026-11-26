# typed: false
# frozen_string_literal: true

# Homebrew formula for the Functory entity-authoring CLI (functory-cli-swift).
#
# This file is a TEMPLATE — placeholders (__TOKEN__) are substituted by
# generate-formula.sh, which the `publish-homebrew` job in
# .github/workflows/functory-cli-swift-release.yml runs against a release's
# SHA256SUMS manifest. Do not hand-edit the rendered Formula/functory.rb in
# the tap repo; edit this template and re-run the release instead.
#
# See tools/functory-cli-swift/homebrew/README.md for the one-time tap setup.
class Functory < Formula
  desc "CLI for authoring Functory entity configurations"
  homepage "https://functory.io"
  version "0.3.0"
  license "Apache-2.0"

  # Archives are served from the public downloads origin, not from GitHub: the
  # monorepo is private, so its release assets cannot be fetched anonymously.
  # There is no `livecheck` block because that origin has no releases API; the
  # `publish-homebrew` job writes each new version into this formula itself.
  on_macos do
    url "https://downloads.functory.com/cli/functory-cli-swift-v0.3.0/functory-macos-universal.tar.gz"
    sha256 "7b5358cabc5f3452170bd944965f7a100d70ed7bfb49d79bb0439b73913c119b"
  end

  on_linux do
    on_intel do
      url "https://downloads.functory.com/cli/functory-cli-swift-v0.3.0/functory-linux-amd64.tar.gz"
      sha256 "3ad00a20df4e1380fe0198703cc3bbd3f48e134de79fd05f71981d71487e579d"
    end

    on_arm do
      url "https://downloads.functory.com/cli/functory-cli-swift-v0.3.0/functory-linux-arm64.tar.gz"
      sha256 "238bb38707d150ec52ff083105eee4209d786cabffdbbcceeb47ccc29677a819"
    end
  end

  def install
    bin.install "functory"
  end

  test do
    assert_match "functory #{version}", shell_output("#{bin}/functory --version")
  end
end
