cask "calmmouse" do
  version "1.4.0"
  sha256 "3f3b6cadf661e55ebd9fa70207a91c46284884b2327571b75553a4d3159a2091"

  url "https://github.com/Malik1942/CalmMouse/releases/download/v#{version}/CalmMouse.zip"
  name "CalmMouse"
  desc "Menu bar app that stops the Magic Mouse scrolling the page when you click"
  homepage "https://calmmouse.malikzhang.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "CalmMouse.app"

  uninstall quit: "com.calmmouse.app"

  # Settings live in UserDefaults.standard; launch-at-login is registered through
  # SMAppService, so its job record is removed with the app's login item.
  zap trash: [
    "~/Library/Preferences/com.calmmouse.app.plist",
    "~/Library/Caches/com.calmmouse.app",
    "~/Library/HTTPStorages/com.calmmouse.app",
  ]
end
