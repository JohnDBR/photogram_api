class Post < ApplicationRecord
  validates :title, :description, presence: true, on: :create

  before_save :format_downcase

  belongs_to :user
  belongs_to :picture, optional: true, dependent: :destroy

  def self.search(search)
    categ = if categories[search].nil? then search else categories[search] end
    where("title LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%").order("created_at DESC")
  end

  protected
  def format_downcase
    self.title.downcase!
    self.description.downcase!
  end
end
