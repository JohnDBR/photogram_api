class User < ApplicationRecord
  has_secure_password

  validates :email, :username, presence: true, uniqueness: true
  validates :password, :email, :name, presence: true, on: :create

  before_save :format_downcase

  has_many :tokens, dependent: :destroy

  def self.search(search)
    where("email LIKE ? OR username LIKE ?", "%#{search}%", "%#{search}%").order("created_at DESC")
  end

  protected 
    def format_downcase
      self.name.downcase!
      self.email.downcase!
      self.username.downcase!
    end
end
