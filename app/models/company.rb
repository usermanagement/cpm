class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String

  has_many :users
  has_many :teams, :class_name => 'Company::Team', dependent: :destroy
end