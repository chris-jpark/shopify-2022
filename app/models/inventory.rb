class Inventory < ApplicationRecord
  LOCATION_TYPES = ["Toronto", "Montreal", "Vancouver"]
  validates :item_name, length: { minimum: 1 }
  validates :date_added, length: { minimum: 1 }

  def self.between_range(searchmin, searchmax)
    scope :between_range, -> (min, max){
      where("quantity >= ? AND quantity <= ?", min, max)
    }
  end

  def self.largerthan(searchmin)
    scope :largerthan, -> (min){
      where("quantity >= ?", min)
    }
  end
end
