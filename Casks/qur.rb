cask "qur" do
  version "0.1.10"
  sha256 "3c54e55aa6f349512215f41c810d1b705f5f703fbf40c769bd2d4dd7303fbc77"

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
