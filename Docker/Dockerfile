FROM i386/ubuntu:18.04

RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections \
    && export DEBIAN_FRONTEND="noninteractive" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    cabextract \
    gosu \
    gpg-agent \
    p7zip \
    pulseaudio-utils \
    software-properties-common \
    unzip \
    wget \
    winbind \
    zenity \
    apt-utils \
    locales \
    cups-pdf \
    nano \
    libxm4 \
    libusb-0.1-4 \
    ttf-mscorefonts-installer \
    && rm -rf /var/lib/apt/lists/*

RUN localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG ru_RU.utf8
RUN service cups start && lpadmin -p cups-pdf -v cups-pdf:/ -E -P /usr/share/ppd/cups-pdf/CUPS-PDF_noopt.ppd 

RUN wget https://dl.winehq.org/wine-builds/winehq.key \
    && apt-key add winehq.key \
    && apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ \
    && add-apt-repository -y ppa:cybermax-dexter/sdl2-backport \
    && apt install -y --install-recommends winehq-stable \ 
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/share/wine/mono /usr/share/wine/gecko \
    && wget https://dl.winehq.org/wine/wine-mono/4.9.4/wine-mono-4.9.4.msi \
    -O /usr/share/wine/mono/wine-mono-4.9.4.msi \
    && wget https://dl.winehq.org/wine/wine-gecko/2.47.1/wine-gecko-2.47.1-x86.msi \
    -O /usr/share/wine/gecko/wine-gecko-2.47.1-x86.msi 

RUN wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
    -O /usr/bin/winetricks \
    && chmod +rx /usr/bin/winetricks

RUN groupadd -g 1010 wineuser \
    && useradd --shell /bin/bash --uid 1010 --gid 1010 --create-home --home-dir /home/wineuser wineuser \
    && chown -R wineuser:wineuser /home/wineuser && echo "export PATH=$PATH:/opt/cprocsp/bin/ia32" >> /home/wineuser/.bashrc

COPY crypto-pro-x86 /tmp/cp
COPY libcapihelper10.so /usr/lib
COPY libcapi20.dll.so /opt/wine-stable/lib/wine/
COPY 1bc5db0e.000.zip /tmp

RUN cd /tmp/cp && bash ./install.sh && dpkg -i ./cprocsp-rdr-gui_4.0.9963-5_i386.deb && cd /tmp && unzip 1bc5db0e.000.zip && \
    cp -r 1bc5db0e.000 /var/opt/cprocsp/keys/wineuser/ && \
    mkdir -p /var/opt/cprocsp/keys/wineuser/ && chown -R wineuser:wineuser /var/opt/cprocsp/keys/wineuser && \
    rm -rf /tmp/cp

COPY entrypoint.sh /usr/bin/entrypoint

WORKDIR /home/wineuser

ENTRYPOINT ["/usr/bin/entrypoint"]

CMD ["/bin/bash"]
