module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.2"
  bucket = "gfg-devops-20-bucket"
    #   acl = "private"

}

output "BucketID" {
    value = module.s3-bucket.s3_bucket_id
  
}
# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "5.8.1"
# }