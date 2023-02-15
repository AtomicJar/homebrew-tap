cask "testcontainers-cloud-desktop" do
  version "1.3.23"
  sha256 :no_check

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
