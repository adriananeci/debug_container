[![GitHub Super-Linter](https://github.com/adriananeci/debug_container/workflows/CI/badge.svg)](https://github.com/adriananeci/debug_container/actions?query=workflow%3ACI)

# Debug docker container

Contains a lot of debugging tools for production. Based on golang:alpine.

* Build/code: `build-base git bash bash-completion ncurses vim tmux jq`
* Network: `bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools mtr netcat-openbsd bridge-utils iperf ngrep openldap-clients dnstrace`
* Certificates: `ca-certificates openssl`
* Processes/IO: `htop atop strace iotop dstat sysstat ltrace ncdu logrotate hdparm pciutils psmisc tree pv`

## Build and test

Use make targets for building, pushing and testing

### Builds the local Docker container for development

```bash
make build
```
  
### Push Docker image to docker.io

```bash
make push
```

### Test docker image locally

```bash
make test
```

### Local cleanup

```bash
make clean
```

## DNS benchmark

use `dnstrace` which has auto-complete and for available options see `https://github.com/redsift/dnstrace`

example:

```bash
dnstrace -n 10 -c 10 --server 8.8.8.8 --recurse redsift.io
```

## Attach to an existing container

```bash
docker run --rm -ti --net container:<container-id> aaneci/debug
```

## Use tmux inside tmux

Just double press `<ctrl>+b` to use the inner tmux
