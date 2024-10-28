class CalculatorController < ApplicationController


  

  def calculate
    calc = Calculator.find(params[:id])
    
    render json: eval(calc.formula % variables)
  end

  private 

  def variables
    JSON.parse(params[:calculator_files].to_json, symbolize_names: true)
  end
end
