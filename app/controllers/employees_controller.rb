class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end 

    def show
        @employee = Employee.find(params[:id])
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(employee_params(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id))

        if !@employee.valid?
            flash[:errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        else 
            @employee.save
            redirect_to @employee
        end

    end

    def employee_params(*args)
        params.require(:employee).permit(*args)
    end

    
end
