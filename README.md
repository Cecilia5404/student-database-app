# Phase-3-Project: Simple student database application
 
 ## Objectives of this Project
    1. Create a Full-Stack application that includes React Js frontend and Sinatra backend.
    2. It must be able to perform CRUD through GUI (Graphical User Interface)
    3. The backend should include at least 2 models.

## About this project
For this project, I have decided to create a simple student database app using React frontend and Ruby Sinatra backend.
I figured that it would be useful for me later on since I work at a middle school as a part-time IT tech.
Here's my simple looking graphical user interface created with React framework.
<div align="center">
<img src="https://user-images.githubusercontent.com/64029918/158064332-a01d89a8-c376-400b-b827-bddddc1583a7.png" width="600" height="400">
</div>
The top of the application contains a form component where users can type and submit new student data to my sinatra backend database.
I used active record gem to create connections between different class models: students, schools.

```Ruby
class Student < ActiveRecord::Base
    belongs_to :school
    has_many :appointments
    has_many :teachers, through: :appointments


    def print 
        puts "Name: #{self.name}"
        puts "Age: #{self.age}"
        puts "Gender: #{self.gender}"
        puts "Phone number #{self.phone}"
    end 
end
```

```Ruby
class School < ActiveRecord::Base
    has_many :students, dependent: :destroy      
end
```

Since schools have many students, I created a one to many relationships between two of the models.

## How does it work?
Just like how developers makes an API calls to perform CRUD actions, I simply created an API with a database that can be called from my react frontend using simple fetch request.

<div align="center">
<img src="https://user-images.githubusercontent.com/64029918/158064844-fea045f7-87e4-4b5a-849b-49c151971ea7.png" width="600" height="300">
</div>

If I submit/Patch/Delete data from my frontend, it will then proceed to make a POST/Patch/Delete request to local host server 9292 because this is the default local host server for Sinatra.
Here's a post request that I made:
```Ruby
const postStudent = (student) => {
    fetch('http://localhost:9292/students',{
      method:'POST',
      headers:{
        'Content-Type':'application/json',
      },
      body: JSON.stringify(student)
    })
    .then(res => res.json())
    .then(newStudent => {
      setStudents([newStudent,...students])
    })
  }
```
Then it will save on to my database.
![image](https://user-images.githubusercontent.com/64029918/158065240-63184715-3cd7-4f50-a5b4-44ed49699cf8.png)

I used react hook to constantly refresh frontend whenever there's change in the data. If I make a change to my database through my frontend, then the page will refresh with new changes to the database.
```Ruby
useEffect(()=> {
    fetch('http://localhost:9292/students')
    .then(res => res.json())
    .then(setStudents)
    
    fetch('http://localhost:9292/schools')
    .then(res => res.json())
    .then(setSchools)
  },[])
```

### NOTE
Please start the backend server first before starting the React. Also, make sure you have node.js, Rake installed.

To start the backend server, simply move to school_backend directory and type into your console:
```Console
bundle exec rake server
```
To start the React frontend, move to the favgamelist directory and type into your console:
```Console
npm start
```

### License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
