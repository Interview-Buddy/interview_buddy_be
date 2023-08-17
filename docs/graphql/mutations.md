## Mutations
### [User Mutations](#user-m)
- [createUser](#create-user)
- [updateUser](#update-user)
- [deleteUser](#delete-user)

### [Meeting Mutations](#meeting-m)
- [createMeeting](#create-meeting)
- [updateMeeting](#update-meeting)
- [deleteMeeting](#delete-meeting)
---

<br>

### <a id="user-m">User Mutations</a><br>
<a id="create-user">**createUser**</a><br>
*Used during profile creation. Will create a new `User` in the database*
* Example Mutation
```json
mutation {
  createUser(
    input: {
      firstName: "Meg",
      lastName: "Murray",
      email: "meg.murray@gmail.com",
      password: "test123",
      company: null,
      pronouns: "she/her",
      displayName: "Meg",
      userType: "student"
      }
      ) {
        user {
          id
          firstName
          lastName
          email
          password
          company
          pronouns
          displayName
          userType
        }
      }
    }
```
* Example Response
```json
{
  "data": {
    "createUser": {
      "user": {
        "id": "1"
        "firstName": "Meg"
        "lastName": "Murray"
        "email": "meg.murray@gmail.com"
        "password": "test123"
        "company": null
        "pronouns": "she/her"
        "displayName": "Meg"
        "userType": "student"
      }
    }
  }
}
```
---

<br>

<a id="update-user">**updateUser**</a><br>
*Will allow a `User` to edit their specific attributes in the database*
* Example Mutation
```json
mutation {
  updateUser(
    input: {
      name: "Example",
      email: "test@test.test"
    }
      ) {
        user {
          id
          name
          email
        }
      }
    }
```
* Example Response
```json
{
  "data": {
    "editUser": {
      "user": {
        "id": "11",
        "name": "Example",
        "email": "test@test.test"
      }
    }
  }
}
```
---

<br>

<a id="delete-user">**deleteUser**</a><br>
*Will delete a `User` and all `Meetings` associated with the `User` in the database*
* Example Mutation
```json
mutation {
  deleteUser(
    input: {
      id: "11"
    }
  ) {
      user {
        id
      }
    }
}
```
* Example Response
```json
{
  "data": {
    "deleteUser": {
      "user": {
       "id": "11"
      }
    }
  }
}
```
---

<br>

### <a id="meeting-m">Meeting Mutations</a>
<a id="create-meeting">**createMeeting**</a>
<br>
*Used during `Meeting` creation. Will create a `new meeting` attached to a `User` in the database*
* Example Mutation
```json
mutation {
  createMeeting(
    input: {
      userId: 13
      startTime: "10"
      endTime: "11"
      title: null,
      studentId: null,
      interviewType: "technical",
      date: "08/17/2023"
      }
      ) {
        meeting {
          id
          userId
          studentId
          startTime
          endTime
          interviewType
          date
          title
        }
      }
    }
```
* Example Response
```json
{
  "data": {
    "createItem": {
      "item": {
        "id": "51",
        "title": "Interview with Charles Wallace",
        "startTime": "2000-01-01 10:00:00 UTC",
        "endTime": "2000-01-01 11:00:00 UTC",
        "date": "2023-17-08",
        "userId": "13",
        "studentId": null,
        "interviewType": "technical"
      }
    }
  }
}

```
---

<br>

<a id="update-meeting">**updateMeeting**</a> <br>
*Will allow a `User` to edit a specific meeting in the database*
* Example Mutation
```json
mutation {
  updateMeeting(
    input: {
      id: 15
      startTime: "15:00",
      endTime: "16:00",
      userId: 78,
      date: "12/23/2023",
      studentId: 13,
      interviewType: "both"
      }
      ) {
        meeting {
          id
          startTime
          endTime
          userId
          date
          student_id
          interviewType
        }
      }
    }
```
* Example Response
```json
{
  "data": {
    "updateMeeting": {
      "meeting": {
        "id": "15",
        "startTime": "2000-01-01 15:00:00 UTC",
        "endTime": "2000-01-01 16:00:00 UTC",
        "userId": "78",
        "date": "2023-23-12",
        "studentId": "13",
        "interviewType": "both",
      }
    }
  }
}
```
---

<br>

<a id="delete-item">**deleteItem**</a><br>
*Will delete an `item` in the database*
* Example Mutation
```json
mutation {
  deleteItem(
    input: {
      id: "11"
    }
      ) {
        success
        }
}
```
* Example Response
```json
{
  "data": {
    "deleteItem": {
      "success": {
       true
      }
    }
  }
}
```
---