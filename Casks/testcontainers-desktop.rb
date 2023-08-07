cask "testcontainers-desktop" do
  version "1.4.5"
  sha256 "9609b02602b38eb2ad1e321dafb46c93a5221a638c1d48a39c89e587c5a1821c"

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
