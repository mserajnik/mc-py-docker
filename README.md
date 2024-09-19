# mc-py-docker [![GitHub Actions status][actions-status-badge]][actions-status]

> A dockerized script for sending commands to ZTE MC routers

This repository provides a Docker image for the
[`mc.py` script](https://github.com/Kajkac/ZTE-MC-Home-assistant-repo/blob/b938e88878251d3ca4b95b76e6d15ede26637f78/custom_components/zte_router/mc.py) that is part of the
[ZTE Router Integration for Home Assistant](https://github.com/Kajkac/ZTE-MC-Home-assistant-repo)
but can also be used standalone.

I don't use Home Assistant but needed a way to easily perform actions like
reconnects without using the router's web UI; however, I couldn't find any
other projects that provide a CLI API. Dockerizing the script makes it portable
and it becomes easy to run via SSH or other means (like a webhook).

## Usage

```sh
docker run --rm --network host ghcr.io/mserajnik/mc-py-docker mc-py 192.168.254.1 foo 1 ""
```

- `192.168.254.1` is the router IP
- `foo` is the password
- `1` is the command to execute; see [here](https://github.com/Kajkac/ZTE-MC-Home-assistant-repo/blob/b938e88878251d3ca4b95b76e6d15ede26637f78/custom_components/zte_router/mc.py#L425-L495)
  for the available commands
- `""` is the username; in case of a single user system (which should be the
  default on most routers), this has to be an empty string so the script does
  not error

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
