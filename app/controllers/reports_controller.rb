require "date"

class ReportsController < ApplicationController

  # GET /report
  def report
    @reporte = 
      { report: 
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

  def week_report
    week_days = Date.today.cwday #dias pasados desde el inicio de la semana. 
    min_date = Date.today - week_days + 1
    max_date = Date.today
    week_expenses = current_user.get_expenses_between(min_date, max_date)
    week_incomes = current_user.get_incomes_between(min_date, max_date)
    @reporte = 
      { report: 
        {
          expenses: week_expenses, 
          incomes: week_incomes
        }
      }
    render json: @reporte.to_json
  end

  def month_report
    month_day = Date.today.mday #dias pasados desde el inicio del mes. 
    min_date = Date.today - month_day + 1
    max_date = Date.today
    month_expenses = current_user.get_expenses_between(min_date, max_date)
    month_incomes = current_user.get_incomes_between(min_date, max_date)

    @reporte = 
      { report: 
        {
          expenses: month_expenses, 
          incomes: month_incomes
        }
      }
    render json: @reporte.to_json
  end

  def daily_report
    #puts "\e[0;34m\e[47m\ get_incomes_sum!: #{daily_expenses} \e[m" 
    @reporte = 
      { report: 
        {
          expenses: daily_expenses, 
          incomes: daily_incomes
        }
      }
    render json: @reporte.to_json
  end

private
  def daily_expenses
    current_user.get_expenses_between(Date.today, Date.today)
  end

  def daily_incomes
    current_user.get_expenses_between(Date.today, Date.today)
  end

end
