variable "project_name" {
  description = "Nome do projeto. Por exemplo, 'bluesburguer'."
  default     = "blues-burger"
  type        = string
}

variable "project_name_dynamo" {
  description = "Nome do projeto. Por exemplo, 'bluesburguer'."
  default     = "payment"
  type        = string
}

variable "project_name_menu" {
  description = "Nome do projeto. Por exemplo, 'bluesburguer'."
  default     = "blues-burger-menu"
  type        = string
}

variable "project_name_order" {
  description = "Nome do projeto. Por exemplo, 'bluesburguer'."
  default     = "blues-burger-order"
  type        = string
}
variable "db_name" {
  description = "Nome do RDS. Por exemplo, 'mydb'."
  default     = "dbbluesburger"
  type        = string
}

variable "db_name_menu" {
  description = "Nome do RDS. Por exemplo, 'mydb'."
  default     = "dbbluesburgermenu"
  type        = string
}

variable "region_default" {
  description = "Região padrão onde os recursos serão provisionados. Por exemplo, 'us-east-1'."
  default     = "us-east-1"
  type        = string
}

variable "engine_rds" {
  description = "Motor de banco de dados para o RDS. Por exemplo, 'mysql'."
  default     = "mysql"
  type        = string
}

variable "engine_rds_version" {
  description = "Versão do motor de banco de dados RDS. Por exemplo, '8.0.36'."
  default     = "8.0.36"
  type        = string
}

variable "rds_user" {
  description = "Nome de usuário para acessar o RDS. Este valor é sensível."
  type        = string
  sensitive   = true
  default     = "root" # TODO - retirar hardcoded
}

variable "rds_pass" {
  description = "Senha para acessar o RDS. Este valor é sensível."
  type        = string
  sensitive   = true
  default     = "Root2024" # TODO - retirar hardcoded
}

variable "instance_class" {
  description = "Classe de instância para o RDS. Por exemplo, 'db.t3.micro'."
  default     = "db.t3.micro"
  type        = string
}

variable "storage_type" {
  description = "Tipo de armazenamento para o RDS. Por exemplo, 'gp3'."
  default     = "gp3"
  type        = string
}

variable "min_storage" {
  description = "Armazenamento mínimo para o RDS, em GB. Por exemplo, '20'."
  default     = "30"
  type        = string
}

variable "max_storage" {
  description = "Armazenamento máximo para o RDS, em GB. Por exemplo, '30'."
  default     = "60"
  type        = string
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

variable "backup_window" {
  description = "Horário definido para o backup do RDS, em GB. Por exemplo, '00:00-00:30'."
  default     = "00:00-00:30"
  type        = string
}

variable "tags" {
  description = "Tags a serem aplicadas aos recursos. Por exemplo, {'App' = 'bluesburguer', 'Ambiente' = 'Desenvolvimento'}."
  type        = map(string)

  default = {
    App      = "bluesburguer",
    Ambiente = "Desenvolvimento"
  }
}
