class EmployeesController < ApplicationController
    before_action :current_employee, only: [:show, :edit, :update]

    def index
        @employees = Employee.all
    end

    def show
    end 

    def new
        @employee = Employee.new
    end 
    
    def create 
        new_employee = Employee.new(employee_params)
        if !new_employee.valid?
            flash[:errors] = new_employee.errors.full_messages
            redirect_to new_employee_path
        else 
            new_employee.save
            redirect_to employee_path(new_employee)
        end 
    end 
    
    def edit 
    end 

    def update 
       if !(@employee.update(employee_params)).valid?
        byebug
       end 
    end 

    def current_employee
        @employee = Employee.all.find(params[:id])
    end 
    
    private 

    def employee_params
        params.require(:employee).permit!
    end 

end 
