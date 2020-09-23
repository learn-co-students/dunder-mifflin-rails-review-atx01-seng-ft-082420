class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find(params[:id])
        @dog = @employee.dog
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        @employee = Employee.new(employee_params)
        @employee.save

        if !@employee.valid?
            flash[:errors] = @employee.errors.full_messages
            redirect_to new_employee_path
        else
            redirect_to employee_path(@employee)
        end
    end

    def edit
        @employee = Employee.find(params[:id])
        @dogs = Dog.all
    end

    def update
        @employee = Employee.find(params[:id])
        @employee.update(employee_params)
        @employee.save

        if !@employee.valid?
            flash[:errors] = @employee.errors.full_messages
            redirect_to edit_employee_path
        else
            redirect_to employee_path(@employee)
        end
    end

    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        flash[:notice] = "Employee deleted."
        redirect_to employees_path
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end
end
