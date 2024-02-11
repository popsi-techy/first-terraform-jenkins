.PHONY: all prepare checkout validate plan approval apply destroy

all: prepare checkout validate plan approval apply

prepare:
	@echo "Preparing Workspace..."
	@mkdir -p terraform

checkout:
	@echo "Checking out Terraform repository..."
	@cd terraform && git clone https://github.com/popsi-techy/first-terraform-jenkins.git

validate:
	@echo "Validating Terraform configuration..."
	@cd terraform && terraform validate

plan:
	@echo "Planning Terraform deployment..."
	@cd terraform && terraform init && terraform plan -out tfplan && terraform show -no-color tfplan > tfplan.txt

approval:
	@echo "Waiting for approval..."
	@cd terraform && terraform init
	@echo "Review the plan in terraform/tfplan.txt"
	@read -p "Do you want to apply this plan? (yes/no): " answer; \
	if [ "$$answer" != "yes" ]; then \
		echo "Plan not approved. Aborting."; \
		exit 1; \
	fi

apply:
	@echo "Applying Terraform changes..."
	@cd terraform && terraform apply -input=false tfplan

destroy:
	@echo "Destroying Terraform infrastructure..."
	@cd terraform && terraform init
	@read -p "Are you sure you want to destroy the infrastructure? (yes/no): " answer; \
	if [ "$$answer" = "yes" ]; then \
		cd terraform && terraform destroy; \
		else \
		echo "Infrastructure destruction aborted by the user."; \
	fi

clean:
	@echo "Cleaning up..."
	@rm -rf terraform

