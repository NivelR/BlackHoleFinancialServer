## Black Hole
You can track your incomes and expenses daily, weekly and monthly. In a very simple way with Black Hole! Finances for Freelancers.

Hey, where gone your money the last week? do you know?
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 2.3.0
* Rails 5 - API.

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Probando con cURL
Pasor para hacer Login de prueba y consultar la API.
1)
curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/users/sign_in -d '{"user": {"email": "user@nivelr.com", "password": "clave12345"}}'

Genera un json y de ahi podes ver el user token:bmu_o_vU7CrqeTZNRLWN

2) tomas el token y lo exportas:
export EMAIL=user@nivelr.com
export TOKEN=bmu_o_vU7CrqeTZNRLWN
export ROOT_URL=http://localhost:3000

curl -i -H "Accept: application/json" -H "Content-type: application/json"  -H "X-User-Email: $EMAIL" -H "X-User-Token: $TOKEN" -X GET $ROOT_URL/tags.json

3) insegura:
http://localhost:3000/tags?user_email=user@nivelr.com&user_token=bmu_o_vU7CrqeTZNRLWN