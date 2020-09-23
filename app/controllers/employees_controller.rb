class EmployeesController < ApplicationController
    
    def index
        @employees = Employee.all
    end
    
    def create
      
        new_employee = Employee.create(employee_params)
        redirect_to employee_path(new_employee)
    end
    
    def new
        @employee = Employee.new
    end
    
    def show
        current_employee
        #@employee = Employee.find(params[:id])
    end
    
    def edit
        current_employee
        #@employee = Employee.find(params[:id])
    end
    
    def update 
        @employee.update(employee_params)
        redirect_to employee_path(@employee)
    end
    
    def current_employee
        @employee = Employee.find(params[:id])
    end
    
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alaias, :title, :office, :dog_id, :img_url)
    end      

end
