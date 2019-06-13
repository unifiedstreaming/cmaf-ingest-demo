# DASH-IF CMAF Live ingest to Unified Streaming Live Origin Demo

This demonstration shows a [Unified Streaming](http://www.unified-streaming.com/products/unified-origin) Origin setup with a Live publishing point and uses the DASH-IF CMAF ingest reference code https://github.com/unifiedstreaming/fmp4-ingest.

The demo consists of two Docker containers which are deployed using Docker Compose.


## Setup

1. Install [Docker](http://docker.io)
2. Install [Docker Compose](http://docs.docker.com/compose/install/)
3. Download this demo's [Compose file](https://github.com/unifiedstreaming/cmaf-ingest-demo/blob/master/docker-compose.yaml)


## Build cmaf ingest image

This demonstration uses the cmaf ingest/ fmp4 ingest reference software the image for ingest the content should be build locally.

This can be done by running the following command in the directory of this demo's Compose file:

```bash
#!/bin/sh
docker-compose build cmaf-ingest-image
```

Which will create a Docker image called cmaf-ingest-image with the ingest source compiled and test files for ingest.


## Usage

You need a license key to use this software. To evaluate you can create an account at [Unified Streaming Registration](https://private.unified-streaming.com/register/).

The license key is passed to containers using the *USP_LICENSE_KEY* environment variable.

Start the stack using *docker-compose*:

```bash
#!/bin/sh
export USP_LICENSE_KEY=<your_license_key>
docker-compose up
```


You can also update the docker-compose file

```bash
-CMAF_FILES=<cmaf files to ingest>
-CMD_ARGS=<additional command line arguments, default -r (real time) and --chunked for chunked long running posts>
```

note the sample files are 1second fragment based for low latency, using short running posts and many 
streams may results in performance problems in some setups. Please use long running posts when 
using small fragment sizes.

You can also choose to run it in background (detached mode):

```bash
#!/bin/sh
export USP_LICENSE_KEY=<your_license_key>
docker-compose up -d
```



Now that the stack is running the live stream should be available in all streaming formats at the following URLs:

| Streaming Format | Playout URL |
|------------------|-------------|
| MPEG-DASH | http://localhost/test/test.isml/.mpd |
| HLS | http://localhost/test/test.isml/.m3u8 |
| Microsoft Smooth Streaming | http://localhost/test/test.isml/Manifest |
| Adobe HTTP Dynamic Streaming | http://localhost/test/test.isml/.f4m |


Watching the stream can be done using your player of choice, for example FFplay.

```bash
#!/bin/sh
ffplay http://localhost/test/test.isml/.m3u8
```

