# Terraform Jenkins Pipeline

This repository contains a Jenkins pipeline for managing infrastructure using Terraform. The pipeline is designed to create, update, and destroy an AWS EC2 instance based on the Terraform configuration in this repository.

### Prerequisites

Before running the Jenkins pipeline, make sure you have the following prerequisites:

- Jenkins installed and configured
- AWS credentials configured in Jenkins as `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
- Jenkins pipeline plugins for Git and AWS

### Terraform Configuration

#### Main Terraform Files

- [main.tf](main.tf): Defines the AWS provider and an EC2 instance resource.
- [variables.tf](variables.tf): Defines variables used in the Terraform configuration.
- [outputs.tf](outputs.tf): Defines outputs for the created EC2 instance.

#### Terraform Variables

- [terraform.tfvars](terraform.tfvars): Specifies values for Terraform variables.

### Jenkins Pipeline Stages

1. **Prepare Workspace**: Creates a directory for Terraform scripts.

2. **Checkout**: Clones the Terraform configuration repository.

3. **Validate**: Validates the Terraform configuration.

4. **Plan**: Initializes Terraform, validates, creates a plan, and saves it to a file.

5. **Approval**: Waits for manual approval before applying the Terraform plan.

6. **Apply**: Applies the Terraform plan to create or update the infrastructure.

7. **Destroy**: Destroys the infrastructure (optional, requires manual confirmation).

### Running the Pipeline

1. Configure Jenkins with AWS credentials.

2. Navigate to the Jenkins dashboard and create a new item.

3. Specify the item name, choose the pipeline option, and click "OK."

3. In the General section, add a description, then go to the Advanced options.

4. Under the Pipeline section, select "Pipeline script from SCM," choose SCM as "Git," and fill in the repository URL and Branches (*/main) to build.

5. Provide the script path (scripts/jenkinsfile) and click Save.

6. Trigger a build by clicking "Build Now." The build is now scheduled.

7. Monitor the build progress in the stage view, and check for any errors in case of issues.

## Terraform Variables

Adjust the values in [terraform.tfvars](terraform.tfvars) to customize the EC2 instance creation.

### terraform.tfvars
ami_id             = "ami-0e731c8a588258d0d"
instance_type      = "t2.micro"
instance_name      = "My_second_instance"

### Outputs

After the successful execution of the pipeline, you can find information about the created EC2 instance in the Jenkins console or use Terraform outputs.

1. Public IP: instance_public_ip
2. Private IP: instance_private_ip
3. Instance ID: instance_id