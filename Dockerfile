FROM ruby:3.2.9-slim

# 作業ディレクトリ
WORKDIR /myapp

# 必要パッケージ
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs npm postgresql-client libyaml-dev

# Gemfileコピー & bundle install
COPY Gemfile* ./
RUN bundle install

# アプリコードコピー
COPY . .

# ポート
EXPOSE 3000

# サーバ起動
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
