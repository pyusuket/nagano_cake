class Order < ApplicationRecord
  enum payment_method: { credit_card: 0 , transfer: 1 }
  enum order_status:   { wait: 0 , confirm: 1 , production: 2 , preparation: 3 , completion: 4 }
  has_many :order_details
end
