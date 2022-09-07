class TeachersController < ApplicationController

    #initiate fetch request targeting an API endpoint

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