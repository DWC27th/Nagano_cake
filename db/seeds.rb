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
  ['1', '太郎', 'タロウ', '山田', 'ヤマダ', '123-1111', '大阪府大阪市中央区', 'a@a', 'aaaaaa', '090-1111-2222'],
  ['1', '花子', 'ハナコ', '渡辺', 'ワタナベ', '123-2222', '大阪府大阪市阿倍野区', 'b@b', 'bbbbbb', '090-3333-4444'],
  ['1', '徹郎', 'テツロウ', '田中', 'タナカ', '123-3333', '大阪府大阪市天王寺区', 'c@c', 'cccccc', '090-5555-6666'],
  ['1', '徹子', 'テツコ', '鈴木', 'スズキ', '123-4444', '大阪府大阪市浪速区', 'd@d', 'dddddd', '090-7777-8888']
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