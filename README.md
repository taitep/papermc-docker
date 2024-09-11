# PaperMC Docker Image

This repository contains a Docker image for running a [PaperMC](https://papermc.io) Minecraft server.
The container will automatically download the latest version of Paper for the specified minecraft server on each boot.

## Usage

### Building

The docker image is built by specifying a specific Java version using a build argument, like this:

```bash
docker build --build-arg JAVA_VERSION=21 -t TAG .
```

### Running

Run the server like this:

```bash
docker run -it \
    -p 25565:25565 \
    -e MC_VERSION=1.21.1 \
    -e MEM=4G \
    -v /path/to/server/files:/server \
    -v /path/to/jar/cache:/jarcache \
    taitep/papermc:java21
```

The `/server` volume has server files, stuff like `server.properties`, `/jarcache` is where it puts server jars and can be the same between paper servers.
The `MEM` variable has the amount of memory to allocate to the server, like 4G, 2G, and stuff like that.

## License

This repository is licensed under the GNU General Public License v3.0 (GPLv3). See the [LICENSE](LICENSE) file for more details.

PaperMC is also licensed under the GPLv3. For more info see the [Paper github repo](github.com/PaperMC/Paper).
