

provider "aws" {
  region = "eu-west-2"
  default_tags {
    
    tags ={
        Application = "static_website"
        Owner = "ikeoluwa"
    }
  }
}

#Creating the website's module
module "staticwebsite" {
  source = "./../staticwebsite"
  bucketname = "ncc-website-bucket"
}