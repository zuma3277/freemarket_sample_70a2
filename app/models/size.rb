class Size < ApplicationRecord
  has_many :products
  
  enum size: {Sサイズ: 1, Mサイズ: 2, Lサイズ: 3}

end
