class CalculatorsController < ApplicationController

  def new
    @calculator = Calculator.new
    @calculator.fields.build
  end

  def create
    @calculator = Calculator.new(calculator_params)
    
    if @calculator.save
      params[:category_name].each_with_index do |name, index|
        price = params[:category_price][index]
        @calculator.fields.last.categories.create(name: name, price: price)
      end
      
      Formula.create(expression: params[:calculator][:expression], calculator_id: @calculator.id)
  
      flash.now[:notice] = 'Calculator and fields were successfully created.'
      render :new
    else
      flash.now[:alert] = 'There was an error creating the calculator or fields.'
      render :new
    end
  end
  
  def calculate
    calc = Calculator.find(params[:id])
    
    render json: eval(calc.formula % variables)
  end

  private 

  def calculator_params
    params.require(:calculator).permit(:name, fields_attributes: [:label, :var_name, :field_type])
  end

  def variables
    JSON.parse(params[:calculator_files].to_json, symbolize_names: true)
  end
end
