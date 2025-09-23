class LineItemDate < ApplicationRecord
  belongs_to :quote

  after_create_commit -> {broadcast_prepend_to [quote, 'line_item_dates'], target: 'line_item_dates'}
end
