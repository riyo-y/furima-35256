class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :products_states
  belongs_to :shipping
  belongs_to :Admins_information
  belongs_to :arrival_date
  has_one_attached :image

  #validates :category, :products_states, :shipping, :admins_information, :presence : true
  
  validates :category_id, :products_states_id, :shipping_id, :admins_information_id, :arrival_date_id, numericality: { other_than: 1 } 
 
end 