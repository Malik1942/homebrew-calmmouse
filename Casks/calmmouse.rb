cask "calmmouse" do
  version "1.1.3"
  sha256 "2bf9f7c951f029e2dceafc3b7601410db33b86598a78e862bf65d9876bbbb424"

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
