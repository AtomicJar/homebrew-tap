cask "testcontainers-cloud-desktop" do
  version "1.3.23"
  sha256 "7fbb0a37bbe713a843e418e22ddf19a3558fa4d3638e2e34c58bfd4c951ee969"

  url "https://app.testcontainers.cloud/download/testcontainers-cloud-desktop_#{version}_darwin_universal.dmg"
  name "Testcontainers Cloud Client"
  desc "Client to connect testcontainers integration tests to Testcontainers Cloud"
  homepage "https://app.testcontainers.cloud/"
  
  app "Testcontainers Cloud Desktop.app"
  
  livecheck do
    url "https://app.testcontainers.cloud/api/versions"
    strategy :page_match do |page|
      JSON.parse(page)["latest"]
    end
  end
  
  uninstall delete: [
              "~/Library/Caches/AtomicJar"
            ],
            launchctl: [
              "testcontainers.cloud.desktop",
            ],
            quit: "com.atomicjar.cloud.desktop"
            
  zap trash: [
        "~/Library/Application Support/testcontainers.cloud.desktop",
        "~/Library/Logs/AtomicJar",
      ]
end
