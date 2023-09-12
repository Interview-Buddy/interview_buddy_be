# **Interview Buddy BE**

![Ruby](https://img.shields.io/badge/Ruby-2.7.4-EE4B2B)
![Rails](https://img.shields.io/badge/Rails-7.0.5.1-900C3F)
![Postgres](https://img.shields.io/badge/PostgresSQL-14.4-228B22)
![Graphql](https://img.shields.io/badge/GraphQL-2.0-fb9062)
![Render](https://img.shields.io/badge/Hosted_on-Render.com-4b0082)

<p align="center">
  <a href="https://interviewbuddy-e788c667626e.herokuapp.com/"> <img src="./docs/imgs/Interviewbuddylogo.png" alt="logo" width="95%"/></a>
</p>

## **Table of Contents**
- [Background and Description](#background-and-description)
- [Schema](#schema)
- [GraphQl Endpoints](#graphql-endpoints)
  - [Queries](#queries)
  - [Mutations](#mutations)
- [Contributors](#contributors)

## **Schema**
<p align="center">
  <img src="./docs/imgs/InterviewBuddySchema.png" width="95%">
</p>

## **GraphQL Endpoints**
For detailed examples of the endpoints with example responses click the specific query or mutation below.

- Queries
  - User Queries
    - [Return all Users](./docs/graphql/queries.md)
    - [Return a User by UUID](./docs/graphql/queries.md)
  - Meeting Queries
- Mutations
  - User Mutations
    - [createUser](./docs/graphql/mutations.md#user-m)
    - [updateUser](./docs/graphql/mutations.md#update-user)
    - [deleteUser](./docs/graphql/mutations.md#delete-user)
  - Meeting Mutations
    - [createMeeting](./docs/graphql/mutations.md#meeting-m)
    - [updateMeeting](./docs/graphql/mutations.md#update-meeting)
    - [deleteMeeting](./docs/graphql/mutations.md#delete-meeting)