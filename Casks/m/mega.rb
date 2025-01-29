cask "mega" do
  version "12.0.7"
  sha256 "97fdf1668c19dee0e2ef2da81a9d5ce2ea0748c59834645569028972f9a08ccd"

  url "https://megasoftware.net/do_force_download/MEGA_#{version}_installer.pkg"
  name "MEGA"
  name "Molecular Evolutionary Genetics Analysis"
  desc "Molecular evolution statistical analysis and construction of phylogenetic trees"
  homepage "https://megasoftware.net/"

  livecheck do
    url "https://megasoftware.net/history"
    regex(/MEGA\s\d+\sversion\s(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :high_sierra"

  pkg "MEGA_#{version}_installer.pkg"

  uninstall quit:    "com.company.MEGA#{version.major}",
            pkgutil: "com.igem.pkg.MEGA#{version.major}",
            delete:  [
              "/Applications/MEGA#{version.major}.app",
              "/usr/local/bin/megacc",
              "/usr/local/share/man/man1/mega.1",
              "/usr/local/share/man/man1/megacc.1",
            ]

  zap trash: [
    "~/Library/Preferences/com.company.MEGA*",
    "~/Library/Saved Application State/com.company.MEGA*",
  ]
end
