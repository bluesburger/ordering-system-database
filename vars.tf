variable "projectName" {
  default = "bluesburger"
}

variable "regionDefault" {
  default = "us-east-1"
}

variable "subnet01" {
  default = "subnet-0c10fb95593b44c4d"
}

variable "subnet02" {
  default = "subnet-00eccd7ce1dd711b1"
}

variable "subnet03" {
  default = "subnet-00bc2cee69d07cd2a"
}

variable "vpcId" {
  default = "vpc-04f8876f879088e10"
}

variable "vpcCIDR" {
  default = "172.31.0.0/16"
}

variable "engineRds" {
  default = "postgres"
}

variable "engineRdsVersion" {
  default = "13.10"
}

variable "rdsUser" {
  description = "Inserir usuario do banco em secrets"
}

variable "rdsPass" {
  description = "Inserir senha do banco em secrets"
}

variable "instanceClass" {
  default = "db.t3.micro"
}

variable "storageType" {
  default = "gp3"
}

variable "minStorage" {
  default = "20"
}

variable "maxStorage" {
  default = "30"
}

variable "tags" {
  type = map(string)
  default = {
    App      = "bluesburguer",
    Ambiente = "Desenvolvimento"
  }
}