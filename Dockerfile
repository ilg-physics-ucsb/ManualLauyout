FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get upgrade -y && apt-get clean && \
    apt-get install -y \
    python3 \
    python3-pip \
    pandoc \
    nano \
    git
# RUN apt-get install -y python3
# RUN apt-get install -y python3-pip
RUN pip3 install panflute
# RUN apt-get install -y pandoc
# RUN apt-get install -y nano
# RUN apt-get install -y git
RUN useradd -rm -d /home/phys phys && groupadd -g 417 docker && usermod -aG docker phys
RUN cd /opt && git clone https://github.com/ilg-physics-ucsb/ManualLayout.git && \
    echo "export PATH=/opt/ManualLayout:$PATH" > /opt/ManualLayout/.bashrc &&\
    chmod +x /opt/ManualLayout/compile &&\
    chmod +x /opt/ManualLayout/setup &&\
    chmod +x /opt/ManualLayout/update &&\
    chown -R phys /opt/ManualLayout/.git &&\
    chown -R phys /opt/ManualLayout &&\
    chown -R .docker /opt/ManualLayout/.git &&\
    chown -R .docker /opt/ManualLayout &&\
    chmod 777 /opt/ManualLayout &&\
    chmod g+s /opt/ManualLayout
    # find /opt/ManualLayout -type d -exec chmod -R {} g+s \;
# RUN chmod +x /opt/ManualLayout/compile
WORKDIR /home/phys
USER phys
# "if [ ! -f '/home/phys/.init' ]; then \cp /opt/ManualLayout/.bashrc /home/phys/.bashrc && source /home/phys/.bashrc && touch /home/phys/.init; fi; /bin/bash"
CMD ["/bin/bash", "-c", "if [ ! -f '/home/phys/.init' ]; then yes | cp -rf /opt/ManualLayout/.bashrc /home/phys/.bashrc && source /home/phys/.bashrc && touch /home/phys/.init; fi; /bin/bash"]