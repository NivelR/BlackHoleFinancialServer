class ReportsController < ApplicationController

  # GET /report
  def report
    @reporte = 
      { result: 
        {
          expenses: current_user.get_expenses_sum, 
          incomes: current_user.get_incomes_sum
        }
      }
    render json: @reporte.to_json
  end

  # GET /get_expenses_sum
  def get_expenses_sum
    sum = current_user.get_expenses_sum
    #puts "\e[0;34m\e[47m\ get_expenses_sum!: #{sum} \e[m"
    render json: {:expenses => sum}
  end

  # GET /get_incomes_sum
  def get_incomes_sum
    sum = current_user.get_incomes_sum
    #puts "\e[0;34m\e[47m\ get_incomes_sum!: #{sum} \e[m"
    render json: {:incomes => sum}
  end

  # GET /get_expenses_between
  def get_expenses_between
    min_date = Date.today - 1
    max_date = Date.today
    sum = current_user.get_expenses_between(min_date, max_date)
    render json: {:expenses => sum}
  end

end
