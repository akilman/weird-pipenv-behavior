# Overview
This repo demonstrates a weird behavior that is likely a bug in `pipenv` or some unsurfaced issue in installing the postgres binary Python drivers

# Running
```bash
docker build .
```

The expectation is the docker image builds without issue.

Instead it barfs with a stack trace about setup failing