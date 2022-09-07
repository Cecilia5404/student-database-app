import './App.css';
import { useState, useEffect } from 'react'
import Card from './components/Card';
import CreateForm from './components/CreateForm';

function App() {
  const [students, setStudents] = useState([])
  const [schools, setSchools] = useState([])

  useEffect(()=> {
  //Gets schools and students
    fetch('http://localhost:9292/students')
    .then(res => res.json())
    .then(setStudents)
    
    fetch('http://localhost:9292/schools')
    .then(res => res.json())
    .then(setSchools)
  },[])

  //Creates a Student
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
//patches student
  const patchStudent = (student) => {
    fetch(`http://localhost:9292/students/${student.id}`,{
      method:'PATCH',
      headers:{
        'Content-Type':'application/json'
      },
      body: JSON.stringify({...student, active: false})
    })
    .then(res => res.json())
    .then(data => {
      setStudents(students.map(st => {
        if(st.id === data.id){
          return data
        } else {
          return st
        }
      }))
    })
  } 
//Deletes patient
  const handleDelete = (id) => {
    fetch(`http://localhost:9292/students/${id}`,{
      method:'DELETE',
      headers:{'Content-Type':'application/json'}
    })
    .then(res => res.json())
    .then(() => {
      setStudents(students.filter(st => st.id !== id))
    })
  }
  return (
    <div className="App">
      <div>
      <CreateForm postStudent={postStudent} schools={schools}/>
      {students.map(st => <Card student={st} patchStudent={patchStudent} handleDelete={handleDelete} key={`${st.id}${st.name}`}/>)}
      </div> 
    </div> 
  );
}
export default App;
