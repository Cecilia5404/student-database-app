class SchoolsController < ApplicationController
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
end