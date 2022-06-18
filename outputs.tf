output "output" {
  description = "VPC and subnet attributes"
  value       = {
    vpc                                   = aws_vpc.this
    vpc_secondary_cidr_blocks             = aws_vpc_ipv4_cidr_block_association.this.*.cidr_block
    private_subnet_ids                    = aws_subnet.private.*.id
    private_subnet_arns                   = aws_subnet.private.*.arn
    private_route_table_ids               = aws_route_table.private.*.id
    private_subnets_cidr_blocks           = aws_subnet.private.*.cidr_block
    private_subnets_ipv6_cidr_blocks      = aws_subnet.private.*.ipv6_cidr_block
    public_subnet_ids                     = aws_subnet.public.*.id
    public_subnet_arns                    = aws_subnet.public.*.arn
    public_subnets_cidr_blocks            = aws_subnet.public.*.cidr_block
    public_subnets_ipv6_cidr_blocks       = aws_subnet.public.*.ipv6_cidr_block
    public_route_table_ids                = aws_route_table.public.*.id
    public_internet_gateway_route_id      = try(aws_route.public_internet_gateway[0].id, null)
    public_internet_gateway_ipv6_route_id = try(aws_route.public_internet_gateway_ipv6[0].id, null)
    database_subnet_ids                   = aws_subnet.database.*.id
    database_subnet_arns                  = aws_subnet.database.*.arn
    database_subnet_group                 = try(aws_db_subnet_group.database[0].id, null)
    database_subnet_group_name            = try(aws_db_subnet_group.database[0].name, null)
    database_route_table_ids              = length(aws_route_table.database.*.id) > 0 ? aws_route_table.database.*.id : aws_route_table.private.*.id
    database_subnets_cidr_blocks          = aws_subnet.database.*.cidr_block
    database_subnets_ipv6_cidr_blocks     = aws_subnet.database.*.ipv6_cidr_block
    redshift_subnet_ids                   = aws_subnet.redshift.*.id
    redshift_subnet_arns                  = aws_subnet.redshift.*.arn
    redshift_subnet_group                 = try(aws_redshift_subnet_group.redshift[0].id, null)
    redshift_subnet_group_name            = try(aws_redshift_subnet_group.redshift[0].name, null)
    redshift_route_table_ids              = length(aws_route_table.redshift.*.id) > 0 ? aws_route_table.redshift.*.id : (var.enable_public_redshift ? aws_route_table.public.*.id : aws_route_table.private.*.id)
    redshift_subnets_cidr_blocks          = aws_subnet.redshift.*.cidr_block
    redshift_subnets_ipv6_cidr_blocks     = aws_subnet.redshift.*.ipv6_cidr_block
    elasticache_subnet_ids                = aws_subnet.elasticache.*.id
    elasticache_subnet_arns               = aws_subnet.elasticache.*.arn
    elasticache_subnet_group              = try(aws_elasticache_subnet_group.elasticache[0].id, null)
    elasticache_subnet_group_name         = try(aws_elasticache_subnet_group.elasticache[0].name, null)
    elasticache_route_table_ids           = length(aws_route_table.elasticache.*.id) > 0 ? aws_route_table.elasticache.*.id : aws_route_table.private.*.id
    elasticache_subnets_cidr_blocks       = aws_subnet.elasticache.*.cidr_block
    elasticache_subnets_ipv6_cidr_blocks  = aws_subnet.elasticache.*.ipv6_cidr_block
    intra_subnet_ids                      = aws_subnet.intra.*.id
    intra_subnet_arns                     = aws_subnet.intra.*.arn
    intra_route_table_ids                 = aws_route_table.intra.*.id
    intra_subnets_cidr_blocks             = aws_subnet.intra.*.cidr_block
    intra_subnets_ipv6_cidr_blocks        = aws_subnet.intra.*.ipv6_cidr_block
  }
}