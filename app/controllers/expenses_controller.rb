class ExpensesController < ApplicationController
  def index
	@expenses = Expense.order("date DESC")
	@expenses = Expense.where(user_id: current_user.id)



	if user_signed_in? 

		if params[:concept].present?
		  @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")       
		end
		if params[:category_id].present?
		  @expenses = @expenses.where("category_id = ?", params[:category_id])
		end 

	else
		redirect_to new_user_session_path
	end

  end

end
