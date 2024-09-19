FROM python:3.12-alpine

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV \
  USER_ID=$USER_ID \
  GROUP_ID=$GROUP_ID

WORKDIR /opt

# Pinned to commit b938e88878251d3ca4b95b76e6d15ede26637f78 in case of breaking
# changes
ADD https://raw.githubusercontent.com/Kajkac/ZTE-MC-Home-assistant-repo/b938e88878251d3ca4b95b76e6d15ede26637f78/custom_components/zte_router/mc.py /opt/mc.py

RUN \
  pip install \
    requests~=2.32.3 && \
  rm -r ~/.cache && \
  chown -R ${USER_ID}:${GROUP_ID} /opt

COPY docker-cmd-mc-py.sh /usr/local/bin/mc-py
RUN chmod +x /usr/local/bin/mc-py

USER ${USER_ID}:${GROUP_ID}

CMD ["mc-py"]
