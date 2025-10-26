resource "aws_instance" "terraform" {
  ami                    = var.ami_id
  instance_type          = lookup(var.instance_type, terraform.workspace)
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name}-workspace"
    }
  )
}

resource "aws_security_group" "allow_all" {
  name = "${local.common_name}-workspace"


  egress {
    from_port        = var.engress_from_port            ## allowing all posrts from starting
    to_port          = var.engress_to_port            ## allowing all ports to the ending
    protocol         = var.protocol                            ## means all protocols
    cidr_blocks      = var.cidr                         # internet notation
  }

  ingress {
    from_port        = var.ingress_from_port             ## allowing all posrts from starting
    to_port          = var.ingress_to_port              ## allowing all ports to the ending
    protocol         = var.protocol                             ## means all protocols
    cidr_blocks      = var.cidr                           # internet notation
  }

  tags = merge (
    local.common_tags,
    {
      Name = "${local.common_name}-workspace"
    }
  )
}

### ----------------------------------------------------------

### The above variables we declared in variables folders, terraform will access to it and implement

### -----------------------------------------------------------
