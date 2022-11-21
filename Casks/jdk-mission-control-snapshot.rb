cask "jdk-mission-control-snapshot" do
  version :latest
  sha256 :no_check

  url 'https://github.com/adoptium/jmc-build/releases/download/9.0.0-SNAPSHOT/org.openjdk.jmc-9.0.0-SNAPSHOT-macosx.cocoa.x86_64.tar.gz'
  name "JDK Mission Control"
  desc "Tools to manage, monitor, profile and troubleshoot Java applications"
  homepage 'https://adoptopenjdk.net/jmc.html'

  conflicts_with cask: "jdk-mission-control"

  app 'JDK Mission Control.app'

  preflight do
    system_command "xattr",
                   args: ["-c", "-r", "#{staged_path}/JDK\ Mission\ Control.app"]
  end

  caveats do
    depends_on_java "11"
  end
end
