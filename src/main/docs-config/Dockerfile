#
# Stage 1: build
#
FROM antora/antora:3.1.2 AS build
LABEL maintainer="sebastian@sommerfeld.io"

RUN yarn global add @asciidoctor/core@~2.2 \
    && yarn global add asciidoctor-kroki

COPY antora-playbook.yml /antora/antora-playbook.yml

RUN mkdir -p /antora/target

WORKDIR /antora

RUN antora generate antora-playbook.yml --stacktrace --clean --fetch

#
# Stage 2: run
#
# Run webserver with the Antora pages (built in previous stage).
#
FROM httpd:2.4-alpine AS run
LABEL maintainer="sebastian@sommerfeld.io"

RUN rm /usr/local/apache2/htdocs/index.html
COPY --from=build /antora/target/open-appsec-poc/public /usr/local/apache2/htdocs
