## EasyEDA Router - Docker

[EasyEDA](https://easyeda.com/) is a free web-based circuit design tool. Its experience is frontend-heavy; however, the automatic trace routing features rely on backend service calls, whose performance and availability are dependent on the load at any given time.

This allows you to build a Docker image that runs the routing service locally, and thus allows EasyEDA, running in a local web browser, to find your routing service.

While building this Docker image, a version of the EasyEDA routing server will be downloaded from the [EasyEDA Open Documents GitHub](https://github.com/dillonHe/EasyEDA-Documents), and thus this repository contains no proprietary code.

### Usage

With Docker and Docker Compose installed, this can be run on most Unix-like hosts by executing in a shell:

    make && make run

Now, when you enter the Auto Router, the setup screen should indicate that the `Local` routing service is available.

### License

Any code pertaining to this repository is distributed under the MIT License. Neither this repository nor its maintainer has any affiliation with the EasyEDA product or site.