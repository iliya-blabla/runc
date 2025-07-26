# App and CI/CD readme

## Project Structure:
First we create a sample project structure
```bash
.
├── django
│   ├── docker-compose.yml
│   ├── Dockerfile
│   ├── .dockerignore
│   ├── .env
│   └── requirements.txt
├── .env
├── .gitlab-ci.yml
├── nginx-compose.yml
├── nginx.conf
└── README.md
```


##Protected variables:
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
![Gitlab variables](images/GitlabVariables.png)

