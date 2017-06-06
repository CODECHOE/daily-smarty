class Theme < ApplicationRecord
  belongs_to :post
  belongs_to :topic

  accepts_nested_attributes_for :topic, reject_if: :all_blank
end
