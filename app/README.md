# App and CI/CD readme

## Project Structure:
First we create a sample project structure
```bash
.
├── django
│   ├── app-py
│   ├── Dockerfile
│   ├── .dockerignore
│   └── requirements.txt
├── docker-compose.yml
├── .env
├── .gitlab-ci.yml
├── nginx
│   ├── docker-compose.yml
│   ├── .env
│   └── nginx.conf
└── README.md
```
# CI/CD pipeline:
## Protected variables:
set protected variable in Project ⇒ Settings ⇒ CI/CD ⇒ Variables

```bash
#CI/CD Variables
SSH_USER
SSH_PASSWORD
SSH_PRIVATE_KEY

# Group variables (inherited)
REGISTRY_PASS
REGISTRY_USER
REGISTRY_URL
```
![Gitlab variables](../images/GitlabVariables.png)

In this task, we are asked to do two stages:
```bash
stages:
  - Build
  - Deploy
```
Given that there are only two stages(Which we call production) and one environment in this task, we design the pipeline as follows:
**pipeline:**
![pipeline design](../images/pipeline.jpg)
**build job**
![build design](../images/build-jobs.jpg)
**deploy job**
![pipeline design](../images/deploy-jobs.jpg)

- I used dind for the GitLab Runner executor
- Manual approval is required for deployment.

# App and services:

I wanted to use a separate, specialized load balancer to load balance traffic between MariaDB databases. However, to avoid complicating the project, I also placed load balancing traffic between databases in the same nginx container and placed the stream block configuration in the **db_proxy.conf** file
nginx is configured in the simplest possible way
### VM-1 design:

![services](../images/nginx-design.png)

Instead of putting all the services in one compose, I preferred to create several separate composes for them in the compose

We can create a compose and include all the composes in this file.

I preferred to create a **project-tester.sh** file that runs the compose.

![project tester](../images/project-tester.png)

#### Details:

I created a Python app that counts post requests and displays their number in the get request. The apps do not store data in the database 
- the data is not persistent and the value is different for each instance. 

