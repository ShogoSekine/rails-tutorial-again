FROM ruby:3.3-slim

# Railsチュートリアルに必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    sqlite3 \
    libsqlite3-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Node.js と Yarn のインストール（Railsのアセットパイプライン等で必要になる場合があるため）
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && corepack enable

# 作業ディレクトリの設定
WORKDIR /workspace

# Railsのインストール
RUN gem install rails -v 7.2.0

EXPOSE 3000

CMD ["bash"]