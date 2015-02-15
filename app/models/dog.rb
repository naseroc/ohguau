class Dog < ActiveRecord::Base
  belongs_to :user
  belongs_to :breed
  belongs_to :city
  belongs_to :age
  has_many :interactions, :foreign_key => :mydog_id

end
