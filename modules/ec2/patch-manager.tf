resource "aws_ssm_patch_baseline" "amazon_linux" {
  name             = "${var.environment}-amazon-linux-baseline"
  operating_system = "AMAZON_LINUX_2023"

  approval_rule {
    approve_after_days = 7

    patch_filter {
      key    = "CLASSIFICATION"
      values = ["Security"]
    }
  }
}

resource "aws_ssm_patch_group" "app" {
  baseline_id = aws_ssm_patch_baseline.amazon_linux.id
  patch_group = "app-servers"
}
