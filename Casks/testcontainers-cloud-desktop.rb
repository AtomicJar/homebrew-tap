cask "testcontainers-cloud-desktop" do
  version "1.3.32"
  sha256 "42206895cf9d391bf0b083e8b03954fc36b62c4a7e6ce4a32ebe77b7ccf18780"

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
