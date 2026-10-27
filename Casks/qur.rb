cask "qur" do
  version "0.1.8"
  sha256 "49f9b460fadea8e33786d6f003c2ed9acc2ec3b644d9781d6f4df0ebf89bfb44"

  url "https://github.com/PEUR-Technologies/Qur/releases/download/v#{version}/Qur.zip"
  name "Qur"
  desc "Lightweight agentic code editor"
  homepage "https://github.com/PEUR-Technologies/Qur"

  depends_on macos: :ventura

  app "Qur.app"

  # Qur isn't notarized yet: trust it so Gatekeeper doesn't block the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Qur.app"],
                          writable_paths: ["Qur.app"], writable_base: :appdir
  end

  zap trash: [
    "~/Library/Application Support/Qur",
    "~/Library/Logs/Qur",
  ]
end
