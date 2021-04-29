class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  belongs_to :category
  belongs_to :products_states
  belongs_to :shipping
  belongs_to :Admins_information
  belongs_to :arrival_date
  has_one_attached :image
  
  

  with_options presence: true do
  validates :products_name
  validates :comments
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999},

  end
  validates :category_id, :products_states_id, :shipping_id, :admins_information_id, :arrival_date_id, numericality: { other_than: 1 } 
 end
