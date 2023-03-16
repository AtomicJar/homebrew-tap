cask "testcontainers-cloud-desktop" do
  version "1.3.26"
  sha256 "73f591072dbaf26209cb0c1b3c9c49819ea9aa047544bdf1208071059c27800a"

  url "https://app.testcontainers.cloud/download/testcontainers-cloud-desktop_#{version}_darwin_universal.dmg",
      user_agent: "brew-cask"
  name "Testcontainers Cloud Client"
  desc "Client to connect testcontainers integration tests to Testcontainers Cloud"
  homepage "https://app.testcontainers.cloud/"

  livecheck do
    url "https://app.testcontainers.cloud/api/versions"
    strategy :page_match do |page|
      JSON.parse(page)["latest"]
    end
  end

  app "Testcontainers Cloud Desktop.app"

  postflight do
    system_command "open",
                   args: ["#{appdir}/Testcontainers Cloud Desktop.app"]
  end

  uninstall delete: [
              "~/Library/Caches/AtomicJar",
            ],
            quit:   [
              "com.atomicjar.cloud.desktop",
            ]

  zap trash:  [
        "~/Library/Application Support/testcontainers.cloud.desktop",
        "~/Library/Logs/AtomicJar",
      ],
      delete: [
        "~/Library/LaunchAgents/testcontainers.cloud.desktop.plist",
      ]
end
