cask "testcontainers-desktop" do
  version "1.6.0"
  sha256 "83980b243ef36681b9e551f0182f30e8dccc2a41aad9546af3ae8e4a55934578"

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

  uninstall delete: [
              "~/Library/Caches/AtomicJar/testcontainers.cloud.desktop/agent.lock",
              "~/Library/Caches/AtomicJar/testcontainers.cloud.desktop/tcc-notification.png",
            ],
            quit:   [
              "com.atomicjar.desktop",
            ]

  zap trash:  [
        "~/.config/testcontainers/services",
        "~/.config/testcontainers/cloud.properties",
        "~/Library/Caches/AtomicJar",
        "~/Library/Logs/AtomicJar",
      ],
      delete: [
        "~/Library/LaunchAgents/testcontainers.desktop.plist",
      ]
end
