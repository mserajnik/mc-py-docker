FROM python:3.12-alpine

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV \
  USER_ID=$USER_ID \
  GROUP_ID=$GROUP_ID

WORKDIR /opt

# Pinned to commit d359fae92f14a740356e958d0932742143e8f760 in case of breaking
# changes
ADD https://raw.githubusercontent.com/Kajkac/ZTE-MC-Home-assistant-repo/d359fae92f14a740356e958d0932742143e8f760/custom_components/zte_router/mc.py /opt/mc.py

RUN \
  pip install \
    cryptography~=43.0.1 \
    urllib3~=2.2.3 && \
  rm -r ~/.cache && \
  chown -R ${USER_ID}:${GROUP_ID} /opt

COPY docker-cmd-mc-py.sh /usr/local/bin/mc-py
RUN chmod +x /usr/local/bin/mc-py

USER ${USER_ID}:${GROUP_ID}

CMD ["mc-py"]
