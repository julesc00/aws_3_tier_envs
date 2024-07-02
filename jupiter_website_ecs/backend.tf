

terraform {
  backend "s3" {
    bucket  = "julio-terraform-remote-state"
    key     = "jupiter-website-ecs.tfstate"
    region  = "us-east-1"
    profile = "terraform-user"
  }
}