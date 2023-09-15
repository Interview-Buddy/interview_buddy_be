## Queries

### [User Queries](#user-q)
- [getUsers](#get-users)
- [getAUser](#get-user)
- [getUsersByCompany](#get-users-by-company)

### [Meeting Queries](#meeting-q)
- [getMeetings](#get-meetings)
- [getAMeetingByUser](#get-meeting-user-id)
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

<a id="get-users-by-company">**getUsersByCompany**</a><br>
*Will retrive all `Users` by their associated `Company` or will return an empty array if none.*

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
---

### <a id="meeting-q">Meeting Queries</a><br>
<a id="get-meetings">**getMeetings**</a><br>
*Will retrive all `Meetings` from the database.*

- Example Query
```json
{
  meetings {
    id
 		userId
    interviewType
    date
    title
    studentId
  }
}
```

- Example Response
```json
{
  "data": {
    "meetings": [
      {
        "id": "1",
        "userId": 5,
        "interviewType": "technical",
        "date": "2023-09-08",
        "title": "Interview with Joseph Downs and Colin Reinhart",
        "studentId": 4
      },
      {
        "id": "2",
        "userId": 5,
        "interviewType": "behavioral",
        "date": "2023-10-08",
        "title": "Interview with Joseph Downs",
        "studentId": null
      },
      {
        "id": "3",
        "userId": 6,
        "interviewType": "both",
        "date": "2023-11-08",
        "title": "Interview with Lucas Merchant",
        "studentId": null
      }
    ]
  }
}
```
<br>

<a id="get-meeting-user-id">getMeetingByUser</a><br>
*Will retrive all `Meetings` associated with a `User ID`.*

- Example Query
```json
{
  meetingByUser(userId: 10) {
    date
    title
  }
}
```

- Example Response
```json
{
  "data": {
    "meetingByUser": [
      {
        "date": "2023-09-08",
        "title": "Interview with Joseph Downs and Colin Reinhart"
      },
      {
        "date": "2023-10-08",
        "title": "Interview with Joseph Downs"
      },
      {
        "date": "2023-12-08",
        "title": "Interview with Joseph Downs and Anthony Shellman"
      }
    ]
  }
}
```

<a id="get-meeting-interview-type">getMeetingByInterviewType</a><br>
*Will retrive all `Meetings` with associated `Interview Type`.*

- Example Query
```json
{
  meetingByInterviewType(interviewType: "behavioral") {
    title
    date
    interviewType
  }
}
```

- Example Response
```json
{
  "data": {
    "meetingByInterviewType": [
      {
        "title": "Interview with Joseph Downs",
        "date": "2023-10-08",
        "interviewType": "behavioral"
      },
      {
        "title": "Interview with Lucas Merchant",
        "date": "2023-11-08",
        "interviewType": "behavioral"
      }
    ]
  }
}
```

<a id="get-meetings-date">getMeetingsByDate</a><br>
*Will retrive all `Meetings` associated with a `Date`. Takes yyyy/mm/dd format.*

- Example Query
```json
{
  meetingsByDate(date: "2023/11/08"){
    title
    interviewType
  }
}
```

- Example Response
```json
{
  "data": {
    "meetingsByDate": [
      {
        "title": "Interview with Lucas Merchant",
        "interviewType": "both"
      },
      {
        "title": "Interview with Lucas Merchant",
        "interviewType": "behavioral"
      }
    ]
  }
}
```
