class DogsController < ApplicationController

    def index
        @dogs = Dog.all.sort_by {|dog| dog.employees.count}.reverse
    end

    def show
        @dog = Dog.find(params[:id])
        @employees = @dog.employees
    end
end
