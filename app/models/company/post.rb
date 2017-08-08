class Company::Post

  include Mongoid::Document
  include Mongoid::Timestamps

  field :description, type: String
  field :receiver_id, type: Array, default: []
  field :for_team, type: Boolean, default: false

  belongs_to :team, index: true, :class_name => 'Company::Team'
  belongs_to :user, index: true, :class_name => 'User'
  has_many :likes, :class_name => 'User::Like', as: :likeable, dependent: :destroy
  has_many :comments, :class_name => 'User::Comment', dependent: :destroy

  validates :user, :team, :description, presence: true
end