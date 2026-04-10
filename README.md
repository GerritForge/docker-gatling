### Docker-Gatling

The aim of this project is to provide a set of docker images with Gatling pre-installed.
These docker images could be used to run Gatling tests within docker.

This is an attempt at reviving a now seemingly defunct project hosted at [denvazh/gatling](https://github.com/denvazh/gatling).

### Installation

Get automated build from public registry:

Latest version:

`docker pull gerritforge/gatling:latest`

All versions:

`docker pull gerritforge/gatling`

Specific version:

`docker pull gerritforge/gatling:3.9.5`

Alternatively Build an image from Dockerfile: `docker build -t="gerritforge/gatling" .`

### Usage

Use image to run container

`docker run -it --rm gerritforge/gatling`

Mount configuration and simulation files from the host machine and run Gatling specifying
the simulation class (e.g. `my.company.simulation.SimulationClass`) and the associated
JVM options (e.g. `-Xms8g -Xmx8g`):

```
docker run -it --rm -v /home/core/gatling/conf:/opt/gatling/conf \
-v /home/core/gatling/user-files:/opt/gatling/user-files \
-v /home/core/gatling/results:/opt/gatling/results \
gerritforge/gatling --run-mode local -s my.company.simulation.SimulationClass --extra-run-jvm-options "-Xms8g -Xmx8g"
```
Note the `--run-mode local` which tells gatling to run the test in local mode, for more information
regarding this please refer to [Gatling docs](https://gatling.io/docs/gatling/reference/current/core/configuration/#cli-options).
Use the -e switch to use JAVA_OPTS to pass parameters to Gatling tests

`docker run -e JAVA_OPTS="-Dusers=10" -it --rm gerritforge/gatling`
