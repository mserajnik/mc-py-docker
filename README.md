# mc-py-docker [![GitHub Actions status][actions-status-badge]][actions-status]

> A dockerized script for sending commands to ZTE MC routers

This repository provides a Docker image for the
[`mc.py` script](https://github.com/Kajkac/ZTE-MC-Home-assistant-repo/blob/d359fae92f14a740356e958d0932742143e8f760/custom_components/zte_router/mc.py) that is part of the
[ZTE Router Integration for Home Assistant](https://github.com/Kajkac/ZTE-MC-Home-assistant-repo)
but can also be used standalone.

I don't use Home Assistant but needed a way to easily perform actions like
reconnects without using the router's web UI; however, I couldn't find any
other projects that provide a CLI API. Dockerizing the script makes it portable
and it becomes easy to run via SSH or other means (like a webhook).

## Usage

```sh
docker run --rm --network host ghcr.io/mserajnik/mc-py-docker mc-py IP PASSWORD COMMAND [USERNAME] [PHONE_NUMBER] [MESSAGE]
```

- `IP` is the router's IP (e.g., `192.168.254.1`)
- `PASSWORD` is the password for the router's web UI
- `COMMAND` is the command to execute; see
  [here](https://github.com/Kajkac/ZTE-MC-Home-assistant-repo/blob/d359fae92f14a740356e958d0932742143e8f760/custom_components/zte_router/mc.py#L784-L855)
  for the available commands
- `USERNAME` is the username for the router's web UI (optional; by default,
  there is only a single user and this is not required)
- `PHONE_NUMBER` is the phone number to send the `MESSAGE` to as SMS (only
  required when using command `8` to send an SMS)
- `MESSAGE` is the message to send as SMS to the `PHONE_NUMBER` (only required
  when using command `8` to send an SMS)

E.g., to fetch router information (command `1`):

```sh
docker run --rm --network host ghcr.io/mserajnik/mc-py-docker mc-py 192.168.254.1 secretPassword 1
```

## Maintainer

[Michael Serajnik][maintainer]

## Contribute

You are welcome to help out!

[Open an issue][issues] or [make a pull request][pull-requests].

## License

[AGPL-3.0-or-later](LICENSE) © Michael Serajnik

[actions-status]: https://github.com/mserajnik/mc-py-docker/actions
[actions-status-badge]: https://github.com/mserajnik/mc-py-docker/actions/workflows/build-docker-images.yaml/badge.svg
[issues]: https://github.com/mserajnik/mc-py-docker/issues
[maintainer]: https://github.com/mserajnik
[pull-requests]: https://github.com/mserajnik/mc-py-docker/pulls
