FROM ruby:2.5

RUN gem install bundler
COPY Gemfile Gemfile
RUN bundle install

RUN apt-get update && \
    apt-get install -y zip sudo

ENV TF_VERSION 0.11.14
RUN curl -L https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip && \
    chmod +x terraform && \
    mv terraform /usr/bin/terraform && \
    apt-get remove -y zip && \
    rm -f terraform.zip

ENV TFLINT_VERSION 0.9.0
RUN curl https://raw.githubusercontent.com/wata727/tflint/v${TFLINT_VERSION}/install_linux.sh | bash