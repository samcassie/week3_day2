require('pry')
require_relative('models/house.rb')


house1 = House.new({
        'address' => '46 George Terrace',
        'value' => 250000,
        'number_of_bedrooms' => 5,
        'build' => 'detached'
})

house2 = House.new({
        'address' => '11 Clochbar Gardens',
        'value' => 78000,
        'number_of_bedrooms' => 3,
        'build' => 'semi-detached'
})

house3 = House.new({
        'address' => '14 Church Road',
        'value' => 100000,
        'number_of_bedrooms' => 4,
        'build' => 'flat'
})

house1.save()
house2.save()
house3.save()

binding.pry
nil

properties = House.all()

house1.delete()

binding.pry
nil
