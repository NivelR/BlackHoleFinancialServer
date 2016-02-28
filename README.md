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


# Probando con cURL
Pasor para hacer Login de prueba y consultar la API.
1. curl -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/users/sign_in -d '{"user": {"email": "user@nivelr.com", "password": "clave12345"}}'

 Genera un json y de ahi podes ver el user token:bmu_o_vU7CrqeTZNRLWN

2. tomas el token y lo exportas:
export EMAIL=user@nivelr.com
export TOKEN=bmu_o_vU7CrqeTZNRLWN
export ROOT_URL=http://localhost:3000

 curl -i -H "Accept: application/json" -H "Content-type: application/json"  -H "X-User-Email: $EMAIL" -H "X-User-Token: $TOKEN" -X GET $ROOT_URL/tags.json

3. insegura:
http://localhost:3000/tags?user_email=user@nivelr.com&user_token=bmu_o_vU7CrqeTZNRLWN

# Rutas.

     /tags = todas las etiquetas del sistema.
    /transactions = todas las transacciones del usuario actual.
    /get_expenses_sum = total historico de gastos del usuario.
    /get_incomes_sum = total historico de ingresos del usuario.
    /users/report = reporte historio de gastos e ingresos.
    /daily_report = reporte diario de gastos e ingresos
    /week_report = reporte semanal de gastos e ingresos
    /month_report = reporte mensual de gastos e ingresos.



Para obtener todas las rutas:

`$rails routes`

|      Prefix            |Verb|   URI Pattern                | Controller#Action|
|------------------------|----|------------------------------|------------------|
|new_user_session        |GET|    /users/sign_in(.:format)   | users/sessions#new         |
|user_session            |POST|   /users/sign_in(.:format)   | users/sessions#create      |
|destroy_user_session    |DELETE|/users/sign_out(.:format)   | users/sessions#destroy     |
|cancel_user_registration|GET|    /users/cancel(.:format)    | users/registrations#cancel |
|user_registration       |POST|   /users(.:format)           | users/registrations#create |
|new_user_registration   |GET|    /users/sign_up(.:format)   | users/registrations#new    |
|edit_user_registration  |GET|    /users/edit(.:format)      | users/registrations#edit   |
|                        |PATCH|  /users(.:format)           | users/registrations#update |
|                        |PUT|    /users(.:format)           | users/registrations#update |
|                        |DELETE| /users(.:format)           | users/registrations#destroy|
|transactions            |GET|    /transactions(.:format)    | transactions#index         |
|                        |POST|   /transactions(.:format)    | transactions#create        |
|transaction             |GET|    /transactions/:id(.:format)| transactions#show          |
|                        |PATCH|  /transactions/:id(.:format)| transactions#update        |
|                        |PUT|    /transactions/:id(.:format)| transactions#update        |
|                        |DELETE| /transactions/:id(.:format)| transactions#destroy       |
|tags                    |GET|    /tags(.:format)            | tags#index                 |
|                        |POST|   /tags(.:format)            | tags#create                |
|tag                     |GET|    /tags/:id(.:format)        | tags#show                  |
|                        |PATCH|  /tags/:id(.:format)        | tags#update                |
|                        |PUT|    /tags/:id(.:format)        | tags#update                |
|                        |DELETE| /tags/:id(.:format)        | tags#destroy               |
|report                  |GET|    /users/report(.:format)    | reports#report             |
|get_expenses_sum        |GET|   /get_expenses_sum(.:format) | reports#get_expenses_sum   |
|get_incomes_sum         |GET|    /get_incomes_sum(.:format) | reports#get_incomes_sum    |
|daily_report            |GET|    /daily_report(.:format)    | reports#daily_report       |
|week_report             |GET|    /week_report(.:format)     | reports#week_report        |
|month_report            |GET|    /month_report(.:format)    | reports#month_report       |
