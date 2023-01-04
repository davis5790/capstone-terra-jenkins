# Fullstack Academy Devops Capstone

Group capstone project consisting of a flask app that allows users to enter their location and recieve back current weather info.

The app is containerized in Docker and the container image is stored on AWS Elastic Container Registry and launched and maintained using AWS Fargate and AWS Elastic Container Service.

The infrastructure was built using Terraform. The seperate parts of the infrastructure are broken up into modules and developers are able to set the CPU/Memory of our containers and the upper limits of our application load balancer as well as several other parameters in the main.tf file.
