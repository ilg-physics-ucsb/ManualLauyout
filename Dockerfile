FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get upgrade -y && apt-get clean
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install panflute
RUN apt-get install -y pandoc
RUN apt-get install -y nano
RUN apt-get install -y git
RUN useradd -rm -d /home/phys phys
RUN cd /home/phys && git clone https://github.com/ilg-physics-ucsb/ManualLayout.git
RUN cp /home/phys/ManualLayout/compile /usr/bin
USER phys
WORKDIR /home/phys
CMD ["/bin/bash"]