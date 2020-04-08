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
RUN useradd -rm -d /home/phys phys
RUN cd /opt && git clone https://github.com/ilg-physics-ucsb/ManualLayout.git && \
    chmod +x /opt/ManualLayout/compile &&\
    chmod +x /opt/ManualLayout/setup &&\
    echo "export PATH=/opt/ManualLayout:$PATH" > /opt/ManualLayout/.bashrc
# RUN chmod +x /opt/ManualLayout/compile
WORKDIR /home/phys
USER phys
CMD ["/bin/bash" , "if [ ! -f '.init' ]; then cp /opt/ManualLayout/.bashrc .bashrc && source .bashrc && touch .init; fi"]