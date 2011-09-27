class Product < ActiveRecord::Base
  validates :title, :description, :image_url, :presence => true
  validates :title, :uniqueness => true, :length => {
    :minimum => 10
  }
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :image_url, :allow_blank => false, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'Must be of type .gif/.jpg/.png'
  }
end
