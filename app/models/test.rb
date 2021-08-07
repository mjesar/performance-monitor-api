class Test < ApplicationRecord
  validates :url, presence: true
  validates :max_ttfb, presence: true
  validates :max_tti, presence: true
  validates :max_speed_index, presence: true
  validates :max_ttfp, presence: true
  validates :ttfb, presence: true
  validates :ttfp, presence: true
  validates :tti, presence: true
  validates :speed_index, presence: true
end
