variable "projectName" {
  default = "bluesburguer"
}

variable "regionDefault" {
  default = "us-east-1"
}

variable "subnet01" {
}

variable "subnet02" {
}

variable "subnet03" {
}

variable "vpcId" {
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
  default     = "orderuser"
}

variable "rdsPass" {
  description = "Inserir senha do banco em secrets"
  default     = "orderpass"
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