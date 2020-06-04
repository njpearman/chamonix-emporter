# Chamonix takeaway app

See what restaurants in the Chamnonix valley are providing takeaway and delivery services: [https://takeaway.chamgeeks.com](https://takeaway.chamgeeks.com)

We built this basic web site / web app so that people had one place to find information about restaurants that are providing takeaway and delivery services in Chamonix valley during the COVID-19 lockdown and beyond.
It was built as a hobby project and is both rough around the edges and over-engineered for what it is doing.
We like the choices because we're comfortable with them, or using this as an opportunity to learn.

## Development

Make changes to the code as needed on your local machine. Running the server for development is best done with docker, although this makes rails commands longer to type, e.g. `docker-compose exec web bin/rails db:migrate db:seed` instead of `bin/rails db:migrate`.

### Docker (preferred)
Use docker and do `docker-compose up` to run the dev server and webpack dev server in separate containers.
The following environment variables need to be included in `.env/development/web`:

```
GOOGLE_MAPS_KEY=
```

The docker set up allows you to use `bin/bundle install` in the same way as in a non-docker set up.
This is achieved with the `gem_cache` mounted volume to store installed gem.

### Plain old local
Alternatively, run locally as a "Rails with webpacker" app. To set up the app for development:

```bash
bin/bundle install
bin/rails db:setup
yarn install --check-files
```

Then run `rails server` and `bin/webpack-dev-server` in separate terminal windows.

## Production deploy

Do a build for production: `docker build -f Dockerfile.prod -t houches/chamonix-takeaway:prod .`

Push the build to docker hub: `docker push houches/chamonix-takeaway:prod`

Configure production environment variables. The following environment variables need to be set and completed in `.env/production/web`:

```
PORT=<set if a port other than 3000 should be used to serve the app>
RAILS_ENV=production
SECRET_KEY_BASE=
RAILS_LOG_TO_STDOUT=true
RAILS_SERVE_STATIC_FILES=true
GOOGLE_MAPS_KEY=
```

Then deploy.
Deploying requires the default SSH key (`id_rsa`) to be the one used to log in to the remote host, as older versions of `docker-compose` do not know how to use `.ssh/config`.
It is also necessary to add your remote user to the `docker` group in order to have permissions to interact with the docker socket used by the docker daemon.

It is necessary to change the port number in docker-stack.yml if the server is already running a container bound to port 3000.

To deploy:

1. `export DOCKER_HOST='ssh://<username>@206.189.228.95'`
2. `COMPOSE_FILE=docker-stack.yml docker-compose down`
3. `COMPOSE_FILE=docker-stack.yml docker-compose pull`
4. `COMPOSE_FILE=docker-stack.yml docker-compose up -d`
