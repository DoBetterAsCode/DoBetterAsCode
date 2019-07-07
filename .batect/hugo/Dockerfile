FROM alpine:3.7 as build

RUN apk --update add curl

ENV HUGO_VERSION 0.55.6
ENV HUGO_DL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz
RUN curl -fsSL ${HUGO_DL} | tar xvz -C /usr/local/bin

# FROM scratch
# COPY --from=build /usr/local/bin/hugo /hugo
EXPOSE 1313
ENV HUGO_BASE_URL http://localhost:1313
ENTRYPOINT ["/bin/sh"]