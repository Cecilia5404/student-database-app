class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here

  #DSL (Domain Specific Language) => sinatra

  get "/" do
    "Hello World"
  end
  get '/appointments' do
    appointments = Appointment.all.order(:date).limit(50)
    
    appointments.to_json(
        only: [:date], 
        include: { teacher: { only: [:teacher_name] }, 
        student: { only: [:student_name] } 
    })
end 

# /appointments/:id => Retrieve an Individual Appointment via Params (:id)
get '/appointments/:id' do
    Appointment.find(params[:id]).to_json
end 
get '/schools' do

  School.all.to_json

  # schools = School.all
  # # schools.to_json(include: :students)
  # schools.to_json(
  #     only: [:school_name], 
  #     include: { students: 
  #         { only: [:student_name, :gender] }
  # }) 
end

get '/schools/:id' do
  school = School.find(params[:id])
  school.to_json(include: :students)
end
get '/students' do
  # Student.all.to_json
  students = Student.all.order(:student_name)
  # #demand is sent to student model
  # students.to_json(only: [:student_name, :age], include: :school)
  students.to_json(include: :school)
end

#Retrieve individual student via param (:id)
get '/students/:id' do
  Student.find(params[:id]).to_json(include: :appointments)
end

post "/students" do
  student = Student.create({student_name:params[:name],
      age:params[:age], gender:params[:gender],
      phone:params[:phone], active:params[:active], 
      school_id:params[:school_id]})
      student.to_json(include: :school)
end

patch "/students/:id" do
  student = Student.find(params[:id])
  student.update({student_name:params[:name],
      age:params[:age], gender:params[:gender],
      phone:params[:phone], active:params[:active], 
      school_id:params[:school_id]})
      student.to_json(include: :school)
end

delete "/students/:id" do
  student = Student.find(params[:id])
  student.destroy
  {message: 'student deleted from our database'}.to_json
end


    # Our API endpoint
    get '/teachers' do
      teachers = Teacher.all
      teachers.to_json(only: [:teacher_name, :subject], include: :students)
  end

  get '/teachers/:id' do
      teacher = Teacher.all.find(params[:id])
      teacher.to_json(include: :appointments)
  end
end
