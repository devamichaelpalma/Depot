require 'test_helper'



class ProductTest < ActiveSupport::TestCase
   fixtures :products
  test "Title already taken. Please create a unique title." do
    product = Product.new(title:
      products(:leslie).title,
      description: "yyy",
      price: 1,
      image_url: "leslie.gif")
    assert product.invalid?
    assert_equal ["has already been taken"],
    product.errors[:title]
  end

  test "Product Attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end
  test "product price must be positive" do
    product = Product.new(title: "Something",
      description: "xyz",
      image_url: "zzz.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 1"],
    product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 1"],
    product.errors[:price]

    product.price = 2
    assert product.valid?
  end
  def new_product(image_url)
    Product.new(title: "Image",
      description: "zyx",
      price: 1,
      image_url: image_url)
  end
  test "image_url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
      http://a.b.c/x/y/z/fred.gif}
    bad = %w{ fred.doc fred.gif/more fred.gif.more}
    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} is invalid"
    end
  end
end