class FavoriteProduct < ApplicationRecord
  
  belong_to :user
  belong_to :product
  
end
