#!/usr/bin/env sh

browser=$(xdg-settings get default-web-browser)
if [[ "$browser" == "url-handler.desktop" ]]; then
    echo "You have installed this program yet, if your browser is not firefox, you should probably go to /usr/share/applications/url-handler.desktop and set: 'Browser=<your browser>.desktop'"
    echo "If your browser is firefox then no further action is needed."
else
    echo "Detected browser: $browser"
    echo $browser >> src/url-handler.desktop
fi

echo "Installing..."
sudo make install