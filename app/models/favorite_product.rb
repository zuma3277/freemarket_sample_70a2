class FavoriteProduct < ApplicationRecord
  
  belong_to :user
  belong_to :products
  
end
