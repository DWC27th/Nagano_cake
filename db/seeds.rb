# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
   email: 'a@a',
   password: 'aaaaaa'
)


[
  ['0', '山田', 'ヤマダ', '太郎', 'タロウ', '123-1111', '大阪府大阪市中央区', 'a@a', 'aaaaaa', '090-1111-2222'],
  ['0', '渡辺', 'ワタナベ', '花子', 'ハナコ', '123-2222', '大阪府大阪市阿倍野区', 'b@b', 'bbbbbb', '090-3333-4444'],
  ['0', '田中', 'タナカ', '徹郎', 'テツロウ', '123-3333', '大阪府大阪市天王寺区', 'c@c', 'cccccc', '090-5555-6666'],
  ['0', '鈴木', 'スズキ', '徹子', 'テツコ', '123-4444', '大阪府大阪市浪速区', 'd@d', 'dddddd', '090-7777-8888']
].each do |a, b, c, d, e, f, g, h, i, j|
  Member.create!(
    [
      {
      member_status: a,
      last_name: b,
      last_name_kana: c,
      first_name: d,
      first_name_kana: e,
      postal_code: f,
      address: g,
      email: h,
      password: i,
      phone_number: j
      }
    ]
  )
end


[
  ['1', 'クレジットカード', '東京太郎', 'aaa-aaaa', '東京都千代田区', '0', '800'],
  ['2', 'クレジットカード', '東京次郎', 'bbb-bbbb', '東京都新宿区', '0', '800'],
  ['3', 'クレジットカード', '東京三郎', 'ccc-cccc', '東京都世田谷区', '0', '800'],
  ['4', 'クレジットカード', '東京四郎', 'ddd-dddd', '東京都港区', '0', '800']
].each do |a, b, c, d, e, f, g|
  Order.create!(
    [
      {
      member_id: a,
      payment_method: b,
      name: c,
      postal_code: d,
      address: e,
      order_status: f,
      shipping_fee: g
      }
    ]
  )
end

[
  ['1', '京都　A子', 'AAA-AAAA', '京都府A区'],
  ['2', '京都　B子', 'BBB-BBBB', '京都府B区'],
  ['3', '京都　C子', 'CCC-CCCC', '京都府C区'],
  ['4', '京都　D子', 'DDD-DDDD', '京都府D区']
].each do |a, b, c, d|
  ShippingAddress.create!(
    [
      {
      member_id: a,
      name: b,
      postal_code: c,
      address: d
      }
    ]
  )
end











