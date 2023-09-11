# Azure-Kubernetes-Application

In this project, I've successfully deployed an AKS Kubernetes cluster leveraging Terraform. The entire deployment process is automated using GitHub Actions, ensuring smooth and consistent rollouts. Prioritizing security, I've seamlessly integrated Defender for DevOps and Snyk into the CI/CD pipeline, ensuring that the infrastructure-as-code (IaC) is scanned for any potential vulnerabilities. The cluster is equipped with a dedicated load balancer, enhancing performance and reliability. Moreover, I've achieved a custom domain mapping for the cluster using Azure DNS Zone, utilizing a domain sourced from GoDaddy. This project encapsulates a vision of secure, efficient, and automated Kubernetes deployments, all while maintaining transparency through robust monitoring.


## Application Breakdown

The application is broken down into the architecture below:

![aks](https://github.com/rjones18/Images/blob/main/Kubernetes%20Azure.png)
