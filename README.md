# MAC address vendor finder

This is simple script to check vendor of your network card

## How to use it

To check vendor of your network card you can simply run this script or docker container with two parameters: MAC address of your network card and api key to https://macaddress.io

```
$ ./getMacVendor.sh -k someSecretApiKey  -m '44:38:39:ff:ef:57'
"Cumulus Networks, Inc"
```
```
$ docker run --rm boscard/mac-vendor-finder -k someSecretApiKey  -m 'bc:ee:7b'
Unable to find image 'boscard/mac-vendor-finder:latest' locally
latest: Pulling from boscard/mac-vendor-finder
a4d8138d0f6b: Already exists
79d7699df150: Pull complete
d5ecdfc26c4a: Pull complete
Digest: sha256:02d0287570fcfb8c8b87c911f06d52e79afcbd7a449895f4c8f02f48c42e4e5d
Status: Downloaded newer image for boscard/mac-vendor-finder:latest
"ASUSTek Computer Inc"
```

## Requirements

Script is using `curl` and `jq` commands so you have to install them before. Also account on https://macaddress.io/ is required to recieve api key.

## Additional info

Script is using https://macaddress.io/ as data backend. See more at https://macaddress.io/

Docker image can be found on dockerhub: [boscard/mac-vendor-finder](https://hub.docker.com/r/boscard/mac-vendor-finder/)
