<h1 align="center">sing-box</h1>

<p align="center">The universal proxy platform.</p>

<p align="center">
    <a href="https://ghcr.io/akafeng/sing-box">Container Registry</a> ·
    <a href="https://github.com/SagerNet/sing-box">Project Source</a>
</p>

<p align="center">
    <img src="https://img.shields.io/github/actions/workflow/status/akafeng/docker-sing-box/push.yml?branch=main" />
    <img src="https://img.shields.io/github/last-commit/akafeng/docker-sing-box" />
    <img src="https://img.shields.io/github/v/release/akafeng/docker-sing-box" />
    <img src="https://img.shields.io/github/release-date/akafeng/docker-sing-box" />
</p>

---

### Pull The Image

```bash
$ docker pull ghcr.io/akafeng/sing-box
```

### Start Container

```bash
$ docker run -d \
  -v /etc/sing-box/:/etc/sing-box/ \
  --restart=always \
  --name=sing-box \
  ghcr.io/akafeng/sing-box \
  -C /etc/sing-box/ run
```
