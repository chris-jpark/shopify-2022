json.extract! inventory, :id, :item_name, :location_type, :quantity, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
