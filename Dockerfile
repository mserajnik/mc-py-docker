# mc-py-docker
# Copyright (C) 2024-2026  Michael Serajnik  https://github.com/mserajnik

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM python:3.13-alpine

ARG USER_ID=1000
ARG GROUP_ID=1000

ENV \
  USER_ID=$USER_ID \
  GROUP_ID=$GROUP_ID

WORKDIR /opt

# Pinned to commit d359fae92f14a740356e958d0932742143e8f760 in case of breaking
# changes
ADD https://raw.githubusercontent.com/Kajkac/ZTE-MC-Home-assistant-repo/d359fae92f14a740356e958d0932742143e8f760/custom_components/zte_router/mc.py /opt/mc.py

COPY docker-cmd-mc-py.sh /usr/local/bin/mc-py

RUN \
  pip install --no-cache-dir \
    cryptography~=43.0.3 \
    urllib3~=2.2.3 && \
  chown -R ${USER_ID}:${GROUP_ID} /opt && \
  chmod +x /usr/local/bin/mc-py

USER ${USER_ID}:${GROUP_ID}

CMD ["mc-py"]
