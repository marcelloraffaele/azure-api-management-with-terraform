# azure-api-management-with-terraform
This project is a configuration model of Azure API Management with Terraform.

I wanted to create a model to explain how can be managed an Azure API Management from different sides.
First the `Infracture Administrator` side that creates the Azure API Management instance. Once the instance is created, few changed are made.
Second the `API Administrator` that creates Products and Policies. Policies are **general purpose policies** and **reusable fragments** that can be assigned to Products or to API .
Last the `Developer` that can create API and Operation adding policies to them.


