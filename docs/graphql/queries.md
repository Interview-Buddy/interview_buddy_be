## Queries

### [User Queries](#user-q)
- [getUsers](#get-users)
- [getAUser](#get-user)
- [getUsersByCompany](#get-users-by-company)

### [Meeting Queries](#meeting-q)
- [getMeetings](#get-meetings)
- [getAMeetingByUserId](#get-meeting-user-id)
- [getAMeetingByInterviewType](#get-meeting-interview-type)
- [getMeetingsByDate](#get-meetings-date)
---

### <a id="user-q">User Queries</a><br>
<a id="get-users">**getUsers**</a><br>
*Will retrive all `Users` in the database.*

- Example Query
```json
{
  Users {
    id
    userType
    firstName
    lastName
    displayName
    pronouns
    userType
    uuid
  }
}
```
- Example Response
```json
{
  "data": {
    "users": [
      {
        "id": "4",
        "userType": "student",
        "firstName": "Colin",
        "lastName": "Reinhart",
        "displayName": "Carl",
        "pronouns": null,
        "uuid": "aghaljy"
      },
      {
        "id": "5",
        "userType": "alum",
        "firstName": "Joseph",
        "lastName": "Downs",
        "displayName": "Joshy",
        "pronouns": null,
        "uuid": "password"
      },
      {
        "id": "6",
        "userType": "alum",
        "firstName": "Lucas",
        "lastName": "Merchant",
        "displayName": null,
        "pronouns": "he/they",
        "uuid": "qwerrt"
      },
      {
        "id": "7",
        "userType": "student",
        "firstName": "Anthony",
        "lastName": "Shellman",
        "displayName": null,
        "pronouns": "he/him",
        "uuid": "password34"
      }  
    ]
  }
}
```
<br>

<a id="get-user">**getUser**</a><br>
*Will retrive a `User` in the database.*

- Example Query
```json
{
  user(uuid: "qwerrt"){
    firstName
    lastName
    company
    userType
  }
}
```

- Example Response
```json
{
  "data": {
    "user": {
      "firstName": "Lucas",
      "lastName": "Merchant",
      "company": "Ibotta",
      "userType": "alum"
    }
  }
}
```

<br>

<a id="get-users-by-company">***getUsersByCompany**</a><br>
*Will retrive all `Users` by their associated `Company` or will return `null` if none.*

- Example Query
```json
{
  userByCompany(company: "Google") {
    firstName
    lastName
    userType
    company
  }
}
```

- Example Response (nothing returned)
```json
{
  "data": {
    "userByCompany": []
  }
}
```

- Example Response
```json
{
  "data": {
    "userByCompany": [
      {
        "firstName": "Lucas",
        "lastName": "Merchant",
        "userType": "alum",
        "company": "Google"
      },
      {
        "firstName": "Anthony",
        "lastName": "Shellman",
        "userType": "alum",
        "company": "Google"
      }
    ]
  }
}
```