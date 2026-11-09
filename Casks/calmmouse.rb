cask "calmmouse" do
  version "1.1.1"
  sha256 "d62dabf69b81f8ab99be3da2932f539d494d8e1ed64f08c0f9a25a409d28e754"

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
