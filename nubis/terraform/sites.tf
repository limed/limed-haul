module "limed-haul" {
  source = "sites"

  region       = "${var.region}"
  environment  = "${var.environment}"
  account      = "${var.account}"
  service_name = "${var.service_name}"
  role         = "${module.worker.role}"

  site_name     = "limed-haul"
  site_index    = "index.htm"
  haul_git_repo = "https://github.com/limed/limed-haul"
}
