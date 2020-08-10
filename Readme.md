# Debug docker container

Contains a lot of debugging tools for production. Based on alpine.

* Build/code: `build-base git go bash bash-completion ncurses vim tmux jq`
* Network: `bind-tools iputils tcpdump curl nmap tcpflow iftop net-tools mtr netcat-openbsd bridge-utils iperf ngrep openldap-clients`
* Certificates: `ca-certificates openssl`
* Processes/IO: `htop atop strace iotop dstat sysstat ltrace ncdu logrotate hdparm pciutils psmisc tree pv`

## Build and test
Use make targets for building, pushing and testing

### Builds the local Docker container for development
    make build
### Push Docker image to docker.io
    make push
### Test docker image locally
    make test
### Local cleanup
    make clean
	
## Attach to an existing container

```
docker run --rm -ti --net container:<container-id> aaneci/debug
```

## Use tmux inside tmux

Just double press `<ctrl>+b` to use the inner tmux