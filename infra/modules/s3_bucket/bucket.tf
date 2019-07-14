resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}"
  acl    = "public-read"

  website {
    index_document = "index.html"
  }

  policy = "${data.template_file.policy.rendered}"
}

data "template_file" "policy" {
  template = "${file("${path.module}/policy.json")}"

  vars = {
    bucket_name = "${var.bucket_name}"
  }
}
