provider "aws" {
  version = "~> 2.13.0"

  region = "ap-southeast-2"
}

provider "aws" {
  alias   = "us-east-1"
  version = "~> 2.13.0"

  region = "us-east-1"
}
