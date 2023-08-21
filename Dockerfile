# Build image
FROM nixos/nix:latest AS build

# Set up build dir
COPY . /tmp/build
WORKDIR /tmp/build

# Run nix build
RUN nix \
    --extra-experimental-features "nix-command flakes" \
    --option filter-syscalls false \
    build

# Copy build result into nix store closure
RUN mkdir /tmp/nix-store-closure
RUN cp -R $(nix-store -qR result/) /tmp/nix-store-closure

# Runtime image
FROM scratch

WORKDIR /app

COPY --from=build /tmp/nix-store-closure /nix/store
COPY --from=build /tmp/build/result /app
CMD ["/app/bin/app"]
