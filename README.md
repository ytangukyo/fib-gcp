### Fibonacci calculator with node.js running on multi-container docker on AWS elastic beanstalk. This deployment uses AWS managed database services, namely RDS (postgres) and ElastCache (Redis).

ElastiCache Redis is created with read-only replicas, meanning the endpoint should be set to its primary node.

_Note: EB AL2 can now handle docker-compose for multi-container deployment. Check the pure EB repo._