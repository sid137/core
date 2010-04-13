
#!/bin/bash
apt-get remove --purge flashplugin-installer
apt-get remove --purge flashplugin-nonfree gnash gnash-common mozilla-plugin-gnash 
apt-get remove --purge iceweasel-flashplugin mozilla-flashplugin firefox-flashplugin 
apt-get remove --purge swfdec-mozilla libflashsupport nspluginwrapper iceape-flashplugin 
apt-get remove --purge xulrunner-flashplugin midbrowser-flashplugin xulrunner-addons-flashplugin
rm -f ~/.mozilla/plugins/*flash*
rm -f /usr/lib/firefox-addons/plugins/*flash*
rm -f /usr/lib/firefox/plugins/*flash*
rm -f /usr/lib/iceape/plugins/flashplugin-alternative.so
rm -f /usr/lib/iceweasel/plugins/flashplugin-alternative.so
rm -f /usr/lib/iceweasel/plugins/npwrapper.libflashplayer.so
rm -f /usr/lib/midbrowser/plugins/flashplugin-alternative.so
rm -f /usr/lib/mozilla/plugins/*flash*
rm -f /usr/lib/xulrunner-addons/plugins/flashplugin-alternative.so
rm -f /usr/lib/xulrunner/plugins/flashplugin-alternative.so
rm -f /var/lib/flashplugin-nonfree/npwrapper.libflashplayer.so
