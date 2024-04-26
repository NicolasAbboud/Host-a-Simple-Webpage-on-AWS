# Host a Simple Webpage on AWS

This repository contains the files for hosting a simple static webpage using Amazon Web Services (AWS).

## Description
The project demonstrates a straightforward approach to deploying a simple static website on AWS, utilizing the services S3 for hosting and CloudFront for content delivery, with Terraform employed as the Infrastructure as Code (IaC) tool to automate the setup.

## Architecture 

![diagram](https://github.com/NicolasAbboud/host-a-simple-webpage-on-AWS/assets/143742395/2d511ad5-49e5-41ed-92e1-50760d7aa58e)

## Prerequisites

Before you begin, ensure you have the following prerequisites in place:

- An **AWS account** with the necessary permissions to create and manage S3 buckets and CloudFront distributions.
- **Terraform** installed on your local machine. You can download it from [here](https://developer.hashicorp.com/terraform/install).

## Quick Start

To get your static website up and running quickly, follow these steps:

1. **Fork this repository** to your own GitHub account.
2. **Clone the repository** to your local machine using the following command:
   ````bash
   git clone https://github.com/yourusername/host-a-simple-webpage-on-AWS.git
   ````
3. **Navigate to the cloned directory** and open the Terraform configuration files to review and configure the settings. Don't forget to update the S3 bucket name (it must be globally unique)!
4. **Upload your website content** to the web-files folder.
5. **Initialize Terraform** to download the necessary providers:
   ````bash
   terraform init
   ````
6. **Review the Terraform plan** to confirm the actions expected by Terraform match your intentions:
   ````bash
   terraform plan
   ````
7. **Apply the Terraform configuration** to create the infrastructure:
   ````bash
   terraform apply
   ````
8. **Access your website** using the CloudFront distribution URL provided by Terraform output.

## Cleanup

To remove all the resources created by Terraform, run the following command:
  ````bash
   terraform destroy
   ````

## License

This project is licensed under the MIT License - see the `LICENSE` file for details.

## Thank you!


