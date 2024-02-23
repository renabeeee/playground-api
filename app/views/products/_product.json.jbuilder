json.id product.id
json.name product.name
json.price product.price
json.is_discounted? product.is_discounted?
json.tax product.tax
json.total product.total
json.product_images product.product_images
json.description product.description
json.created_at product.created_at
json.updated_at product.updated_at
json.product_images do
  json.url product.product_images.url
end
