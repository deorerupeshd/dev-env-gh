FROM ubuntu:24.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Non-root user details (avoids permission issues with host-mounted files)
ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# 1. Install core system tools and common development utilities
RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    curl \
    wget \
    git \
    build-essential \
    ca-certificates \
    gnupg \
    lsb-release \
    unzip \
    tar \
    nano \
    vim \
    jq \
    htop \
    tmux \
    tree \
    openssh-client \
    bash-completion \
    python3 \
    python3-pip \
    python3-venv \
    shellcheck \
    locales \
    iputils-ping \
    net-tools \
    && locale-gen en_US.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set UTF-8 locale environment
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# 2. Setup a non-root user with passwordless sudo
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# 3. Configure user bash environment (colored prompt & history directory)
RUN mkdir -p /home/$USERNAME/commandhistory \
    && chown -R $USERNAME:$USERNAME /home/$USERNAME/commandhistory

# Set the active user and default working directory
USER $USERNAME
WORKDIR /home/$USERNAME/workspace

# Keep shell open when starting container
CMD ["/bin/bash"]

