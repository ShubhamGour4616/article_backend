FROM ruby:3.0.0-alpine

# Set the working directory inside the container
WORKDIR /app

# Update and install system dependencies
RUN apk update && apk add --no-cache build-base postgresql-dev tzdata

COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install 

COPY . .

EXPOSE 3000

# Start the Rails API server
CMD ["sh", "-c", "bin/rails db:migrate && bin/rails server -b 0.0.0.0"]


