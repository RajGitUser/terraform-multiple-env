locals {
  common_name = "${var.project}-${var.environment}"
  common_tags = {
    Project = var.project
    Terraform = "true"
  }
}


# locals {
#     common_name = "$(var.project)-$(var.environment)"
#     common_tags = {
#         project = var.project
#         terraform = true
#     }
# }