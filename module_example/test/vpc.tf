module "vpc" {
  source = "../dev/"
  vpc_cidr = "125.136.0.0/16"
  subnet_cidr = "125.136.1.0/16"
}
