FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]
RUN apt-get update && apt-get upgrade -y && apt-get clean
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install panflute
RUN useradd -rm -d /home/phys phys
USER phys
WORKDIR /home/phys
CMD ["/bin/bash"]