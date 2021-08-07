require 'rails_helper'

RSpec.describe Test, type: :model do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:max_ttfb) }
  it { is_expected.to validate_presence_of(:max_tti) }
  it { is_expected.to validate_presence_of(:max_speed_index) }
  it { is_expected.to validate_presence_of(:max_ttfp) }
  it { is_expected.to validate_presence_of(:ttfb) }
  it { is_expected.to validate_presence_of(:ttfp) }
  it { is_expected.to validate_presence_of(:tti) }
  it { is_expected.to validate_presence_of(:speed_index) }
end
