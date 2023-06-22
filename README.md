# Daugherty Labs Skeleton project

Created as a template for other teams and users to create their own SPA piece that connects with Daugherty Labs utilities. 

## Deployment configuration

This project contains template for frontend deployment. It's based on `terraform` which deploys to `AWS`.

### Generated artifacts

Most important artifacts generated out of deployment are:

- `s3` bucket - Storage used to store static files from `build` folder
- `CloudFront` - Server exposing the static files
- `Route 53` - Exposes the server to Daugherty Labs domain

### Terraform configuration

The configuration consist of the following files:

- `envs/` - Contains package for each environment. Every package consist of:
    - `backend.tfvars` - Variables used to initialize `terraform` for storing state data in `s3` bucket
    - `terraform.tfvars` - Default input variables to `terraform` configuration
- `acm.tf` - Certification for the DNS
- `backend.tf` - `terraform` initialization instructions
- `cdn.tf` - Amazon CloudFront serving the static files
- `context.tf` - Shared tags added to each created resource
- `dependencies.tf` - Definition of data retrieved from already existing AWS configuration and reused in `terraform` configuration files
- `locals.tf` - Definition of local variables reused through the `terraform` configuration
- `outputs.tf` - Definition of outputs available after executing `terraform`
- `s3.tf` - Exporting `build` folder containing static frontend files to `s3` bucket served by CloudFront
- `variables.tf` - Definition of input variables
- `waf.tf` - Firewall for the CloudFront

### Usage instruction

First, go through this documentation to educate yourself about Terraform and complete setup to be able to use it.

`https://daugherty.atlassian.net/wiki/spaces/PERI/pages/3391062269/Technical+Onboarding`

Modify `terraform.tfvars`, `backend.tfvars` and `context.tf` to include details about your project, using the appropriate Daugherty Labs naming conventions (see below).

For any variables that you add to `variables.tf` that have defaults that will change per project, add the defaults to the `terraform.tfvars` file in the appropriate environment. 

To start the deployment process, the following commands need to be executed:

- `terraform init -backend-config="envs/dev/backend.tfvars"`
- `terraform plan -var-file="envs/dev/terraform.tfvars"`
- `terraform apply -var-file="envs/dev/terraform.tfvars"`

When you run plan, please check that the plan will create the expected resources. Also ensure that the resources in your terraform plan follow Daugherty Labs naming conventions.

When you execute `apply`, terraform will inform you that everything was provisioned successfully.

If you need to destroy what you've deployed for any reason, execute this command:

- `terraform destroy -var-file="./envs/dev/dev.tfvars"`

- Next, confirm that an appropriately configured S3 Bucket and Cloudfront distribution was created in the AWS console. This should be in `us-east-1`
- Click on the Custom SSL certificate link in console for Cloudfront - this will take you to information about that certificate, which contains the domain name configured using Terraform.
- Save the domain name.
- Execute `npm run build` in you React frontend.
- Add build files and other directories generated in the build folder in the S3 bucket you created. Do not just upload the build folder.
- Confirm that the domain you provisioned appears as you expect, and not a blank page.

## Daugherty Labs naming conventions for Terraform

This document describes the naming structure for resources created in DBS cloud environments. This hierarchy should be provider agnostic, applied as closely as possible to each cloud environment (AWS, Azure, Google, etc).

- `Management Container Names` - Groupings for applying common policies across a set of resources. Resource types in this category are: 
`AWS` - Organization Units, Accounts 
`Azure` - Tenant, Management Groups, Subscriptions, Resource Groups 
`GCP` - Cloud Account Organization, Folders, Projects 
Format: `{org}-{cp}-{parent-name}-{name}` - 

- `IAM Names`
Roles, groups and policies in Identity and Access Management services. 
Format: `{org}-{cp}-{AD_GROUP}-{name}`

- `All other resource names:`
Different types of resources can share the same name if they are logically related. Multiple instances of the same type can be differentiated with an optional attributes part. 
Format: `{org}-{cp}-{namespace}-{stage}-{name}-{attributes}?` 

- `Name Parts`

`org` – Defines the organization responsible for the resource. Valid entries include: 
`dbs` - Daugherty Business Solutions (CORP) 
`dl` - Daugherty Labs (Consulting) 
`cp` – Define the cloud provider hosting the resource. Valid entries include: 
`dc` - Data Center 
`aws` - Amazon Web Services 
`az` - Microsoft Azure 
`gcp` - Google Cloud Platform 
`oci` - Oracle Cloud Infrastructure 
`ibm` - IBM Cloud 
`do` - Digital Ocean 
`vul` - Vultr 
`ali` - Alibaba Cloud 
`cv` - Civo 
`parent-name` - name (less org-cp) of one level up 
`AD_GROUP` - associated Active Directory group 
`namespace` - one level up, group name plus optional additional differentiation 
`stage` – Defines the deployment environment of the resource 
`name` – The unique name of the resource within that particular hierarchy level and resource type 
`attributes` – Elements to distinguish individual instances of the same type and purpose with an instance number or special purpose name

## ESLINT configuration

√ How would you like to use ESLint? · style       
√ What type of modules does your project use? · esm
√ Which framework does your project use? · react
√ Does your project use TypeScript? · No / Yes
√ Where does your code run? · browser
√ How would you like to define a style for your project? · guide
√ Which style guide do you want to follow? · airbnb      
√ What format do you want your config file to be in? · JavaScript

## Setting up OIDC (OpenID) authentication

The project currently uses [react-oidc-context](https://github.com/authts/react-oidc-context) as its a lightweight client for OIDC connection in react. (From the research I've done). The Github page has instructions on how to set this up and gives an example of it implemented.

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.
