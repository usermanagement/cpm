class Company::Team

  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String

  belongs_to :company, :class_name => 'Company'
  has_many :posts, :class_name => 'Company::Post'
  
end