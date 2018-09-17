# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  PropertyType.create(PropertyType::PROPERTY_TYPES.map{|name| { name: name } })
   
  Amenity.create(Amenity::AMENTIES_LIST.map{|name| { name: name } })
   
  FernishingType.create(FernishingType::FURNISHING_ROOM_TYPE.map{|name| { name: name } })

  SharingType.create(SharingType::SHARING_ROOM_TYPE.map{|name| { name: name } })
   	
  TenantType.create(TenantType::TENANT_TYPE.map{|name| { name: name } })

	Expence.create(Expence::EXPENCES_LIST.map{|name| { name: name } })
   	
	Role.create(Role::ROLE_LIST.map{|name| { name: name } })

  BathType.create(BathType::BATH_TYPE_LIST.map{|name|{name: name}})