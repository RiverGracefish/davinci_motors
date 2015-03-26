class CarsController < ApplicationController
  before_action :find_car
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.save
    redirect_to cars_path,
      notice: "#{@car.year} #{@car.make} #{@car.model} created"
  end

  def edit
    find_car
  end

  def find_car
    @car = Car.find(params[:id])
  end

  def update
    find_car
    @car.update(car_params)
    params.require(:car).permit(:make, :year, :model, :price)
  end

  private
  def car_params
    params.require(:car).permit(:make, :year, :model, :price)
  end
end
