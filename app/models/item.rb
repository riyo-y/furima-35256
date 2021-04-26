class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :products_states
  belongs_to :shipping
  belongs_to :Admins_infomation
  belongs_to :arrival_date

  validates :category, : true
  validates :products_states, : true
  validates :shipping, : true
  validates :Admins_infomation, : true
  validates :presence , : true
  
  validates :category_id,
  validates :products_states_id,
  validates :shipping_id,
  validates :Admins_infomation_id,
  validates :arrival_date_id,numericality: { other_than: 1 } 
 
end