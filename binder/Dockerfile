FROM python:3.9
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
# Set a password for the jovyan user (default Binder user is often 'jovyan' or 'root')
RUN echo 'jovyan:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
