class OrderDetail < ApplicationRecord
  enum :production_status   ,{ 製作不可: 1, 製作待ち: 2, 製作中: 3, 製作完了: 4 }
end
