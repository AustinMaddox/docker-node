FROM node:6-alpine

RUN apk add --no-cache \
    bash \
    g++ \
    gcc \
    git \
    libpng \
    libpng-dev \
    make \
    python

# Install Bower and Gulp.
RUN npm install -g \
    bower \
    gulp \
    && chmod -R 755 /usr/local/lib/node_modules

# Define working directory.
WORKDIR /data

# Install dumb-init.
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
    dumb-init

# Runs "/usr/bin/dumb-init -- /my/script --with --args"
ENTRYPOINT ["/usr/bin/dumb-init", "--"]

# Define default command.
CMD ["bash"]
