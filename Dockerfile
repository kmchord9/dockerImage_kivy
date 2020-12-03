FROM balenalib/raspberrypi3-debian-python:3.7.9-stretch-build

#ARG USERNAME=docker
#ARG USER_UID=1000
#ARG USER_GID=$USER_UID

# Create the user
#RUN groupadd --gid $USER_GID $USERNAME \
#    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
#    && apt-get update \
#    && apt-get install -y sudo \
#    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN apt-get update && apt-get install -y \
   gcc \
   libraspberrypi-dev \
   libraspberrypi-bin \
   libsdl2-dev \
   libsdl2-image-dev \
   libsdl2-mixer-dev \
   libsdl2-ttf-dev \
   pkg-config \
   libgl1-mesa-dev \
   libgles2-mesa-dev \
   mtdev-tools\
   python-pygame \
   python-setuptools \
   libgstreamer1.0-dev \
   git-core \
   gstreamer1.0-plugins-base \
   gstreamer1.0-plugins-good \
   gstreamer1.0-plugins-bad \
   gstreamer1.0-plugins-ugly \
   gstreamer1.0-alsa \
   gstreamer1.0-omx \
   libfreetype6-dev\
   i2c-tools \
   libi2c-dev \
   python-pil \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV TZ Asia/Tokyo

#matplotlib Dependencies
RUN python -m pip install wheel 

RUN pip install \
 matplotlib==3.1.3 \
 pillow \
 smbus2 \
 numpy \
 Cython==0.29.9

RUN pip install \
 https://codeload.github.com/kivy/kivy/zip/1.11.1


# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.
#USER $USERNAME

WORKDIR /home/$USERNAME
COPY code/ .

#CMD ["bash"]

CMD ["python", "sample_GUI.py"]
