FactoryBot.define do
  factory :test do
    url { "MyString" }
    max_ttfb { 1 }
    max_tti { 1 }
    max_speed_index { 1 }
    max_ttfp { 1 }
    ttfb { 1 }
    tti { 1 }
    speed_index { 1 }
    ttfp { 1 }
    passed { false }
  end
end
