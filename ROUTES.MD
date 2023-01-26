### This is how you consume the api in development

## user auth

# signup
 A user object is posted to the sign up with POST

 **route**
 localhost:3000/api/v1/auth/signup

 ``
{
  "user": {
    "username": "tm",
    "name": "Matongo",
    "email": "tm@easypay.com",
    "password": "12345678",
    "password_confirmation": "12345678"
  }
}
 ``

# login
 A user login details are posted to the login with POST

 **route**
 localhost:3000/api/v1/auth/login

 ``
{
	"user": {
		"email": "tm@easypay.com",
		"password": "12345678"
	}
}
 ``

# get all users
 A logged in user can access the users with GET action

 **route**
 localhost:3000/api/v1/users

 ``
Use the authorization token, if youre signed in, all users will show
 ``

# logout
 A user can signout with DELETE ACTION

 **route**
 localhost:3000/api/v1/auth/logout

 you will get a message, successfully logged out

 ``

 ``


# get instruments
 Any user will be able to see the instruments with GET action

 **route**
 localhost:3000/api/v1/instruments


# get specific instrument
 A user can get specific instrument details with GET action

 **route**
 localhost:3000/api/v1/instruments/1

 ``
{
    id: 1,
    name: "Guitar",
    description: "A guitar",
    image: "https://www.google.com",
    category: "String",
    price: 100,
    quantity: 10,
    created_at: Tue, 24 Jan 2023 08:43:31.023309000 UTC +00:00,
    updated_at: Tue, 24 Jan 2023 08:43:31.023309000 UTC +00:00,
    user_id: 1>
}
 ``

# create reservation
 A user can make their reservations with POST. they will fill in a form and a body will be returned

 **route**
 localhost:3000/api/v1/user/reservations/new

 ``
 {
   "reservation": {
     "id": "1",
     "user_id": "1",
     "instrument_id": "1",
     "pickup_date": "2023-02-01",
     "return_date": "2023-02-10"
   }
 }
 ``

 frontent can make the logic for daily payments

# see all reservations
 A user can see their reservations with GET action

 **route**
 localhost:3000/api/v1/user/reservations

 ``
 {
   "reservation": {
     "id": "1",
     "user_id": "1",
     "instrument_id": "1",
     "pickup_date": "2023-02-01",
     "return_date": "2023-02-10"
   }
 }
 ``
# destroy a reservation
 A user can destroy their reservations with DELETE. they will fill in a form and a body will be returned

 **route**
 localhost:3000/api/v1/user/reservations/destroy

 ``
 {
   "reservation": {
     "id": "1",
     "user_id": "tm",
     "instrument_id": "tm@localhost",
     "pickup_date": "2023-02-01",
     "return_date": "2023-02-10"
   }
 }
 ``
