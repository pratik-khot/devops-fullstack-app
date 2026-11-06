terraform {

  cloud {

    organization = "aws-tf-org-pk"

    workspaces {
      name = "myapp-dev"
    }
  }
}
