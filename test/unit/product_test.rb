require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def new_product(image_url)
    Product.new(:title => 'Product', :description => %{A description}, :image_url => image_url, :price => 0.01)
  end

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?, product.errors[:title].join('; ')
    assert product.errors[:description].any?, product.errors[:description].join('; ')
    assert product.errors[:image_url].any?, product.errors[:image_url].join('; ')
    assert product.errors[:price].any?, product.errors[:price].join('; ')
  end

  test "product has unique title" do
    product = Product.new(:title => products(:ruby).title, :description => %{short description}, :image_url => 'ruby.jpg', :price => 0.01)
    assert !product.save
  end

  test "price must be positive" do
    product = new_product '/ruby.jpg'
    product.price = 0.00
    assert product.invalid?
    assert product.errors[:price].any?
    product.price = -1
    assert product.invalid?
    assert product.errors[:price].any?
    product.price = 0.01
    assert product.valid?
    assert product.errors[:price].none?
  end

  test "image url has valid extension" do
    ok = %w{ ruby.png /ruby.jpg http://local/test.gif }
    bad = %w{ false.doc http://a/b/c.png/more c.png.exe }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end
end
