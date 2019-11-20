# Use the newest emacs version from silex as base
FROM silex/emacs
COPY ["emacs.el", "/root/.emacs.el"]
COPY ["Cask", "/root/.emacs.d/Cask"]
ENV PATH="/root/.cask/bin:$PATH"
RUN apt-get update; apt-get install -y python git; rm -rf /var/lib/apt/lists/*; \
  git config --global user.email "mulenatic@gmail.com"; git config --global user.name "Thomas Kaczmarek"; \
  curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python; \
  cd /root/.emacs.d; cask install
