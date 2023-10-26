cask "testcontainers-desktop" do
  version "1.5.0"
  sha256 "a9e056b866eca20ff58969427f019bb9195dd0d05f99d652b0f473cf78e61d85"

  url "https://app.testcontainers.cloud/download/testcontainers-desktop_#{version}_darwin_universal.dmg",
      user_agent: "brew-cask"
  name "Testcontainers Desktop"
  desc "Tescontainers desktop application for local testing and development"
  homepage "https://app.testcontainers.cloud/"

  conflicts_with cask: "testcontainers-cloud-desktop"

  livecheck do
    url "https://app.testcontainers.cloud/api/versions"
    strategy :page_match do |page|
      JSON.parse(page)["latest"]
    end
  end

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
