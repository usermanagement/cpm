class User::Like

  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user, :class_name => 'User'
  belongs_to :comment, :class_name => 'User::Comment'
  belongs_to :post, :class_name => 'Company::Post'
  belongs_to :likeable, polymorphic: true

  validates :user, presence: true
  validates_uniqueness_of :post_id, :case_sensitive => false, scope: :employee_id

end
