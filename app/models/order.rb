class Order < ApplicationRecord
  enum :payment_method ,{ 銀行振込: 1, クレジットカード: 2 }
  enum :order_status   ,{ 入金待ち: 1, 入金確認: 2, 製作中: 3, 発送準備中: 4, 発送済み: 5 }
end
