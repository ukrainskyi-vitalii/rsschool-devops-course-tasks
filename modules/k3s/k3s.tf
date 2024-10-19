resource "aws_instance" "k3s_master" {
  ami             = var.ami_id
  instance_type   = "t2.small"
  subnet_id       = var.private_subnet_id_1
  key_name        = var.ssh_key_name
  security_groups = [aws_security_group.k3s_sg.id]

  tags = {
    Name = "k3s-master"
  }
}

resource "aws_instance" "k3s_worker" {
  count           = var.worker_count
  ami             = var.ami_id
  instance_type   = "t2.small"
  subnet_id       = var.private_subnet_id_2
  key_name        = var.ssh_key_name
  security_groups = [aws_security_group.k3s_sg.id]

  tags = {
    Name = "k3s-worker-${count.index}"
  }
}

output "master_private_ip" {
  value = aws_instance.k3s_master.private_ip
}

output "worker_private_ips" {
  value = aws_instance.k3s_worker[*].private_ip
}
