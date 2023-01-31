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

Before use modify `terraform.tfvars` and `context.tf` to include details about your project.

To start the deployment process, the following commands needs to be executed:
- `terraform init -backend-config="envs/dev/backend.tfvars"`
- `terraform plan -var-file="envs/dev/terraform.tfvars" -out=.tfplan`
- `terraform apply ".tfplan"`
- `CLOUDFRONT_ID="$(terraform output -raw cf_id)"`
- `aws cloudfront create-invalidation --distribution-id ${CLOUDFRONT_ID} --paths "/*"`

Make sure to include last command, as it forces `CloudFront` to remove old static webpage from cache and load the new one.

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
