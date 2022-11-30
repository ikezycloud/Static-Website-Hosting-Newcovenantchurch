#create the s3 bucket and enable static hosting
resource "aws_s3_bucket" "nccwebsitebucket" {
  bucket = var.bucketname
  acl = "public-read"
  policy = file("${path.module}/policy.json")

  website {
    index_document = "NCC.html"
  }
  tags = {
    terraform = "true"
    website_hosting = "true"
  }
}


#Upload files into the bucket
resource "aws_s3_bucket_object" "index_object" {
  bucket = var.bucketname
  key = "NCC.html"
  source = "${path.module}/html/NCC.html"
  depends_on = [
    aws_s3_bucket.nccwebsitebucket
  ]
}