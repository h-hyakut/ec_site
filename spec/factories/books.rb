FactoryBot.define do
  factory :book do
    title { "テスト用本" }
    author { "テスト太郎" }
    publushed_on { "1981-09-01" }
    showing { true }
    price { 1020 }
  end
end