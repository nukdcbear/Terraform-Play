variable "app" {
  description = "Name of the application, used in prefixes"
}

variable "environment" {
  description = "Name of the environment, should match live repo folder name"
}

variable "owner" {
  description = "Team name who's responsible for management"
}

variable "files_dir" {
    description = "Where the files live"
}

variable "module_dir" {
    description = "Where the module lives"
}

locals {
    kv_name = "${var.app}-${var.environment}-${replace(var.owner," ", "-")}-kv"

    kv_short_name = "${var.owner == "Binford Tools" ? "${var.app}-${var.environment}-kv" : length("${var.app}-${var.environment}-${replace(var.owner," ", "-")}-kv") > 24 ? "${substr(var.app, 0, min(length(var.app), 7))}-${var.environment}-${substr("${replace(var.owner," ", "-")}", 0 , min(length("${replace(var.environment," ", "-")}"), 7))}-kv" : "${var.app}-${var.environment}-${replace(var.owner," ", "-")}-kv"}"

    kv_name_len = "${length(local.kv_name)}"

    kv_short_name_len = "${length(local.kv_short_name)}"

    module_cwd = "${path.cwd}"
}


output "kv_name" {
  description = "Key vault name"
  value       = "${local.kv_name}"
}

output "kv_name_len" {
  description = "Key vault name length"
  value       = "${local.kv_name_len}"
}


output "kv_short_name" {
  description = "Key vault short name"
  value       = "${local.kv_short_name}"
}

output "kv_short_name_len" {
  description = "Key vault short name length"
  value       = "${local.kv_short_name_len}"
}

output "files_dir" {
  description = "Where the files live"
  value       = "${var.files_dir}"
}

output "module_dir" {
  description = "Where the module lives"
  value       = "${var.module_dir}"
}

output "module_cwd" {
  description = "What the module cwd"
  value       = "${local.module_cwd}"
}