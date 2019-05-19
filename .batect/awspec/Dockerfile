FROM ruby:2.5

RUN gem install bundler
COPY Gemfile Gemfile
RUN bundle install

ENV TF_VERSION 0.11.14
RUN apt-get update && \
    apt-get install -y zip && \
    curl -L https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip && \
    chmod +x terraform && \
    mv terraform /usr/bin/terraform && \
    apt-get remove -y zip && \
    rm -f terraform.zip