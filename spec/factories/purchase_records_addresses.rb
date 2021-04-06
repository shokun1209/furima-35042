FactoryBot.define do
  factory :purchase_record_address do
    token {'tok_abcdefghijk00000000000000000'}
    postal_code {'123-4567'}
    area_id {10}
    municipality {Gimei.city.kanji}
    address {'翔君10-20'}
    building { '翔君ビル A棟 401号'}
    tell { 12345678901 }
    user_id {1}
    item_id {1}
  end
end
