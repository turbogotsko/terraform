resource "aws_s3_bucket" "web-bucket" {
  bucket = "your-unique-website.com"
  tags = {
    Name = "Sergio"
    Type = "Shared"
  }
}
resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.web-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}