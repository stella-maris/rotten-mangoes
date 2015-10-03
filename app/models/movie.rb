class Movie < ActiveRecord::Base
  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_future

  mount_uploader :image, ImageUploader

  
  scope:search_by_title, -> (search){ where("title LIKE ?", "%#{search}%")}
  scope:search_by_director, -> (search){ where("director LIKE ?", "%#{search}%")}
    # where("runtime_in_minutes LIKE ?", "%#{params[:runtime_in_minutes]}%")

  def review_average
    reviews.sum(:rating_out_of_five)/reviews.size if reviews.size > 0
  end

  protected

  def release_date_is_in_the_future
    if release_date.present?
      errors.add(:release_date, "should probably be in the future") if release_date < Date.today
    end
  end
end
