class CartesianProduct
  include Enumerable
  
  def initialize(product1, product2)
    @product = []
    unless product1.empty? or product2.empty?
      product1.each do |item1|
        product2.each do |item2|
          @product << [item1, item2]
        end
      end
    end
  end
  
  def each
    @product.each do |item|
      yield item
    end
  end
end