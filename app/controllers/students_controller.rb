class StudentsController < ApplicationController
  def index
    @page_header = 'Students List'
    @students = Student.all
  end

  def edit
    @page_header = 'Edit Student'
    @student = Student.find_by(id: params[:id])
  end

  def new
    @page_header = 'New Student'
  end

  def update
    student = Student.find_by(id: params[:id])

    if student.update(permit_params)
      redirect_to students_path, notice: 'Student Updated'
    else
      redirect_to students_path, notice: 'Student not Updated'
    end
  end

  def create
    student = Student.new(permit_params)

    if student.save
      redirect_to students_path, notice: "#{student.name} created"
    else
      redirect_to students_path, notice: "User not created #{student.errors.messages}"
    end
  end

  def destroy
    student = Student.find_by(id: params[:id])

    if student.destroy
      redirect_to students_path, notice: 'Student deleted'
    else
      redirect_to students_path, notice: 'Student Not Deleted'
    end
  end

  private

  def permit_params
    params.require(:student).permit(:name, :last_name, :school_id)
  end
end
