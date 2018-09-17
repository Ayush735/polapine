class Amenity < ApplicationRecord
	AMENTIES_LIST = ['Bed','Sofa','Tabel','Gas Stand','Geyser','Wash Basin','Window','Curtains','Chair','Gallery','TV','WiFi','Washing Machine','Refrigerator', 'Induction','Microwave','RO','Parking','AC','Cooler','Fan','Wardrobe','shoe_rake','charging_plug']
  belongs_to :room
  validates :name, presence: true, uniquness:true
end
