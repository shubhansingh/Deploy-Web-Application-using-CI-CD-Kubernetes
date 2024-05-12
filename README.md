# Deploy-Web-Application-using-CI-CD-Kubernetes

1. Setting up CI/CD Pipeline:
   
### Tools:

- Jenkins for CI/CD pipeline orchestration.
- npm for frontend build and test scripts.
  
### Steps:

- Set up Jenkins server.
- Install necessary plugins (e.g., Git plugin, Pipeline plugin).
- Configure Jenkins credentials for accessing the Git repository and container registry.
- Create a Jenkins pipeline script : CICD/pipeline_script.sh
- Pull the source code from the Git repository.
- Build and test the frontend using npm test and npm build.
- Build Docker images for the frontend and backend.
- Push the Docker images to a container registry.
- Deploy the application to Kubernetes.

2. Kubernetes Deployment:

### Tools:

- Kubernetes for container orchestration.

### Steps:

- Set up a Kubernetes cluster (Using terraform we do it).
- Create Kubernetes deployment manifests for the frontend and backend services. (./Kubernetes/)
- Create Kubernetes service manifests to expose the frontend and backend services. (./Kubernetes/)
- Apply the manifests to the Kubernetes cluster to deploy the application. (./Kubernetes/)

3. Infrastructure as Code (IAC):

### Tools:

 - Terraform for provisioning infrastructure.

### Steps:

- Write Terraform scripts to provision the Kubernetes cluster infrastructure (nodes, networking, etc.). (./terraform/)
- Create the EKS Role Policy file. (Terrafom/policies/eks-role-policy.json)
- Initialize Terraform and apply the scripts to provision the infrastructure.

4. Logging and Monitoring:

### Tools:

- Prometheus for monitoring. (./Monitoring/helm-steps)
- ELK Stack for logging.

### Steps of Logging:  

- Create a Fluentd Configuration (./Logging/fluentd.conf)
- Containerize Fluentd (./Logging/Dockerfile)
- Deploy Fluentd as a Sidecar (./Logging/Sidecar-deployment.yaml)
