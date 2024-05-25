# Note App

Welcome to the Note App! This application allows users to create, read, update, and delete notes. It is built using Flutter framework for the frontend and Node.js with Express.js and Mongoose for the backend.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
  - [Backend](#backend)
  - [Frontend](#frontend)

## Features

- Create a new note
- View all notes
- Update an existing note
- Delete a note

## Installation

### Backend

1. **Clone the repository:**

    ```bash
    git clone https://github.com/thisiskritartha/Note-App-Flutter.git
    cd Note-App-Flutter/Backend_Service/
    ```

2. **Install dependencies:**

    ```bash
    npm install
    ```

3. **Set up environment variables:**

    Create a `.env` file in the `backend` directory and add the following variables:

    ```env
    PORT=8000
    ```

4. **Start the server:**

    ```bash
    npm start
    ```

    The server will start on `http://localhost:8000`.

### Frontend

1. **Navigate to the frontend directory:**

    ```bash
    cd ../Note-App-Flutter
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```


