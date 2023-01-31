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
    "name": "MT",
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
Use the authorization token(Auth2.0), if youre signed in, all users will show
 ``

# logout
 A user can signout with DELETE ACTION

 **route**
 localhost:3000/api/v1/auth/logout

 you will get a message, successfully logged out



# get instruments
 Any user will be able to see the instruments with GET action

 **route**
 localhost:3000/api/v1/instruments

# create instruments

 ``
 {
  "instrument" {
    "name": "drum",
    "description": "Lorem.paragraph",
    "image": "drum image",
    "category": "guitar",
    "price": 100,
    "available": true,
    "user_id": 3
    }
}

 ``

**response body**

 ``
{
    "id": 2,
    "name": "drum",
    "description": "Lorem.paragraph",
    "image": "drum image",
    "category": "guitar",
    "price": 100,
    "available": true,
    "created_at": "2023-01-30T09:56:07.350Z",
    "updated_at": "2023-01-30T09:56:07.350Z",
    "user_id": 3
}
 ``


# get specific instrument
 A user can get specific instrument details with GET action

 **route**
 localhost:3000/api/v1/instruments/1

 **response body**
 ``
{
    "id": 2,
    "name": "drum",
    "description": "Lorem.paragraph",
    "image": "drum image",
    "category": "guitar",
    "price": 100,
    "available": true,
    "created_at": "2023-01-30T09:56:07.350Z",
    "updated_at": "2023-01-30T09:56:07.350Z",
    "user_id": 3
}
 ``

 # delete instruments

  **route**
 localhost:3000/api/v1/instruments/id


# create reservation
 A user can make their reservations with POST. they will fill in a form and a body will be returned

 **route**
 localhost:3000/api/v1/user/reservations
 **response body**
 ``
 {
   "reservation": {
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
 **response body**
 ``
 [
 {
    "reservation": {
      "id": "1",
      "user_id": "1",
      "instrument_id": "1",
      "pickup_date": "2023-02-01",
      "return_date": "2023-02-10"
      "created_at": "2023-01-30T09:56:07.350Z",
      "updated_at": "2023-01-30T09:56:07.350Z",
    }
  }
 ]
 ``
# destroy a reservation
 A user can destroy their reservations with DELETE. they will fill in a form and a body will be returned

 **route**
 localhost:3000/api/v1/user/reservations/id
**response body**
``
{
    "status": 200,
    "message": "Reservation cancelled successfully"
}
``

api docs at Melody-Rentals/swagger/v1/swagger.yaml
