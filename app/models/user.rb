class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #  :recoverable, :rememberable, :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :transactions, dependent: :destroy

  def as_json(options={})
    {
      id: self.id,
      email: self.email,
      token: self.authentication_token
    }
  end

  def get_expenses_sum
    self.transactions.where(amount_type: 0).sum(:amount)
  end

  def get_incomes_sum
    self.transactions.where(amount_type: 1).sum(:amount)
  end

  def today_expenses(today)
    self.transactions.where(amount_type: 0).where("DATE(created_at) = ?", today).sum(:amount)
  end

  def today_incomes(today)
    self.transactions.where(amount_type: 1).where("DATE(created_at) = ?", today).sum(:amount)
  end

end
