resource "aws_lb" "nlb" {
  name               = "${var.project_name}-nlb-${var.environment}"
  internal           = false
  load_balancer_type = "network"
  subnets            = aws_subnet.public[*].id

  enable_cross_zone_load_balancing = true

  tags = {
    Name        = "${var.project_name}-nlb"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_lb_target_group" "nlb_tg" {
  name     = "${var.project_name}-tg-${var.environment}"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.main.id

  health_check {
    protocol = "TCP"
    # Adjust this port to match your Ingress Controller's NodePort or Health Port
    port     = "traffic-port" 
  }

  tags = {
    Project = var.project_name
  }
}

resource "aws_lb_listener" "nlb_listener" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}

# Attach the EKS Node Group ASG to the Target Group
resource "aws_autoscaling_attachment" "eks_asg_attachment" {
  autoscaling_group_name = aws_eks_node_group.main.resources[0].autoscaling_groups[0].name
  lb_target_group_arn    = aws_lb_target_group.nlb_tg.arn
}
