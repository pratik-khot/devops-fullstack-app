terraform {

  cloud {

    organization = " "

    workspaces {
      name = "myapp-dev"
    }
  }
}
