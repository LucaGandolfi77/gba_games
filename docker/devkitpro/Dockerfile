FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates curl gnupg lsb-release make git build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY ../../install-devkitpro-pacman.sh /tmp/install-devkitpro-pacman.sh
RUN chmod +x /tmp/install-devkitpro-pacman.sh \
    && /tmp/install-devkitpro-pacman.sh

# Ensure devkitPro tools are in PATH
ENV PATH="/opt/devkitpro/tools/bin:/opt/devkitpro/devkitARM/bin:${PATH}"

# Install the toolchain and libgba non-interactively
RUN dkp-pacman -S --noconfirm devkitARM libgba

WORKDIR /workspaces/gba_games

CMD ["/bin/bash"]
