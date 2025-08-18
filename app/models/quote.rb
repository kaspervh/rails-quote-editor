class Quote < ApplicationRecord
  validates :name, presence: :true

  after_create_commit -> { broadcast_prepend_to "quotes" }
  after_update_commit -> { broadcast_replace_to "quotes" }
  after_destroy_commit -> { broadcast_destroy_to "quotes" }
end
