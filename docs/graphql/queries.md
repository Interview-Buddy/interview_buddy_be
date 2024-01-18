## Queries

### [User Queries](#user-q)
- [getUsers](#get-users)
- [getAUser](#get-user)
- [getUsersByCompany](#get-users-by-company)

### [Meeting Queries](#meeting-q)
- [getMeetings](#get-meetings)
- [getMeetingsByUser](#get-meeting-user-id)
- [getMeetingsByUserAndMonth](#get-meeting-user-month)
- [getMeetingsByStudent](#get-meeting-student)
- [getMeetingsByStudentandMonth](#get-meeting-student-month)
- [getMeetingsByInterviewType](#get-meeting-interview-type)
- [getMeetingsByDate](#get-meetings-date)
---

### <a id="user-q">User Queries</a><br>
<a id="get-users">**getUsers**</a><br>
*Will retrieve all `Users` in the database.*

- Example Query
```graphql
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
*Will retrieve a `User` in the database.*

- Example Query
```graphql
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
*Will retrieve all `Users` by their associated `Company` or will return an empty array if none.*

- Example Query
```graphql
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
*Will retrieve all `Meetings` from the database.*

- Example Query
```graphql
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

<a id="get-meeting-user-id">getMeetingsByUser</a><br>
*Will retrieve all `Meetings` associated with a `User ID`.*

- Example Query
```graphql
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

<a id="get-meeting-user-month">getMeetingsByUserAndMonth</a><br>
*Will retrieve all `Meetings` associated with `User` and limited by month. Month is a string 1 - 12.*

- Example Query
```graphql
{
  meetingsByUserAndMonth(userId: 5, month: "10") {
    title
    date
    userId
  }
}
```

- Example Response
```json
{
  "data": {
    "meetingsByUserAndMonth": [
      {
        "title": "Interview with Joseph Downs",
        "date": "2023-10-08",
        "userId": 5
      }
    ]
  }
}
```

<a id="get-meeting-student">getMeetingsByStudent</a><br>
*Will retrieve all `Meetings` associated with `Student`.*

- Example Query
```graphql
{
  meetingsByStudent(studentId: 7) {
    date
    studentId
    title
    userId
  }
}
```

- Example Response
```json
{
  "data": {
    "meetingsByStudent": [
      {
        "date": "2023-12-08",
        "studentId": 7,
        "title": "Interview with Joseph Downs and Anthony Shellman",
        "userId": 5
      }
    ]
  }
```

<a id="get-meeeting-student-month">getMeetingsByStudentAndMonth</a><br>
*Will retrieve all `Meetings` with associated `Student` and limited by month. Month is a string 1 - 12.*

- Example Query
```graphql
{
  meetingsByStudentAndMonth(studentId: 4, month: "9") {
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
    "meetingsByStudentAndMonth": [
      {
        "date": "2023-09-08",
        "title": "Interview with Joseph Downs and Colin Reinhart",
        "studentId": 4
      }
    ]
  }
}
```

<a id="get-meeting-interview-type">getMeetingsByInterviewType</a><br>
*Will retrieve all `Meetings` with associated `Interview Type`.*

- Example Query
```graphql
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
*Will retrieve all `Meetings` associated with a `Date`. Takes yyyy/mm/dd format.*

- Example Query
```graphql
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
