# Deployando Apache Airflow com Terraform e Docker

## AWS
Este projeto foi construído com o provider AWS e um usuário configurado como "default" <br />
Certifique-se de ter um usuário configurado dentro de `~/.aws/credentials` e de que o terraform CLI está instalado em seu computador.

## Execução
Para rodar o projeto, no terminal da sua máquina, comece instalando os plugins necessários para o Terraform: <br />
`terraform init`

Após isso, se quiser exibir um plano de execução do que será construído na sua cloud, digite: <br />
`terraform plan`

E para realizar o deploy de toda a infraestrutura, use o comando: <br />
`terraform apply`

## Airflow
Você poderá acessar a webserver do Apache Airflow em: <br />
`http://ip-da-maquina-aws:8080/admin`
