variable "projectName" {
  default = "bluesburguer"
}

variable "regionDefault" {
  default = "us-east-1"
}

variable "vpcCIDR" {
  default = "172.31.0.0/16"
}

variable "tableName" {
  default = "NomeDaTabelaDynamoDB"
}

variable "readCapacity" {
  default = 5
}

variable "writeCapacity" {
  default = 5
}

variable "tags" {
  type = map(string)
  default = {
    App      = "bluesburguer",
    Ambiente = "Desenvolvimento"
  }
}
