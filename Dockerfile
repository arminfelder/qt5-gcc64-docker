FROM debian:stretch-slim

ADD qt-install.qs /

RUN apt-get update

RUN apt-get install -y \
	wget \
	curl \
	unzip \
	git \
	g++ \
	make \
	ccache \
	&& apt-get clean

# Abhängigkeiten für QT-Installer
RUN apt-get install -y \
	libgl1-mesa-glx \
	libglib2.0-0 \
	&& apt-get clean

# Abhängigkeiten für QT-Komponenten
RUN apt-get install -y \
	libfontconfig1 \
	libdbus-1-3 \
	libx11-xcb1 \
	libnss3-dev \
	libasound2-dev \
	libxcomposite1 \
	libxrandr2 \
	libxcursor-dev \
	libegl1-mesa-dev \
	libxi-dev \
	libxss-dev \
	libxtst6 \
	libgl1-mesa-dev \
	&& apt-get clean

# Abhängigkeiten für QT-Installer
RUN apt-get install -y \
	libgl1-mesa-glx \
	libglib2.0-0 \
	&& apt-get clean

# Download && Install Qt
RUN curl -LS http://download.qt.io/official_releases/qt/5.9/5.9.5/qt-opensource-linux-x64-5.9.5.run -o qt-install.run \
	&& chmod +x qt-install.run \
	&& ./qt-install.run --script qt-install.qs --platform minimal -v \
	&& rm qt-install.run

ENV PATH="/opt/Qt/5.9.5/gcc_64/bin:${PATH}"

CMD ["/bin/bash"]
