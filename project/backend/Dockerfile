FROM gradle:8-jdk21 AS build

ARG APP_VERSION

WORKDIR /build

COPY . .

RUN gradle assemble

WORKDIR /dist
RUN tar --strip-components 1 -xf "/build/build/distributions/backend-$APP_VERSION.tar"

FROM eclipse-temurin:21-alpine

WORKDIR /app

COPY --from=build /dist/ ./

EXPOSE 8080

ENTRYPOINT ["/app/bin/backend"]
