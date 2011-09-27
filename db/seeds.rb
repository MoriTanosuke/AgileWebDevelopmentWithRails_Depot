# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
Product.delete_all
Product.create(:title => 'Product Title #1', :description => %{This is a simple product.}, :image_url => '/ruby.jpg', :price => 123.45)
Product.create(:title => 'Product Title #2', :description => %{This is a simple product.}, :image_url => '/ruby2.jpg', :price => 123.45)
