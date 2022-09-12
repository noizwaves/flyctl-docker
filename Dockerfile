FROM alpine as build
RUN apk add curl
RUN curl -L -o flyctl.tar.gz https://github.com/superfly/flyctl/releases/download/v0.0.388/flyctl_0.0.388_Linux_x86_64.tar.gz \
  && tar -zxf flyctl.tar.gz \
  && install flyctl /usr/bin/ \
  && rm flyctl.tar.gz

FROM alpine
COPY --from=build /usr/bin/flyctl /usr/bin/
