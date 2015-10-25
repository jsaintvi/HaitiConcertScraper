class Movie < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :hotness, :numericality => {:allow_blank => true}

  # validates url with help of valiate_url gem
  validates :image_url, :url => {:allow_blank => true}

end
