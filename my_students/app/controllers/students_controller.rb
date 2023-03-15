class StudentsController < ApplicationController
    # POST /students
    def create
        @student = Student.new(student_params)
        if @student.save
            render json: @student
        else
            render json: @student.errors, status: :unprocessable_entity
        end
    end

    # GET /students
    def index
        @students = Student.all
        render json: @students
    end

    # GET /students/1
    def show
        @student = Student.find(params[:id])
        render json: @student
    end

    # PATCH /students/1
    def update
        @student = Student.find(params[:id])
        if @student.update(student_params)
            render json: @student
        else
            render json: @student.errors, status: :unprocessable_entity
        end
    end

    # DELETE /students/1
    def destroy
        @student = Student.find(params[:id])
        @student.destroy
    end

    # GET /students/filter/:score
    def filter 
        @student = Student.where(score: params[:score])
        render json: @student
    end
    
    # Agregar al final de la clase por el control de accesos
    private
        def student_params
            params.require(:student).permit(:name, :score)
        end
end