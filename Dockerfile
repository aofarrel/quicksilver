FROM a trusted official image

RUN apt-get update

RUN something else

RUN git clone something that makes sense to be in your container

RUN cowsay "You don't need to include your workflow file (ie, the CWL/WDL itself) into your Docker container. But if it calls any scripts, you may need to include those scripts."

RUN cowsay "By the way, Dockerhub has a limit on the number of pulls you can make per day, so if you have trouble building a container, make sure you are authenticated using your Dockerhub credentials."
