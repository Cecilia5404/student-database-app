import {useState} from 'react'
import '../App.css'

function CreateForm({postStudent, schools}){
    const [formData, setFormData] = useState({
        name:'',
        age: '',
        gender: '',
        phone: '',
        school_id:'',
        active: true
    })
    const handleChange = (e) => {
        setFormData({...formData, [e.target.name]:e.target.value})
    }

    const handleSubmit = (e) => {
        e.preventDefault()
        postStudent(formData)
    } 
    return(
        <div className='student_form'>
            <h1 className='title'>Student Database</h1>
            <form onSubmit={handleSubmit}>
                <label>
                Name:
                <input type="text" name="name" value={formData.name} onChange={handleChange}/>
                </label>
                <label>
                Age:
                <input type="number" name="age" value={formData.age} onChange={handleChange}/>
                </label>
                <label>
                Gender:
                <input type="text" name="gender" value={formData.gender} onChange={handleChange}/>
                </label>
                <label>
                Phone number:
                <input type="text" name="phone" value={formData.phone} onChange={handleChange}/>
                </label>
                <label>
                School:
                <select name="school_id" onChange={handleChange}>
                    <option>Select A School</option>
                    {schools.map(s => <option value={s.id}>{s.school_name}</option>)}
                </select>
                </label>
                <input className='submit_btn' type="submit" value="Submit" />
            </form>
        </div>
        
    )
}

export default CreateForm