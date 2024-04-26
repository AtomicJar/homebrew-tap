cask "testcontainers-desktop" do
  version "1.11.0"
  sha256 "7358fc6ca5065a7af86c8f702afa6fd40f0f8df7671b1689f310e49067cc1989"

  url "https://app.testcontainers.cloud/download/testcontainers-desktop_#{version}_darwin_universal.dmg",
      user_agent: "brew-cask"
  name "Testcontainers Desktop"
  desc "Tescontainers desktop application for local testing and development"
  homepage "https://app.testcontainers.cloud/"

  livecheck do
    url "https://app.testcontainers.cloud/api/versions"
    strategy :page_match do |page|
      JSON.parse(page)["latest"]
    end
  end

  auto_updates true
  conflicts_with cask: "testcontainers-cloud-desktop"

  app "Testcontainers Desktop.app"

  postflight do
    system_command "open",
                   args: ["#{appdir}/Testcontainers Desktop.app"]
  end

  uninstall quit:   "com.atomicjar.desktop",
            delete: [
              "~/Library/Caches/AtomicJar/testcontainers.cloud.desktop/agent.lock",
              "~/Library/Caches/AtomicJar/testcontainers.cloud.desktop/tcc-notification.png",
            ]

  zap delete: "~/Library/LaunchAgents/testcontainers.desktop.plist",
      trash:  [
        "~/.config/testcontainers/cloud.properties",
        "~/.config/testcontainers/services",
        "~/Library/Caches/AtomicJar",
        "~/Library/Logs/AtomicJar",
      ]
end
