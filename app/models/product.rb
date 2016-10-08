class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true

  validates :price, numericality:
    {greater_than_or_equal_to: 1}

  validates :title, uniqueness: true, length: {minimum: 10}

  validates_length_of :title, minimum: 10, too_short: 'Please enter at least 10 characters'

  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'Must be a URL for GIF, JPG or PNG image.'
  }
end
