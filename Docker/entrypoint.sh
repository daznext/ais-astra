#!/bin/bash

service cups start && lpadmin -p cups-pdf -v cups-pdf:/ -E -P /usr/share/ppd/cups-pdf/CUPS-PDF_noopt.ppd

# Copy and take ownership of .Xauthority
if [ -f /root/.Xauthority ]; then
    cp /root/.Xauthority /home/wineuser
    chown wineuser:wineuser /home/wineuser/.Xauthority
fi

exec gosu wineuser "$@"
