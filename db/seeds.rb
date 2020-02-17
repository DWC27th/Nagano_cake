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
  ['0', '山田', 'ヤマダ', '太郎', 'タロウ', '1231111', '大阪府大阪市中央区', 'a@a', 'aaaaaa', '09011112222', ""],
  ['0', '渡辺', 'ワタナベ', '花子', 'ハナコ', '1232222', '大阪府大阪市阿倍野区', 'b@b', 'bbbbbb', '09033334444', ""],
  ['0', '田中', 'タナカ', '徹郎', 'テツロウ', '1233333', '大阪府大阪市天王寺区', 'c@c', 'cccccc', '09055556666', ""],
  ['0', '鈴木', 'スズキ', '徹子', 'テツコ', '1234444', '大阪府大阪市浪速区', 'd@d', 'dddddd', '09077778888', ""]
].each do |a, b, c, d, e, f, g, h, i, j, k|
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
      phone_number: j,
      deleted_at: k
      }
    ]
  )
end


[
  ['ケーキ', '0'],
  ['プリン', '0'],
  ['焼き菓子', '0'],
  ['キャンディ', '0']
].each do |a, b|
  Genre.create!(
    [
      {
      name: a,
      published_status: b
      }
    ]
  )
end


[
  ['ケーキ', 'ケーキ1', 'これはケーキ1です', '670', './app/assets/images/cake1.jpg', '0'],
  ['ケーキ', 'ケーキ2', 'これはケーキ2です', '1098', './app/assets/images/cake2.jpg', '0'],
  ['ケーキ', 'ケーキ3', 'これはケーキ3です', '990', './app/assets/images/cake3.jpg', '0'],
  ['ケーキ', 'ケーキ4', 'これはケーキ4です', '2980', './app/assets/images/cake4.jpg', '0'],
  ['ケーキ', 'ケーキ5', 'これはケーキ5です', '3980', './app/assets/images/cake5.jpg', '0'],
  ['プリン', 'プリン1', 'これはプリン1です', '290', './app/assets/images/pudding1.jpg', '0'],
  ['プリン', 'プリン2', 'これはプリン2です', '320', './app/assets/images/pudding2.jpg', '0'],
  ['プリン', 'プリン3', 'これはプリン3です', '198', './app/assets/images/pudding3.jpg', '0'],
  ['プリン', 'プリン4', 'これはプリン4です', '498', './app/assets/images/pudding4.jpg', '0'],
  ['プリン', 'プリン5', 'これはプリン5です', '720', './app/assets/images/pudding5.jpg', '0'],
  ['焼き菓子', '焼き菓子1', 'これは焼き菓子1です', '398', './app/assets/images/yakigashi1.jpg', '0'],
  ['焼き菓子', '焼き菓子2', 'これは焼き菓子2です', '730', './app/assets/images/yakigashi2.jpg', '0'],
  ['焼き菓子', '焼き菓子3', 'これは焼き菓子3です', '498', './app/assets/images/yakigashi3.jpg', '0'],
  ['焼き菓子', '焼き菓子4', 'これは焼き菓子4です', '998', './app/assets/images/yakigashi4.jpg', '0'],
  ['焼き菓子', '焼き菓子5', 'これは焼き菓子5です', '198', './app/assets/images/yakigashi5.jpg', '0'],
  ['キャンディ', 'キャンディ1', 'これはキャンディ1です', '298', './app/assets/images/candy1.jpg', '0'],
  ['キャンディ', 'キャンディ2', 'これはキャンディ2です', '99', './app/assets/images/candy2.jpg', '0'],
  ['キャンディ', 'キャンディ3', 'これはキャンディ3です', '690', './app/assets/images/candy3.jpg', '0'],
  ['キャンディ', 'キャンディ4', 'これはキャンディ4です', '498', './app/assets/images/candy4.jpg', '0'],
  ['キャンディ', 'キャンディ5', 'これはキャンディ5です', '99999', './app/assets/images/candy5.jpg', '0']
].each do |a, b, c, d, e, f|
  ShopItem.create!(
    [
      {
      genre_id: "#{Genre.find_by(name: a).id}",
      name: b,
      introduction: c,
      price: d,
      image: File.open(e),
      sale_status: f
      }
    ]
  )
end

