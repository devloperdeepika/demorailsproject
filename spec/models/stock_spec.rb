require 'rails_helper'

RSpec.describe Stock, type: :model do
  it "is not valid without a name" do
    stock = Stock.new(name: nil)
    expect(stock).to_not be_valid
   
  end
  it "is not valid without a price" do
    stock = Stock.new(price: nil)
    expect(stock).to_not be_valid
  end
 context 'ActiveRecord associations' do
    it 'belongs to user' do
      expect(Stock.reflect_on_association(:user).macro).to be (:belongs_to)
    end
  end


  # describe "GET #new" do
  #   it "should render products#new template" do
  #   end
  # end
end

