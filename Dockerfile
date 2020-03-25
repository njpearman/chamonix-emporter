FROM ruby:2.6
LABEL maintainer="n.pearman@gmail.com"

# Produces warning that can be ignored:
#  `Warning: apt-key output should not be parsed (stdout is not a terminal)`
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add --no-tty -

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  apt-transport-https

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends \
  nodejs \
  yarn

WORKDIR /usr/src/app

COPY Gemfile* /usr/src/app/

# This sets the gem path to a mounted volume as defined in the docker-compose.yml file. This allows for a typical approach to installing and updating gems using bundle through docker-compose exec instead of a "docker build"-centric approach, which is more time consuming.
# Beware that both the web and webpack_dev_server containers use this mounted volume containing gems.
ENV BUNDLE_PATH /gems
RUN bundle install

# Install node packages within working directory
COPY yarn.lock package.json /usr/src/app/
RUN yarn install --check-files

# Move node_modules folder _outside_ of working directory.
# This is so that the host directory can be mapped on top of the working
# directory without hiding the locally installed node_modules folder.
# (Trying to install the modules directly outside the working directory
# causes other problems with `yarn check`)
# This action must be followed by symlinking this external folder back into
# the mapped host folder.
RUN mv node_modules ..

COPY . /usr/src/app/

ENTRYPOINT ["./bin/docker-entrypoint.sh"]

CMD ["bin/start_web"]
