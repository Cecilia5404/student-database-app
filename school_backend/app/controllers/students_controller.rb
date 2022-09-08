class StudentsController < ApplicationController

    #initiate fetch request targeting an API endpoint

    # Our API endpoint
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

end