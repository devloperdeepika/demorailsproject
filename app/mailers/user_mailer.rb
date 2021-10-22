class UserMailer < ApplicationMailer
  def new_stock_email(stock)
    @stock = stock
    mail(to: User.pluck(:email), subject: 'Simple Demo to showcase Active Job')
  end


end
