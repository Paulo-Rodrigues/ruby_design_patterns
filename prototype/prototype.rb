# Without prototype

class ProductDefinition
  def create_product
    @product = Product.new(
      product_definition_name: self.name,
      properties: self.properties,
      active: self.active?,
      category: self.category
    )
  end
end

class Product
end

# With Prototype

class Product
  def clone(product_definition)
    Product.new(
      self.product_definition_name(product_definition),
      self.properties,
      self.active?,
      self.category
    )
  end
end

product_prototype = Product.new
product_instance_a = product_prototype.clone("Telescope")
product_instance_b = product_prototype.clone("Light Saber")
