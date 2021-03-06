# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM ubuntu:bionic

ENTRYPOINT /bin/bash

# Set the locale
RUN apt-get update && apt-get install -y --no-install-recommends locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# Install dependencies
RUN apt-get update && apt-get install -y git curl autoconf bison build-essential libssl1.0-dev \
    libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev \
    make libbz2-dev libreadline-dev libsqlite3-dev wget xz-utils liblzma-dev apt-transport-https \
    ca-certificates software-properties-common
RUN apt-get -y autoclean

# Install rbenv
RUN git clone https://github.com/rbenv/rbenv.git /root/.rbenv
RUN cd /root/.rbenv && src/configure && make -C src

ENV PATH /root/.rbenv/bin:$PATH
ENV PATH /root/.rbenv/shims:$PATH

RUN echo 'eval "$(rbenv init -)"' >> /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

# Install ruby-build
RUN mkdir -p "$(rbenv root)"/plugins
RUN git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Install ruby
ENV RUBY_CONFIGURE_OPTS --disable-install-doc
RUN echo 'gem: --no-document' >> /.gemrc
RUN rbenv install 2.7.1 && rbenv global 2.7.1 \
    && gem install bundler:1.17.3 bundler:2.1.4 rake

# Install pyenv
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
RUN cd /root/.rbenv && src/configure && make -C src

ENV PATH /root/.pyenv/bin:$PATH
ENV PATH /root/.pyenv/shims:$PATH

RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> .bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> .bashrc
RUN echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

# Install python
RUN pyenv install 3.6.9
RUN pyenv global 3.6.9

# Install nodenv
RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv
RUN cd /root/.nodenv && src/configure && make -C src

ENV PATH /root/.nodenv/bin:$PATH
ENV PATH /root/.nodenv/shims:$PATH

RUN echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(nodenv init -)"' >> ~/.bashrc
RUN mkdir -p "$(nodenv root)"/plugins
RUN git clone https://github.com/nodenv/node-build.git "$(nodenv root)"/plugins/node-build

# Install nodejs
RUN nodenv install 10.16.3
RUN nodenv global 10.16.3

# Install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN apt-get update
RUN apt-get install -y docker-ce

RUN apt-get -y autoremove && apt-get -y autoclean
