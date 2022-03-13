# devops-portfolio
The repository is an illustration of DevOps practices in their simplest form for educational purposes

## Docker
You can find an example of a simple database application in [app-with-db](https://github.com/NPodlozhniy/devops-portfolio/tree/master/app-with-db)

The container raises the database and the app returns the version of this database

#### Usage
```
$ git clone https://github.com/NPodlozhniy/devops-portfolio
$ cd app-with-db
$ run.sh
```
See the [run.sh](https://github.com/NPodlozhniy/devops-portfolio/blob/master/app-with-db/run.sh) file for more details (especially the commented lines)

## Terraform
You can find the basic implementation of running a virtual machine with a backing on the Yandex cloud in [terraform](https://github.com/NPodlozhniy/devops-portfolio/blob/master/terraform)

#### Getting Started
Perhaps better than documentation [Yandex Cloud Docs](https://cloud.yandex.com/en/docs/tutorials/infrastructure-management/terraform-quickstart) can not be described

You can use my [main.tf](https://github.com/NPodlozhniy/devops-portfolio/blob/master/terraform/main.tf) file just remember to set your secrets
* Required: `YC_TOKEN`
* Optional: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` _(to implement the backend)_

Remember you also need to get pair of SSH key, for example see [this](https://phoenixnap.com/kb/generate-ssh-key-windows-10)

#### Usage
```
$ terraform init
$ terraform plan
$ terraform apply
# if you do not want billing to start after the end of the trial period
$ terraform destroy
```
