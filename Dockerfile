FROM archlinux:base-devel

ENV PATH="/build-host/clang-crepuscular/bin:$PATH"

WORKDIR /build-host

# add host-user
RUN groupadd sudo && \
    useradd -g sudo -m host && \
    echo "host ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown -R host:sudo /build-host && \
    chmod g+s /build-host

COPY ./yay-bin ./yay-bin
COPY ./clang-crepuscular/ ./clang-crepuscular

# download packages
RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf && \
    sed -i '1i\Server = https:\/\/mirrors.tuna.tsinghua.edu.cn\/archlinux\/$repo\/os\/$arch' /etc/pacman.d/mirrorlist && \
    pacman -Syy && \
    pacman -S --noconfirm git curl go libxcrypt-compat lib32-libxcrypt cpio

# download picasso's kernel source
USER host
RUN (cd yay-bin && makepkg -si --noconfirm) && \
    rm -rf yay-bin && \
    yay -S --noconfirm lineageos-devel && \
    git clone https://github.com/EndCredits/kernel_xiaomi_sm7250.git --depth=1 ./sources

WORKDIR sources
