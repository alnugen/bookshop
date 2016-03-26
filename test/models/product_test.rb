require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(
      title: "Test Title",
      description: "Just a description.",
    image_url: "test_image.jpg")

    product.price = -1
    assert product.invalid?
    assert_equal ['must be greate than or equal to 0.01'],
      product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ['must be greate than or equal to 0.01'],
      product.errors[:price]

    product.price = 10
    assert product.valid?
  end

  def new_product(image_url)
    product = Product.new(
      title: "Test Title",
      description: "Test Description",
      price: 15,
    image_url: image_url)
  end

  test "image url" do
    ok = %w{test.gif test.jpg test.png http://a.b.c.x/y/z/test.jpg}

    bad = %w{test.doc test.txt}

    ok.each do |name|
      assert new_product(name).valid?, "#{name} should be valid."
    end
    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid."
    end

  end

  test "product is not valid without a unique title" do
    product = Product.new(title:
                          products(:ruby).title,
                          description: "yyy",
                          price:
                          1,
                          image_url:
                          "fred.gif")
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:title]
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(title:
                          products(:ruby).title,
                          description: "yyy",
                          price:
                          1,
                          image_url:
                          "fred.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
      product.errors[:title]
  end

  test "product is not valid with title length less than 10" do
  	product = Product.new(
                          description: "yyy",
                          price:
                          1,
                          image_url:
                          "fred.gif")
  	product.title = "Test"
  	assert product.invalid?
  	assert_equal ["length must be greater than 10"],
  	product.errors[:title]

  end

end
