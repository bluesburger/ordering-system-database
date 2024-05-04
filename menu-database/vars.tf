variable "projectName" {
  default = "bluesburguer"
}

variable "regionDefault" {
  default = "us-east-1"
}

variable "vpcCIDR" {
  default = "172.31.0.0/16"
}

variable "engineRds" {
  default = "mysql"
}

variable "engineRdsVersion" {
  default = "8.0.36"
}

variable "rdsUser" {
  type      = string
  sensitive = true
}

variable "rdsPass" {
  type      = string
  sensitive = true
}

variable "instanceClass" {
  default = "db.t3.micro"
}

variable "storageType" {
  default = "gp3"
}

variable "minStorage" {
  default = "15"
}

variable "maxStorage" {
  default = "20"
}

variable "tags" {
  type = map(string)
  default = {
    App      = "bluesburguer",
    Ambiente = "Desenvolvimento"
  }
}
