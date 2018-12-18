class AccountsController < ApplicationController

  def dashboard
    @user = User.find(params[:id])
    @account_details = Account.where(:user_id =>params[:id]).first
    @transactions =  @account_details.transactions if !@account_details.nil?
  end

  def transactions
    @account = Account.find(params[:id])
    @transactions = Transaction.new
  end

  def create_transaction
    @account = Account.find(params[:id])
    @transaction = Transaction.new(transaction_params)
    @transaction.account_id = @account.id
    @transaction.save
    if @transaction.transaction_type == 'credit'
      @account.amount += @transaction.amount
    elsif @transaction.transaction_type == 'debit'
      @account.amount -= @transaction.amount
    end
    @account.save
    redirect_to :action => "dashboard",:controller => "accounts",id: @account.user_id
  end

end
