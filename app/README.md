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

I used dind for the GitLab Runner executor


