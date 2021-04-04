# Docker file build

## Requirements

You need will need Docker installed and running and an internet connection.
Will need to install below packages.

```
npm init --y
npm install express
```
You can verify locally that you app is running properly by running below command.

```
node index.js
```
You should see your app at http://localhost:3000/

# Clone the this repo and run terraform apply.
You will see output in command line for ALB DNS like below.
![image](https://user-images.githubusercontent.com/6733678/113501519-418c6700-9543-11eb-8905-538681e36a70.png)

But your app will not work still since ecr task will require the image and we need to be push it to ECR.
below are the steps to create the docker image and push to ECR.

You can check the 


## Apply the above terraform
```
terraform init
terraform apply
```

## Check the AWS ECR service it should show newly created repository.

1. Retrieve an authentication token and authenticate your Docker client to your registry and click View push command.

![image](https://user-images.githubusercontent.com/6733678/113501010-ff155b00-953f-11eb-82e9-f0e34f0e4138.png)

Use the AWS CLI:
```
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin xxxxxxxxxx.dkr.ecr.eu-west-2.amazonaws.com

```
2. Build your Docker image using the following command. For information on building a Docker file from scratch see the instructions here . You can skip this step if your image is already built:
```
docker build -t sample-ecr-repo .
```
3. After the build completes, tag your image so you can push the image to this repository:
```
docker tag sample-ecr-repo:latest xxxxxxxxxx.dkr.ecr.eu-west-2.amazonaws.com/sample-ecr-repo:latest
```

4. Run the following command to push this image to your newly created AWS repository:
```
docker push xxxxxxxxxx.dkr.ecr.eu-west-2.amazonaws.com/sample-ecr-repo:latest
```

Once you have run these commands, you should see your pushed image in your repository:


```
provider "aws" {
  region  = "eu-west-2" # Setting my region to London. Use your own region here
}

resource "aws_ecr_repository" "sampleapp_ecr_repo" {
  name = "sampleapp-ecr-repo" # Naming my repository
}


#Explanation:

```
# This will create the Cluster:


```

resource "aws_ecs_cluster" "my_cluster" {
  name = "sampleapp-cluster"
}
```
 
You should then see your new cluster


# CodeBuild & CodePipeline
Create terraform plan & apply as separate steps in code pipeline from below steps,

## Create Codebuild to run terrform 
![image](https://user-images.githubusercontent.com/6733678/113500761-4569ba80-953e-11eb-97ea-2af01dab2ec5.png)

## Apply Terraform 
![image](https://user-images.githubusercontent.com/6733678/113500773-629e8900-953e-11eb-99c6-0bc41e1df178.png)


First time we can apply terraform to create the long living objects and then after we can create codebuild and intergate it with codepipeline.
I can further enhance this codepipeline if somemone make changes to github the pipeline will be triggered if the changes are merged to main branch. 


It should look something like this,
Screenshot 2021-04-04 at 12.58.48 PM![image](https://user-images.githubusercontent.com/6733678/113501826-b660a080-9545-11eb-8a72-badb64cacdcd.png)

