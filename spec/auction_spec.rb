require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  it 'exist' do
    auction = Auction.new
  expect(auction).to be_an_instance_of(Auction)
  end

  it ' has readable attributes' do
    auction = Auction.new
  expect(auction.items).to eq([])
  end

  it 'can add items to empty array' do
    auction = Auction.new

    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    auction.add_item(item1)
    auction.add_item(item2)

  expect(auction.items).to eq([item1, item2])
  end

  it 'can output item names' do
    auction = Auction.new

    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    auction.add_item(item1)
    auction.add_item(item2)

  expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

  it 'can determine unpopular items' do
    auction = Auction.new

    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)

  expect(auction.unpopular_items).to eq([item2, item3, item5])
  end

end
