# Create an S3 bucket to host the static website content
resource "aws_s3_bucket" "website_bucket" {
  bucket = "my-website-bucket-1352525"

  # Configure the bucket for static website hosting
  website {
    index_document = "index.html"
  }

  tags = var.tags
}

# Configure public access settings for the S3 bucket
resource "aws_s3_bucket_public_access_block" "website_bucket_public_access" {
  bucket = aws_s3_bucket.website_bucket.id

  # Allow public access since this is a public website
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Attach a bucket policy to allow public read access to objects
resource "aws_s3_bucket_policy" "website_policy" {
  depends_on = [aws_s3_bucket_public_access_block.website_bucket_public_access]
  bucket     = aws_s3_bucket.website_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.website_bucket.arn}/*"
      },
    ]
  })
}

# Upload the index.html file to the S3 bucket
resource "aws_s3_bucket_object" "website_files" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "./resume/index.html"
}
