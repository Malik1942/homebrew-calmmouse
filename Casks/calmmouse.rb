cask "calmmouse" do
  version "1.4.1"
  sha256 "b6a76e52f6a196a7bb174ed8ebb3d15df94fd0435f9b8800a12af0b9e233abb5"

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
