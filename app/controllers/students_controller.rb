class StudentsController < ApplicationController

  def index
    students = Student.all
    if params[:name]
      #students = Student.where(first_name: params[:name]) #|| (last_name: params[:name]))
     # byebug
     students = Student.all.filter{|student| student.first_name.downcase.include?(params[:name]) || student.last_name.downcase.include?(params[:name])}
     # students = Student.where('last_name like ?', params[:name])
    end
    render json: students
  end
    

  def show
    students = Student.find(params[:id])
    render json: students
  end

end
