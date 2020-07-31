class Size < ActiveHash::Base
  
  self.data = [ {id: 1, name: 'Sサイズ'}, {id: 2, name: 'Mサイズ'}, {id: 3, name: 'Lサイズ'}]

  include ActiveHash::Associations
  has_many :products

end
