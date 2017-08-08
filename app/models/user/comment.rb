class User::Comment

  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String

  belongs_to :post, :class_name => 'Company::Post'
  belongs_to :user, :class_name => 'User'
  has_many :subcomments, class_name: "User::Comment", foreign_key: "parent_comment_id", dependent: :destroy
  belongs_to :parent_comment, class_name: "User::Comment", foreign_key: "parent_comment_id"

  validates :description, presence: true

end


