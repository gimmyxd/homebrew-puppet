cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '2.0.0'
    sha256 'a5956c7d075a6219f04cda8890732bb8e31b4e10ad0096e18046531b43cfdd7d'
  when '10.12'
    os_ver = '10.12'
    version '2.0.0'
    sha256 '9d14f5106bb1c882971658ca00537fd1f1e176685f31588637eab8b95feba0d7'
  when '10.13'
    os_ver = '10.13'
    version '2.0.0'
    sha256 'ec644414592e24f685e41f696e9830958b5c2223b7d489038529520faf3d3352'
  when '10.14'
    os_ver = '10.14'
    version '2.42.0'
    sha256 '730d5ccd988f6af630383ba239a1e6fdf91b8ed4c6aba70acf84cfd0c3249302'
  else
    os_ver = '10.15'
    version '2.42.0'
    sha256 '9a949ea575623aef35b411015ebf4abc122761e3b0148fe8c76534f62c5814cb'
  end

  depends_on macos: '>= :el_capitan'
  url "https://downloads.puppet.com/mac/puppet-tools/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  bolt_bins = '/opt/puppetlabs/bolt/bin'
  caveats %Q(
    Puppet Bolt binaries are installed in #{bolt_bins}, which is sourced by an /etc/paths.d entry.
    #{bolt_bins} may not be included in your current $PATH but should be included in new shells.
  )

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
