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

variable "TF_VAR_AWS_RDS_USER" {
  description = "Inserir usuario do banco em secrets"
  type        = string
  sensitive   = true
}

variable "TF_VAR_AWS_RDS_PASS" {
  description = "Inserir senha do banco em secrets"
  type        = string
  sensitive   = true
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
