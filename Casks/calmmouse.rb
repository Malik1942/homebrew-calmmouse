cask "calmmouse" do
  version "1.0.0"
  sha256 "3fc1406df526ced001e20772cc8bdf6a6d3cd65f8006f3fe02c0915713b8a393"

  url "https://github.com/Malik1942/CalmMouse/releases/download/v#{version}/CalmMouse.zip",
      verified: "github.com/Malik1942/CalmMouse/"
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
