class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #  :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable

  has_many :transactions

  def as_json(options={})
    {
      id: self.id,
      email: self.email
    }
  end
end
