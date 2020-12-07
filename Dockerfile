FROM ruby:2.6.5 

#パッケージの取得
RUN apt-get update && apt-get install -y build-essential libpq-dev
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mariadb-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs


RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# +# Fix: 'Cannot find module 'node-sass'
RUN yarn add node-sass

RUN mkdir /habiter
WORKDIR /habiter

COPY Gemfile /habiter/Gemfile
COPY Gemfile.lock /habiter/Gemfile.lock

RUN gem install bundler
RUN bundle install

#既存railsプロジェクトをコンテナ内にコピー
COPY . /habiter