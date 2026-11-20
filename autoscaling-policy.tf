resource "aws_autoscaling_policy" "wordpress_cpu_scaling" {
  name                   = "wordpress-cpu-target-tracking"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = module.auto_scaling_group.autoscaling_group_name

  estimated_instance_warmup = 300

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50.0
  }
}
