class ExpensesController < ApplicationController
  def index

    @expenses = Expense.order("date DESC")

    if params[:category_id] == ""
      params[:category_id] = nil
    end
    if params[:concept] == ""
      params[:concept] = nil
    end

    if params[:concept] && params[:category_id]
      @expenses = Expense.where(:concept => params[:concept]).where(:category_id => params[:category_id])
    end
    if params[:concept]
      @expenses = Expense.where(:concept => params[:concept])
    end
    if params[:concept] == "" and params[:category_id]
      @expenses = Expense.where(:category_id => params[:category_id])
    end
    if params[:category_id]
      @expenses = Expense.where(:category_id => params[:category_id])
    end
    if params[:concept] == "" and params[:category_id] == ""
      @expenses = Expense.order("date DESC")
    end

    # @expenses = Expense.order("date DESC")
    # @expenses = Expense.where(:concept => text_field_tag)
    # @search = params[:expense]
  end
end

# if params[:concept] and params[:category_id]
#   @expenses = Expense.where(:concept => params[:concept]).where(:category_id => params[:category_id])
# elsif params[:concept] and params[:category_id] == nil
#   @expenses = Expense.where(:concept => params[:concept])
# elsif params[:concept] == nil and params[:category_id]
#   @expenses = Expense.where(:category_id => params[:category_id])
# else
#   @expenses = Expense.order("date DESC")
# end
