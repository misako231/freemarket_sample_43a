require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  #ユーザーの初期データ
User.create!(last_name: "田中", first_name: "太郎", last_name_kana: "タナカ", first_name_kana: "タロウ", birth_y: 2000, birth_m: 12, birth_d: 20, email: "mercari@mail.com", password: "password", password_confirmation: "password", nickname: "メルカリ")
Profile.create!(phone: 11122223333, postal_code: 1234567, prefecture_id: 27, city: '大阪市北区', block: '梅田1-2-3', user_id: 1)
PointRecord.create!(point: -10000, user_id: 1)

ApplicationRecord.transaction do
  #categoryの登録
  women, mens, baby, interior, books, toys, cosmetics, electronics, sports, hand_made, tickets, automobile, others = Category.create([{ name: "レディース"}, { name: "メンズ" }, { name: "ベビー・キッズ" }, { name: "インテリア・住まい・小物" }, { name: "本・音楽・ゲーム" }, { name: "おもちゃ・ホビー・グッズ" }, { name: "コスメ・香水・美容" }, { name: "家電・スマホ・カメラ" }, { name: "スポーツ・レジャー" }, { name: "ハンドメイド" }, { name: "チケット" }, { name: "自動車・オートバイ" }, { name: "その他" }])

  # レディース
  tops, outer, pants, skirt, one_piece, shoes, roomware, leg_wear, hat, bag, accessory, hair_accessory, goods, watch, wig, swimwear, suit, maternity, woman_others = women.children.create([{ name: "トップス" }, { name: "ジャケット/アウター" }, { name: "パンツ" }, { name: "スカート" }, { name: "ワンピース" }, { name: "靴" }, { name: "ルームウェア/パジャマ" }, { name: "レッグウェア" }, { name: "帽子" }, { name: "バッグ" }, { name: "アクセサリー" }, { name: "ヘアアクセサリー" }, { name: "小物" }, { name: "時計" }, { name: "ウィッグ/エステ" }, { name: "浴衣/水着" }, { name: "スーツ/フォーマル/ドレス" }, { name: "マタニティ" }, { name: "その他" }])

  # レデイース・トップス
  t_shirt_short_sleeve, t_shirt_long_sleeve, shirt_short_sleeve, shirt_long_sleeve, polo_shirt, camisole, tanktop, halter_neck, knit, tunic, cardigan, ensemble, vest, hoodie, sweatshirt, bare_top, jogging_suits, other = tops.children.create([{ name: "Tシャツ/カットソー(半袖/袖なし)" }, { name: "Tシャツ/カットソー(七分/長袖)" }, { name: "シャツ/ブラウス(半袖/袖なし)" }, { name: "シャツ/ブラウス(七分/長袖)" }, { name: "ポロシャツ" }, { name: "キャミソール" }, { name: "タンクトップ" }, { name: "ホルターネック" }, { name: "ニット/セーター" }, { name: "チュニック" }, { name: "カーディガン/ボレロ" }, { name: "アンサンブル" }, { name: "ベスト/ジレ" }, { name: "パーカー" }, { name: "トレーナー/スウェット" }, { name: "ベアトップ/チューブトップ" }, { name: "ジャージ" }, { name: "その他" }])

  # レデイース・Tシャツ/カットソー(半袖/袖なし)・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = t_shirt_short_sleeve.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・Tシャツ/カットソー(七分/長袖)・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = t_shirt_long_sleeve.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・シャツ/ブラウス(半袖/袖なし)・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = shirt_short_sleeve.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・シャツ/ブラウス(七分/長袖)・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = shirt_long_sleeve.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ポロシャツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = polo_shirt.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・キャミソール・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = camisole.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・タンクトップ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = tanktop.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ホルターネック・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = halter_neck.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ニット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = knit.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・チュニック・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = tunic.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・カーディガン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = cardigan.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・アンサンブル・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = ensemble.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ベスト・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = vest.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・パーカー・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = hoodie.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・スウェット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = sweatshirt.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ベアトップ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = bare_top.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ジャージ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = jogging_suits.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・トップス・その他・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = other.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・アウター
  tailored_jacket, collarless_jacket, denim_jacket, leather_jacket, down_jacket, riders_jacket, military_jacket, down_vest, blouson, poncho, long_coat, trench_coat, duffle_coat, pea_coat, chester_coat, mods_coat, varsity_jacket, fur_coat, spring_coat, sukajan, other = outer.children.create([{ name: "テーラードジャケット" }, { name: "ノーカラージャケット" }, { name: "Gジャン/デニムジャケット" }, { name: "レザージャケット" }, { name: "ダウンジャケット" }, { name: "ライダースジャケット" }, { name: "ミリタリージャケット" }, { name: "ダウンベスト" }, { name: "ジャンパー/ブルゾン" }, { name: "ポンチョ" }, { name: "ロングコート" }, { name: "トレンチコート" }, { name: "ダッフルコート" }, { name: "ピーコート" }, { name: "チェスターコート" }, { name: "モッズコート" }, { name: "スタジャン" }, { name: "毛皮/ファーコート" }, { name: "スプリングコート" }, { name: "スカジャン" }, { name: "その他" }])

  # レデイース・テーラードジャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = tailored_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ノーカラージャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = collarless_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・Gジャン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = denim_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・レザージャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = leather_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ダウンジャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = down_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ライダースジャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = riders_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ミリタリージャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = military_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ダウンベスト・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = down_vest.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ジャンパー・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = blouson.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ポンチョ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = poncho.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ロングコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = long_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・トレンチコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = trench_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ダッフルコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = duffle_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ピーコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = pea_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・チェスターコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = chester_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・モッズコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = mods_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・スタジャン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = varsity_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・毛皮/ファー・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = fur_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・スプリングコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = spring_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・スカジャン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = sukajan.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・アウター・その他・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = other.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  #レディース・パンツ
  jeans, short_pants, casual_pants, half_pants, chino_pants, cargo_pants, cropped_pants, salopet, all_in_one, saruel_pants, gaucho_pants, other = pants.children.create([{ name: "デニム/ジーンズ" }, { name: "ショートパンツ" }, { name: "カジュアルパンツ" }, { name: "ハーフパンツ" }, { name: "チノパン" }, { name: "ワークパンツ/カーゴパンツ" }, { name: "クロップドパンツ" }, { name: "サロペット/オーバーオール" }, { name: "オールインワン" }, { name: "サルエルパンツ" }, { name: "ガウチョパンツ" }, { name: "その他" }])

  # レデイース・デニム/ジーンズ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = jeans.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ショートパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = short_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・カジュアルパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = casual_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ハーフパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = half_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・チノパン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = chino_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ワークパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = cargo_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・クロップドパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = cropped_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・サロペット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = salopet.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・オールインワン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = all_in_one.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・サルエルパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = saruel_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ガウチョパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = gaucho_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・パンツ・その他・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = other.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・スカート
  mini_skirt, knee_length_skirt, long_skirt, culottes, other = skirt.children.create([{ name: "ミニスカート" }, { name: "ひざ丈スカート" }, { name: "ロングスカート" }, { name: "キュロット" }, { name: "その他" }])

  # レデイース・ミニスカート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = mini_skirt.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ひざ丈スカート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = knee_length_skirt.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ロングスカート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = long_skirt.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・キュロット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = culottes.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・スカート・その他・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = other.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・ワンピース
  mini_one_piece, knee_length_one_piece, long_one_piece, other = one_piece.children.create([{ name: "ミニワンピース" }, { name: "ひざ丈ワンピース" }, { name: "ロングワンピース" }, { name: "その他" }])

  # レデイース・ミニワンピース・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = mini_one_piece.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ひざ丈ワンピース・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = knee_length_one_piece.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ロングワンピース・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = long_one_piece.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ワンピース・その他・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = other.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・靴
  high_heels, boots, sandals, sneakers, mule, moccasin, loafer, flat_shoes, rain_shoes, other = shoes.children.create([{ name: "ハイヒール/パンプス" }, { name: "ブーツ" }, { name: "サンダル" }, { name: "スニーカー" }, { name: "ミュール" }, { name: "モカシン" }, { name: "ローファー/革靴" }, { name: " フラットシューズ/バレエシューズ" }, { name: "長靴/レインシューズ" }, { name: "その他" }])

  # レディース・ハイヒール・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = high_heels.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・ハイヒール・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = high_heels.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・ブーツ・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = boots.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・サンダル・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = sandals.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・スニーカー・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = sneakers.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・ミュール・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = mule.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・モカシン・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = moccasin.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・ローファー・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = loafer.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・フラットシューズ・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = flat_shoes.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・長靴・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = rain_shoes.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・靴・その他・サイズ
  cm_20, cm_20_5, cm_21, cm_21_5, cm_22, cm_22_5, cm_23, cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5 = other.children.create([{ name: "20cm以下" }, { name: "20.5cm" }, { name: "21cm" }, { name: "21.5cm" }, { name: "22cm" }, { name: "22.5cm" }, { name: "23cm" }, { name: "23.5cm" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm以上" }])

  # レディース・ルームウェア
  pajamas, room_wear = roomware.children.create([{ name: "パジャマ" }, { name: "ルームウェア" }])

  # レデイース・パジャマ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = pajamas.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・ルームウェア・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = room_wear.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レデイース・レッグウェア
  socks, spats, tights, leg_warmer, other = leg_wear.children.create([{ name: "ソックス" }, { name: "スパッツ/レギンス" }, { name: "ストッキング/タイツ" }, { name: "レッグウォーマー" }, { name: "その他" }])

  # レディース・帽子
  knit_cap, hat, hunting, cap, casket, straw_hat, other = hat.children.create([{ name: "ニットキャップ/ビーニー" }, { name: "ハット" }, { name: "ハンチング/ベレー帽" }, { name: "キャップ" }, { name: "キャスケット" }, { name: "麦わら帽子" }, { name: "その他" }])

  # レディース・バッグ
  handbag, tote_bag, eco_bag, backpack, boston_bag, sports_bag, shoulder_bag, clutch_bag, pouch, body_bag, mothers_bag, messenger_bag, business_bag, carry_bag, shop_bag, kimono_bag, basket_bag, other = bag.children.create([{ name: "ハンドバッグ" }, { name: "トートバッグ" }, { name: "エコバッグ" }, { name: "リュック/バックパック" }, { name: "ボストンバッグ" }, { name: "スポーツバッグ" }, { name: "ショルダーバッグ" }, { name: "クラッチバッグ" }, { name: "ポーチ/バニティ" }, { name: "ボディバッグ/ウエストバッグ" }, { name: "マザーズバッグ" }, { name: "メッセンジャーバッグ" }, { name: "ビジネスバッグ" }, { name: "旅行用バッグ/キャリーバッグ" }, { name: "ショップ袋" }, { name: "和装用バッグ" }, { name: "かごバッグ" }, { name: "その他" }])

  # レディース・アクセサリー
  necklace, bracelet, bangle, ring, piercing_one_ear, piercing_both_ears, earrings, anklet, brooch, charm, other = accessory.children.create([{ name: "ネックレス" }, { name: "ブレスレット" }, { name: "バングル/リストバンド" }, { name: "リング" }, { name: "ピアス(片耳用)" }, { name: "ピアス(両耳用)" }, { name: "イヤリング" }, { name: "アンクレット" }, { name: "ブローチ/コサージュ" }, { name: "チャーム" }, { name: "その他" }])

  # レディース・ヘアアクセサリー
  hair_rubber, hair_band, hairpin, other = hair_accessory.children.create([{ name: "ヘアゴム/シュシュ" }, { name: "ヘアバンド/カチューシャ" }, { name: "ヘアピン" }, { name: "その他" }])

  # レディース・小物
  long_wallet, folded_wallet, coin_case, business_card_holder, key_case, key_ring, gloves, handkerchief, belt, muffler, stall, bandana, neck_warmer, suspenders, glasses, mobile_case, notebook, ear_muffler, umbrella, raincoat, mirror, tabacco_goods, other = goods.children.create([{ name: "長財布" }, { name: "折り財布" }, { name: "コインケース/小銭入れ" }, { name: "名刺入れ/定期入れ" }, { name: "キーケース" }, { name: "キーホルダー" }, { name: "手袋/アームカバー" }, { name: "ハンカチ" }, { name: "ベルト" }, { name: "マフラー/ショール" }, { name: "ストール/スヌード" }, { name: "バンダナ/スカーフ" }, { name: "ネックウォーマー" }, { name: "サスペンダー" }, { name: "サングラス/メガネ" }, { name: "モバイルケース/カバー" }, { name: "手帳" }, { name: "イヤマフラー" }, { name: "傘" }, { name: "レインコート/ポンチョ" }, { name: "ミラー" }, { name: "タバコグッズ" }, { name: "その他" }])

  # レディース・時計
  analog_watch, digital_watch, rubber_belt, leather_belt, metal_belt, other = watch.children.create([{ name: "腕時計(アナログ)" }, { name: "腕時計(デジタル)" }, { name: "ラバーベルト" }, { name: "レザーベルト" }, { name: "金属ベルト" }, { name: "その他" }])

  # レディース・ウィッグ
  bang_wig, long_straight, long_curl, short_straight, short_curl, other = wig.children.create([{ name: "前髪ウィッグ" }, { name: "ロングストレート" }, { name: "ロングカール" }, { name: "ショートストレート" }, { name: "ショートカール" }, { name: "その他" }])

  # レディース・浴衣
  yukata, kimono, hurisode, Nagajuban, swimwear_separate, swimwear_one_piece, swimwear_sports, other = swimwear.children.create([{ name: "浴衣" }, { name: "着物" }, { name: "振袖" }, { name: "長襦袢/半襦袢" }, { name: "水着セパレート" }, { name: "水着ワンピース" }, { name: "水着スポーツ用" }, { name: "その他" }])

  # レディース・水着セパレート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = swimwear_separate.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・水着ワンピース・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = swimwear_one_piece.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・水着スポーツ用・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = swimwear_sports.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・スーツ
  skirt_suit, pant_suit, dress, party_bag, shoes, wedding, other = suit.children.create([{ name: "スカートスーツ上下" }, { name: "パンツスーツ上下" }, { name: "ドレス" }, { name: "パーティーバッグ" }, { name: "シューズ" }, { name: "ウェディング" }, { name: "その他" }])

  # レディース・スカートスーツ上下・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = skirt_suit.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・パンツスーツ上下・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = pant_suit.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・スーツ・ドレス・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = dress.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・マタニティ
  tops, outer, inner, one_piece, pants, skirt, pajamas, nursing_clothes, other = maternity.children.create([{ name: "トップス" }, { name: "アウター" }, { name: "インナー" }, { name: "ワンピース" }, { name: "パンツ/スパッツ" }, { name: "スカート" }, { name: "パジャマ" }, { name: "授乳服" }, { name: "その他" }])

  # レディース・マタニティ・トップス・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = tops.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・マタニティ・アウター・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = outer.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・マタニティ・インナー・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = inner.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・マタニティ・ワンピース・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = one_piece.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・マタニティ・パンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・マタニティ・スカート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = skirt.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・マタニティ・パジャマ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = pajamas.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・マタニティ・授乳服・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = nursing_clothes.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # レディース・その他
  cosplay, underwear, other = woman_others.children.create([{ name: "コスプレ" }, { name: "下着" }, { name: "その他" }])

  # メンズ
  tops, outer, pants, shoes, bag, suit, hat, accessory, goods, watch, swimwear, leg_wear, underwear, mens_others = mens.children.create([{ name: "トップス" }, { name: "ジャケット/アウター" }, { name: "パンツ" }, { name: "靴" }, { name: "バッグ" }, { name: "スーツ" }, { name: "帽子" }, { name: "アクセサリー" }, { name: "小物" }, { name: "時計" }, { name: "水着" }, { name: "レッグウェア" }, { name: "アンダーウェア" }, { name: "その他" }])

  # メンズ・トップス
  t_shirt_short_sleeve, t_shirt_long_sleeve, shirt, polo_shirt, tanktop, knit, hoodie, cardigan, sweatshirt, jogging_suits, vest, other = tops.children.create([{ name: "Tシャツ/カットソー(半袖/袖なし)" }, { name: "Tシャツ/カットソー(七分/長袖)" }, { name: "シャツ" }, { name: "ポロシャツ" }, { name: "タンクトップ" }, { name: "ニット/セーター" }, { name: "パーカー" }, { name: "カーディガン" }, { name: "スウェット" }, { name: "ジャージ" }, { name: "ベスト" }, { name: "その他" }])

  # メンズ・Tシャツ/カットソー(半袖/袖なし)・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = t_shirt_short_sleeve.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・Tシャツ/カットソー(七分/長袖)・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = t_shirt_long_sleeve.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・シャツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = shirt.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ポロシャツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = polo_shirt.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・タンクトップ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = tanktop.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ニット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = knit.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・パーカー・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = hoodie.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・カーディガン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = cardigan.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・スウェット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = sweatshirt.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ジャージ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = jogging_suits.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ベスト・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = vest.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・トップス・その他・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = other.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・アウター
  tailored_jacket, collarless_jacket, denim_jacket, leather_jacket, down_jacket, riders_jacket, military_jacket, nylon_jacket, flight_jacket, duffle_coat, pea_coat, balmacaan_coat, trench_coat, mods_coat, chester_coat, varsity_jacket, sukajan, blouson, mountain_parka, down_vest, poncho, coverall, other = outer.children.create([{ name: "テーラードジャケット" }, { name: "ノーカラージャケット" }, { name: "Gジャン/デニムジャケット" }, { name: "レザージャケット" }, { name: "ダウンジャケット" }, { name: "ライダースジャケット" }, { name: "ミリタリージャケット" }, { name: "ナイロンジャケット" }, { name: "フライトジャケット" }, { name: "ダッフルコート" }, { name: "ピーコート" }, { name: "ステンカラーコート" }, { name: "トレンチコート" }, { name: "モッズコート" }, { name: "チェスターコート" }, { name: "スタジャン" }, { name: "スカジャン" }, { name: "ブルゾン" }, { name: "マウンテンパーカー" }, { name: "ダウンべスト" }, { name: "ポンチョ" }, { name: "カバーオール" }, { name: "その他" }])

  # メンズ・テーラードジャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = tailored_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ノーカラージャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = collarless_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・Gジャン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = denim_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・レザージャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = leather_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ダウンジャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = down_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ライダースジャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = riders_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ミリタリージャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = military_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ナイロンジャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = nylon_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・フライトジャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = flight_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ダッフルコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = duffle_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ピーコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = pea_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ステンカラーコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = balmacaan_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・トレンチコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = trench_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・モッズコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = mods_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・チェスターコート・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = chester_coat.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・スタジャン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = varsity_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・スカジャン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = sukajan.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ブルゾン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = blouson.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・マウンテンパーカー・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = mountain_parka.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ダウンベスト・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = down_vest.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ポンチョ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = poncho.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・カバーオール・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = coverall.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・パンツ
  jeans, cargo_pants, slacks, chino_pants, short_pants, painter_pants, saruel_pants, overalls, other = pants.children.create([{ name: "デニム/ジーンズ" }, { name: "ワークパンツ/カーゴパンツ" }, { name: "スラックス" }, { name: "チノパン" }, { name: "ショートパンツ" }, { name: "ペインターパンツ" }, { name: "サルエルパンツ" }, { name: "オーバーオール" }, { name: "その他" }])

  # メンズ・パンツ・デニム・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = jeans.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ワークパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = cargo_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・スラックス・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = slacks.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・チノパン・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = chino_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ショートパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = short_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・ペインターパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = painter_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・サルエルパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = saruel_pants.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・オーバーオール・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = overalls.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・パンツ・その他・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = other.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・靴
  sneakers, sandals, boots, moccasin, business, rain_shoes, deck_shoes, other = shoes.children.create([{ name: "スニーカー" }, { name: "サンダル" }, { name: "ブーツ" }, { name: "モカシン" }, { name: "ドレス/ビジネス" }, { name: "長靴/レインシューズ" }, { name: "デッキシューズ" }, { name: "その他" }])

  # メンズ・スニーカー・サイズ
  cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5, cm_28, cm_28_5, cm_29, cm_29_5, cm_30, cm_30_5, cm_31 = sneakers.children.create([{ name: "23.5cm以下" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm" }, { name: "28cm" }, { name: "28.5cm" }, { name: "29cm" }, { name: "29.5cm" }, { name: "30cm" }, { name: "30.5cm" }, { name: "31cm以上" }])

  # メンズ・サンダル・サイズ
  cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5, cm_28, cm_28_5, cm_29, cm_29_5, cm_30, cm_30_5, cm_31 = sandals.children.create([{ name: "23.5cm以下" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm" }, { name: "28cm" }, { name: "28.5cm" }, { name: "29cm" }, { name: "29.5cm" }, { name: "30cm" }, { name: "30.5cm" }, { name: "31cm以上" }])

  # メンズ・ブーツ・サイズ
  cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5, cm_28, cm_28_5, cm_29, cm_29_5, cm_30, cm_30_5, cm_31 = boots.children.create([{ name: "23.5cm以下" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm" }, { name: "28cm" }, { name: "28.5cm" }, { name: "29cm" }, { name: "29.5cm" }, { name: "30cm" }, { name: "30.5cm" }, { name: "31cm以上" }])

  # メンズ・モカシン・サイズ
  cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5, cm_28, cm_28_5, cm_29, cm_29_5, cm_30, cm_30_5, cm_31 = moccasin.children.create([{ name: "23.5cm以下" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm" }, { name: "28cm" }, { name: "28.5cm" }, { name: "29cm" }, { name: "29.5cm" }, { name: "30cm" }, { name: "30.5cm" }, { name: "31cm以上" }])

  # メンズ・靴・ビジネス・サイズ
  cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5, cm_28, cm_28_5, cm_29, cm_29_5, cm_30, cm_30_5, cm_31 = business.children.create([{ name: "23.5cm以下" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm" }, { name: "28cm" }, { name: "28.5cm" }, { name: "29cm" }, { name: "29.5cm" }, { name: "30cm" }, { name: "30.5cm" }, { name: "31cm以上" }])

  # メンズ・長靴・サイズ
  cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5, cm_28, cm_28_5, cm_29, cm_29_5, cm_30, cm_30_5, cm_31 = rain_shoes.children.create([{ name: "23.5cm以下" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm" }, { name: "28cm" }, { name: "28.5cm" }, { name: "29cm" }, { name: "29.5cm" }, { name: "30cm" }, { name: "30.5cm" }, { name: "31cm以上" }])

  # メンズ・デッキシューズ・サイズ
  cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5, cm_28, cm_28_5, cm_29, cm_29_5, cm_30, cm_30_5, cm_31 = deck_shoes.children.create([{ name: "23.5cm以下" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm" }, { name: "28cm" }, { name: "28.5cm" }, { name: "29cm" }, { name: "29.5cm" }, { name: "30cm" }, { name: "30.5cm" }, { name: "31cm以上" }])

  # メンズ・靴・その他・サイズ
  cm_23_5, cm_24, cm_24_5, cm_25, cm_25_5, cm_26, cm_26_5, cm_27, cm_27_5, cm_28, cm_28_5, cm_29, cm_29_5, cm_30, cm_30_5, cm_31 = other.children.create([{ name: "23.5cm以下" }, { name: "24cm" }, { name: "24.5cm" }, { name: "25cm" }, { name: "25.5cm" }, { name: "26cm" }, { name: "26.5cm" }, { name: "27cm" }, { name: "27.5cm" }, { name: "28cm" }, { name: "28.5cm" }, { name: "29cm" }, { name: "29.5cm" }, { name: "30cm" }, { name: "30.5cm" }, { name: "31cm以上" }])

  # メンズ・バッグ
  shoulder_bag, tote_bag, boston_bag, backpack, waist_pouch, body_bag, drum_bag, business_bag, travel_bag, messenger_bag, eco_bag, other = bag.children.create([{ name: "ショルダーバッグ" }, { name: "トートバッグ" }, { name: "ボストンバッグ" }, { name: "リュック/バックパック" }, { name: "ウエストポーチ" }, { name: "ボディーバッグ" }, { name: "ドラムバッグ" }, { name: "ビジネスバッグ" }, { name: "トラベルバッグ" }, { name: "メッセンジャーバッグ" }, { name: "エコバッグ" }, { name: "その他" }])

  # メンズ・スーツ
  suit_jacket, suit_vest, slacks, setup, other = suit.children.create([{ name: "スーツジャケット" }, { name: "スーツベスト" }, { name: "スラックス" }, { name: "セットアップ" }, { name: "その他" }])

  # メンズ・スーツジャケット・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = suit_jacket.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・スーツベスト・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = suit_vest.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・スラックス・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = slacks.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・セットアップ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = setup.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・帽子
  cap, hat, knit_cap, hunting, casket, sun_visor, other = hat.children.create([{ name: "キャップ" }, { name: "ハット" }, { name: "ニットキャップ/ビーニー" }, { name: "ハンチング/ベレー帽" }, { name: "キャスケット" }, { name: "サンバイザー" }, { name: "その他" }])

  # メンズ・アクセサリー
  necklace, bracelet, bangle, ring, piercing_one_ear, piercing_both_ears, anklet, other = accessory.children.create([{ name: "ネックレス" }, { name: "ブレスレット" }, { name: "バングル/リストバンド" }, { name: "リング" }, { name: "ピアス(片耳用)" }, { name: "ピアス(両耳用)" }, { name: "アンクレット" }, { name: "その他" }])

  # メンズ・小物
  long_wallet, folded_wallet, money_clip, coin_case, business_card_holder, key_case, key_ring, tie, gloves, handkerchief, belt, scarf, stall, bandana, neck_warmer, suspenders, wallet_chain, glasses, mobile_case, notebook, strap, necktie_pin, cufflinks, ear_muffler, umbrella, raincoat, mirror, tabacco_goods, other = goods.children.create([{ name: "長財布" }, { name: "折り財布" }, { name: "マネークリップ" }, { name: "コインケース/小銭入れ" }, { name: "名刺入れ/定期入れ" }, { name: "キーケース" }, { name: "キーホルダー" }, { name: "ネクタイ" }, { name: "手袋" }, { name: "ハンカチ" }, { name: "ベルト" }, { name: "マフラー" }, { name: "ストール" }, { name: "バンダナ" }, { name: "ネックウォーマー" }, { name: "サスペンダー" }, { name: "ウォレットチェーン" }, { name: "サングラス/メガネ" }, { name: "モバイルケース/カバー" }, { name: "手帳" }, { name: "ストラップ" }, { name: "ネクタイピン" }, { name: "カフリンクス" }, { name: "イヤマフラー" }, { name: "傘" }, { name: "レインコート" }, { name: "ミラー" }, { name: "タバコグッズ" }, { name: "その他" }])

  # メンズ・時計
  analog_watch, digital_watch, rubber_belt, leather_belt, metal_belt, other = watch.children.create([{ name: "腕時計(アナログ)" }, { name: "腕時計(デジタル)" }, { name: "ラバーベルト" }, { name: "レザーベルト" }, { name: "金属ベルト" }, { name: "その他" }])

  # メンズ・水着
  swimwear, swimwear_sports, accessory, other = swimwear.children.create([{ name: "一般水着" }, { name: "スポーツ用" }, { name: "アクセサリー" }, { name: "その他" }])

  # メンズ・一般水着・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = swimwear.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・スポーツ用水着・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = swimwear_sports.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・レッグウェア
  socks, leggings, leg_warmer, other = leg_wear.children.create([{ name: "ソックス" }, { name: "レギンス/スパッツ" }, { name: "レッグウォーマー" }, { name: "その他" }])

  # メンズ・アンダーウェア
  trunks, boxer_shorts, other = underwear.children.create([{ name: "トランクス" }, { name: "ボクサーパンツ" }, { name: "その他" }])

  # メンズ・アンダーウェア・トランクス・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = trunks.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # メンズ・アンダーウェア・ボクサーパンツ・サイズ
  xxs, xs, s, m, l, xl, xl2, xl3, xl4, free_size = boxer_shorts.children.create([{ name: "XXS以下" }, { name: "XS(SS)" }, { name: "S" }, { name: "M" }, { name: "L" }, { name: "XL(LL)" }, { name: "2XL(3L)" }, { name: "3XL(4L)" }, { name: "4XL(5L)以上" }, { name: "FREE SIZE" }])

  # ベビー・キッズ
  baby_clothes_girls, baby_clothes_boys, baby_clothes_unisex, kids_clothes_girls, kids_clothes_boys, kids_clothes_unisex, kids_shoes, fashion_goods, diapers, moving_goods, meal, furniture, baby_toys, souvenir, baby_others = baby.children.create([{ name: "ベビー服(女の子用) ~95cm" }, { name: "ベビー服(男の子用) ~95cm" }, { name: "ベビー服(男女兼用) ~95cm" }, { name: "キッズ服(女の子用) 100cm~" }, { name: "キッズ服(男の子用) 100cm~" }, { name: "キッズ服(男女兼用) 100cm~" }, { name: "キッズ靴" }, { name: "子ども用ファッション小物" }, { name: "おむつ/トイレ/バス" }, { name: "外出/移動用品" }, { name: "授乳/食事" }, { name: "ベビー家具/寝具/室内用品" }, { name: "おもちゃ" }, { name: "行事/記念品" }, { name: "その他" }])

  # ベビー服(女の子用)
  tops, outer, pants, skirt, one_piece, baby_dress, baby_wraps, underwear, pajamas, rompers, other = baby_clothes_girls.children.create([{ name: "トップス" }, { name: "アウター" }, { name: "パンツ" }, { name: "スカート" }, { name: "ワンピース" }, { name: "ベビードレス" }, { name: "おくるみ" }, { name: "下着/肌着" }, { name: "パジャマ" }, { name: "ロンパース" }, { name: "その他" }])

  # ベビー服(女の子用)・トップス・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = tops.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・アウター・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = outer.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・パンツ・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = pants.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・スカート・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = skirt.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・ワンピース・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = one_piece.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・ベビードレス・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = baby_dress.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・おくるみ・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = baby_wraps.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・下着・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = underwear.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・パジャマ・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = pajamas.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・ロンパース・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = rompers.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(女の子用)・その他・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = other.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # べビー服(男の子用)
  tops, outer, pants, baby_wraps, underwear, pajamas, rompers, other = baby_clothes_boys.children.create([{ name: "トップス" }, { name: "アウター" }, { name: "パンツ" }, { name: "おくるみ" }, { name: "下着/肌着" }, { name: "パジャマ" }, { name: "ロンパース" }, { name: "その他" }])

  # ベビー服(男の子用)・トップス・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = tops.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男の子用)・アウター・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = outer.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男の子用)・パンツ・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = pants.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男の子用)・おくるみ・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = baby_wraps.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男の子用)・下着・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = underwear.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男の子用)・パジャマ・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = pajamas.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男の子用)・ロンパース・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = rompers.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男の子用)・その他・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = other.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男女兼用)
  tops, outer, pants, baby_wraps, underwear, pajamas, rompers, other = baby_clothes_unisex.children.create([{ name: "トップス" }, { name: "アウター" }, { name: "パンツ" }, { name: "おくるみ" }, { name: "下着/肌着" }, { name: "パジャマ" }, { name: "ロンパース" }, { name: "その他" }])

  # ベビー服(男女兼用)・トップス・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = tops.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男女兼用)・アウター・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = outer.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男女兼用)・パンツ・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = pants.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男女兼用)・おくるみ・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = baby_wraps.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男女兼用)・下着・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = underwear.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男女兼用)・パジャマ・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = pajamas.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男女兼用)・ロンパース・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = rompers.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # ベビー服(男女兼用)・その他・サイズ
  cm_60, cm_70, cm_80, cm_90, cm_95 = other.children.create([{ name: "60cm" }, { name: "70cm" }, { name: "80cm" }, { name: "90cm" }, { name: "95cm" }])

  # キッズ服(女の子用)
  coat, jacket, t_shirt, sweatshirt, tunic, tanktop, tops_others, skirt, pants, one_piece, setup, pajamas, dress, japanese_clothes, yukata, jinbei, swimwear, other = kids_clothes_girls.children.create([{ name: "コート" }, { name: "ジャケット/上着" }, { name: "トップス(Tシャツ/カットソー)" }, { name: "トップス(トレーナー)" }, { name: "トップス(チュニック)" }, { name: "トップス(タンクトップ)" }, { name: "トップス(その他)" }, { name: "スカート" }, { name: "パンツ" }, { name: "ワンピース" }, { name: "セットアップ" }, { name: "パジャマ" }, { name: "フォーマル/ドレス" }, { name: "和服" }, { name: "浴衣" }, { name: "甚平" }, { name: "水着" }, { name: "その他" }])

  # キッズ服(女の子用)・コート・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = coat.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・ジャケット・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = jacket.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・トップス(Tシャツ/カットソー)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = t_shirt.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・トップス(トレーナー)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = sweatshirt.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・トップス(チュニック)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = tunic.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・トップス(タンクトップ)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = tanktop.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・トップス(その他)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = tops_others.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・スカート・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = skirt.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・パンツ・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = pants.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・ワンピース・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = one_piece.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・セットアップ・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = setup.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・パジャマ・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = pajamas.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・ドレス・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = dress.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・和服・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = japanese_clothes.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・浴衣・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = yukata.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・甚平・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = jinbei.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・水着・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = swimwear.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(女の子用)・その他・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = other.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)
  coat, jacket, t_shirt, sweatshirt, tops_others, pants, setup, pajamas, formal, japanese_clothes, yukata, jinbei, swimwear, other = kids_clothes_boys.children.create([{ name: "コート" }, { name: "ジャケット/上着" }, { name: "トップス(Tシャツ/カットソー)" }, { name: "トップス(トレーナー)" }, { name: "トップス(その他)" }, { name: "パンツ" }, { name: "セットアップ" }, { name: "パジャマ" }, { name: "フォーマル/ドレス" }, { name: "和服" }, { name: "浴衣" }, { name: "甚平" }, { name: "水着" }, { name: "その他" }])

  # キッズ服(男の子用)・コート・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = coat.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・ジャケット・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = jacket.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・トップス(Tシャツ/カットソー)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = t_shirt.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・トップス(トレーナー)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = sweatshirt.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・トップス(その他)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = tops_others.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・パンツ・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = pants.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

   # キッズ服(男の子用)・セットアップ・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = setup.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・パジャマ・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = pajamas.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・ドレス・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = formal.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・和服・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = japanese_clothes.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・浴衣・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = yukata.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・甚平・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = jinbei.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・水着・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = swimwear.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男の子用)・その他・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = other.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男女兼用)
  coat, jacket, t_shirt, sweatshirt, tops_others, bottoms, pajamas, other = kids_clothes_unisex.children.create([{ name: "コート" }, { name: "ジャケット/上着" }, { name: "トップス(Tシャツ/カットソー)" }, { name: "トップス(トレーナー)" }, { name: "トップス(その他)" }, { name: "ボトムス" }, { name: "パジャマ" }, { name: "その他" }])

  # キッズ服(男女兼用)・コート・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = coat.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男女兼用)・ジャケット・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = jacket.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男女兼用)・トップス(Tシャツ/カットソー)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = t_shirt.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男女兼用)・トップス(トレーナー)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = sweatshirt.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男女兼用)・トップス(その他)・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = tops_others.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男女兼用)・ボトムス・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = bottoms.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男女兼用)・パジャマ・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = pajamas.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ服(男女兼用)・その他・サイズ
  cm_100, cm_110, cm_120, cm_130, cm_140, cm_150, cm_160 = other.children.create([{ name: "100cm" }, { name: "110cm" }, { name: "120cm" }, { name: "130cm" }, { name: "140cm" }, { name: "150cm" }, { name: "160cm" }])

  # キッズ靴
  sneakers, sandals, boots, rain_shoes, other = kids_shoes.children.create([{ name: "スニーカー" }, { name: "サンダル" }, { name: "ブーツ" }, { name: "長靴" }, { name: "その他" }])

  # キッズ靴・スニーカー・サイズ
  cm_10_5, cm_11_5, cm_12_5, cm_13_5, cm_14_5, cm_15_5, cm_16_5, cm_17 = sneakers.children.create([{ name: "10.5cm以下" }, { name: "11.5cm" }, { name: "12.5cm" }, { name: "13.5cm" }, { name: "14.5cm" }, { name: "15.5cm" }, { name: "16.5cm" }, { name: "17cm以上" }])

  # キッズ靴・サンダル・サイズ
  cm_10_5, cm_11_5, cm_12_5, cm_13_5, cm_14_5, cm_15_5, cm_16_5, cm_17 = sandals.children.create([{ name: "10.5cm以下" }, { name: "11.5cm" }, { name: "12.5cm" }, { name: "13.5cm" }, { name: "14.5cm" }, { name: "15.5cm" }, { name: "16.5cm" }, { name: "17cm以上" }])

  # キッズ靴・ブーツ・サイズ
  cm_10_5, cm_11_5, cm_12_5, cm_13_5, cm_14_5, cm_15_5, cm_16_5, cm_17 = boots.children.create([{ name: "10.5cm以下" }, { name: "11.5cm" }, { name: "12.5cm" }, { name: "13.5cm" }, { name: "14.5cm" }, { name: "15.5cm" }, { name: "16.5cm" }, { name: "17cm以上" }])

  # キッズ靴・長靴・サイズ
  cm_10_5, cm_11_5, cm_12_5, cm_13_5, cm_14_5, cm_15_5, cm_16_5, cm_17 = rain_shoes.children.create([{ name: "10.5cm以下" }, { name: "11.5cm" }, { name: "12.5cm" }, { name: "13.5cm" }, { name: "14.5cm" }, { name: "15.5cm" }, { name: "16.5cm" }, { name: "17cm以上" }])

  # キッズ靴・その他・サイズ
  cm_10_5, cm_11_5, cm_12_5, cm_13_5, cm_14_5, cm_15_5, cm_16_5, cm_17 = other.children.create([{ name: "10.5cm以下" }, { name: "11.5cm" }, { name: "12.5cm" }, { name: "13.5cm" }, { name: "14.5cm" }, { name: "15.5cm" }, { name: "16.5cm" }, { name: "17cm以上" }])

  # 子ども用ファッション小物
  socks, hat, apron, suspenders, tights, handkerchief, bandana, belt, muffler, umbrella, gloves, bib, bag, other = fashion_goods.children.create([{ name: "靴下/スパッツ" }, { name: "帽子" }, { name: "エプロン" }, { name: "サスペンダー" }, { name: "タイツ" }, { name: "ハンカチ" }, { name: "バンダナ" }, { name: "ベルト" }, { name: "マフラー" }, { name: "傘" }, { name: "手袋" }, { name: "スタイ" }, { name: "バッグ" }, { name: "その他" }])

  # おむつ/トイレ/バス
  diaper, potty, training_pants, baby_bus, bathroom_goods, other = diapers.children.create([{ name: "おむつ用品" }, { name: "おまる/補助便座" }, { name: "トレーニングパンツ" }, { name: "ベビーバス" }, { name: "お風呂用品" }, { name: "その他" }])

  # 外出/移動用品
  stroller, baby_carrier, child_seat, other = moving_goods.children.create([{ name: "ベビーカー" }, { name: "抱っこひも/スリング" }, { name: "チャイルドシート" }, { name: "その他" }])

  # 授乳/食事
  milk, baby_food, baby_tableware, other = meal.children.create([{ name: "ミルク" }, { name: "ベビーフード" }, { name: "ベビー用食器" }, { name: "その他" }])


  # ベビー家具/寝具/室内用品
  bed, futon, chair, chests, other = furniture.children.create([{ name: "ベッド" }, { name: "布団/毛布" }, { name: "イス" }, { name: "たんす" }, { name: "その他" }])

  # おもちゃ
  bathroom_toys, rattle, music_box, baby_gim, wheelbag, educational_toys, other = baby_toys.children.create([{ name: "おふろのおもちゃ" }, { name: "がらがら" }, { name: "オルゴール" }, { name: "ベビージム" }, { name: "手押し車/カタカタ" }, { name: "知育玩具" }, { name: "その他" }])

  # 行事/記念品
  omiyamairi, weaning_ceremony, album, hand_print, other = souvenir.children.create([{ name: "お宮参り用品" }, { name: "お食い初め用品" }, { name: "アルバム" }, { name: "手形/足形" }, { name: "その他" }])

  # ベビー・キッズ・その他
  maternal_child_handbook, other = baby_others.children.create([{ name: "母子手帳用品" }, { name: "その他" }])

  # インテリア・住まい・小物
  kitchen, bed, sofa, chair, desk, storage, rug, curtain, light, bedding, interior_goods, season, interior_others = interior.children.create([{ name: "キッチン/食器" }, { name: "ベッド/マットレス" }, { name: "ソファ/ソファベッド" }, { name: "椅子/チェア" }, { name: "机/テーブル" }, { name: "収納家具" }, { name: "ラグ/カーペット/マット" }, { name: "カーテン/ブラインド" }, { name: "ライト/照明" }, { name: "寝具" }, { name: "インテリア小物" }, { name: "季節/年中行事" }, { name: "その他" }])

  # キッチン/食器
  dishes, kitchenware, kitchen_storage, lunch_goods, cutlery, table_supplies, container, apron, alcohol_goods, water_purifier, other = kitchen.children.create([{ name: "食器" }, { name: "調理器具" }, { name: "収納/キッチン雑貨" }, { name: "弁当用品" }, { name: "カトラリー/スプーン等" }, { name: "テーブル用品" }, { name: "容器" }, { name: "エプロン" }, { name: "アルコールグッズ" }, { name: "浄水機" }, { name: "その他" }])

  # ベッド/マットレス
  semi_single_bed, single_bed, semi_double_bed, double_bed, wide_double_bed, queen_bed, king_bed, mattress_with_legs, mattress, sunoko_bed, loft_bed, cot, with_storage, other = bed.children.create([{ name: "セミシングルベッド" }, { name: "シングルベッド" }, { name: "セミダブルベッド" }, { name: "ダブルベッド" }, { name: "ワイドダブルベッド" }, { name: "クイーンベッド" }, { name: "キングベッド" }, { name: "脚付きマットレスベッド" }, { name: "マットレス" }, { name: "すのこベッド" }, { name: "ロフトベッド/システムベッド" }, { name: "簡易ベッド/折りたたみベッド" }, { name: "収納付き" }, { name: "その他" }])

  # ソファ/ソファベッド
  sofa_set, single_sofa, love_sofa, triple_sofa, ottoman, corner_sofa, beads_sofa, low_sofa, sofa_bed, reception_set, sofa_cover, reclining_sofa, other = sofa.children.create([{ name: "ソファセット" }, { name: "シングルソファ" }, { name: "ラブソファ" }, { name: "トリプルソファ" }, { name: "オットマン" }, { name: "コーナーソファ" }, { name: "ビーズソファ/クッションソファ" }, { name: "ローソファ/フロアソファ" }, { name: "ソファベッド" }, { name: "応接セット" }, { name: "ソファカバー" }, { name: "リクライニングソファ" }, { name: "その他" }])


  # 椅子/チェア
  general, stool, dining_chair, high_back_chair, rocking_chair, seat_chair, folding_chair, desk_chair, other = chair.children.create([{ name: "一般" }, { name: "スツール" }, { name: "ダイニングチェア" }, { name: "ハイバックチェア" }, { name: "ロッキングチェア" }, { name: "座椅子" }, { name: "折り畳みイス" }, { name: "デスクチェア" }, { name: "その他" }])

  # 机/テーブル
  kotatsu, counter, side_table, center_table, dining_table, seating_table, outdoor, pc, office_desk, other = desk.children.create([{ name: "こたつ" }, { name: "カウンターテーブル" }, { name: "サイドテーブル" }, { name: "センターテーブル" }, { name: "ダイニングテーブル" }, { name: "座卓/ちゃぶ台" }, { name: "アウトドア用" }, { name: "パソコン用" }, { name: "事務机/学習机" }, { name: "その他" }])

  # 収納家具
  living, kitchen, entrance, bath, book_storage, cd_storage, closet, telephone_stand, dresser, shelf, box, other = storage.children.create([{ name: "リビング収納" }, { name: "キッチン収納" }, { name: "玄関/屋外収納" }, { name: "バス/トイレ収納" }, { name: "本収納" }, { name: "本/CD/DVD収納" }, { name: "洋服タンス/押入れ収納" }, { name: "電話台/ファックス台" }, { name: "ドレッサー/鏡台" }, { name: "棚/ラック" }, { name: "ケース/ボックス" }, { name: "その他" }])

  # ラグ/カーペット/マット
  rug, carpet, hot_carpet, entrance, toilet, other = rug.children.create([{ name: "ラグ" }, { name: "カーペット" }, { name: "ホットカーペット" }, { name: "玄関/キッチンマット" }, { name: "トイレ/バスマット" }, { name: "その他" }])

  # カーテン/ブラインド
  curtain, blind, roll_screen, short_curtain, other = curtain.children.create([{ name: "カーテン" }, { name: "ブラインド" }, { name: "ロールスクリーン" }, { name: "のれん" }, { name: "その他" }])

  # ライト/照明
  fluorescent_lamp, ceiling_lighting, floor_stand, other = light.children.create([{ name: "蛍光灯/電球" }, { name: "天井照明" }, { name: "フロアスタンド" }, { name: "その他" }])

  # 寝具
  futon, pillow, sheets, other = bedding.children.create([{ name: "布団/毛布" }, { name: "枕" }, { name: "シーツ/カバー" }, { name: "その他" }])

  # インテリア小物
  trash_can, welcome_board, music_box, cushion, cushion_cover, slipper_rack, tissue_box, basket, photo_frame, magazine_rack, mobile, vase, ashtray, umbrella_stand, accessory_case, clock, wall_clock, stand_mirror, wall_mounted_mirror, ornament, wind_chimes, plants, other = interior_goods.children.create([{ name: "ごみ箱" }, { name: "ウェルカムボード" }, { name: "オルゴール" }, { name: "クッション" }, { name: "クッションカバー" }, { name: "スリッパラック" }, { name: "ティッシュボックス" }, { name: "バスケット/かご" }, { name: "フォトフレーム" }, { name: "マガジンラック" }, { name: "モビール" }, { name: "花瓶" }, { name: "灰皿" }, { name: "傘立て" }, { name: "小物入れ" }, { name: "置時計" }, { name: "掛時計/柱時計" }, { name: "(鏡立て掛け式)" }, { name: "鏡(壁掛け式)" }, { name: "置物" }, { name: "風鈴" }, { name: "植物/観葉植物" }, { name: "その他" }])

  # 季節/年中行事
  new_year, adult_ceremony, valentines_day, doll_festival, childrens_day, mothers_day, fathers_day, summer_gift, summer, halloween, seniors_day, shichigosan, winter_gift, chistmas, wineter_generally, other = season.children.create([{ name: "正月" }, { name: "成人式" }, { name: "バレンタインデー" }, { name: "ひな祭り" }, { name: "子どもの日" }, { name: "母の日" }, { name: "父の日" }, { name: "サマーギフト/お中元" }, { name: "夏/夏休み" }, { name: "ハロウィン" }, { name: "敬老の日" }, { name: "七五三" }, { name: "お歳暮" }, { name: "クリスマス" }, { name: "冬一般" }, { name: "その他" }])

  # 本・音楽・ゲーム
  book, manga, magazine, cd, dvd, record, video_games = books.children.create([{ name: "本" }, { name: "漫画" }, { name: "雑誌" }, { name: "CD" }, { name: "DVD/ブルーレイ" }, { name: "レコード" }, { name: "テレビゲーム" }])

  # 本
  literature, humanities, nonfiction, map, business, health, computer, hobbies, housing, art, foreign_books, picture_book, reference_book, other = book.children.create([{ name: "文学/小説" }, { name: "人文/社会" }, { name: "ノンフィクション/教養" }, { name: "地図/旅行ガイド" }, { name: "ビジネス/経済" }, { name: "健康/医学" }, { name: "コンピュータ/IT" }, { name: "趣味/スポーツ/実用" }, { name: "住まい/暮らし/子育て" }, { name: "アート/エンタメ" }, { name: "洋書" }, { name: "絵本" }, { name: "参考書" }, { name: "その他" }])

  # 漫画
  all_volume_set, boys_manga, girls_manga, youth_manga, female_manga, fanzine, other = manga.children.create([{ name: "全巻セット" }, { name: "少年漫画" }, { name: "少女漫画" }, { name: "青年漫画" }, { name: "女性漫画" }, { name: "同人誌" }, { name: "その他" }])

  # 雑誌
  art_magazine, fashion, news, hobbies_magazine, other = magazine.children.create([{ name: "アート/エンタメ/ホビー" }, { name: "ファッション" }, { name: "ニュース/総合" }, { name: "趣味/スポーツ" }, { name: "その他" }])

  # CD
  japanese_music, western_music, anime, classic, k_pop, kids, other = cd.children.create([{ name: "邦楽" }, { name: "洋楽" }, { name: "アニメ" }, { name: "クラシック" }, { name: "K-POP/アジア" }, { name: "キッズ/ファミリー" }, { name: "その他" }])

  # DVD/ブルーレイ
  foreign_films, japanese_movies, anime, tv_drama, music, comedy, sports_programs, kids, other = dvd.children.create([{ name: "外国映画" }, { name: "日本映画" }, { name: "アニメ" }, { name: "TVドラマ" }, { name: "ミュージック" }, { name: "お笑い/バラエティ" }, { name: "スポーツ/フィットネス" }, { name: "キッズ/ファミリー" }, { name: "その他" }])

  # レコード
  japanese_music, western_music, other = record.children.create([{ name: "邦楽" }, { name: "洋楽" }, { name: "その他" }])

  # テレビゲーム
  video_game_body, video_game_software, portable_game_body, portable_game_software, pc_game, other = video_games.children.create([{ name: "家庭用ゲーム本体" }, { name: "家庭用ゲームソフト" }, { name: "携帯用ゲーム本体" }, { name: "携帯用ゲームソフト" }, { name: "PCゲーム" }, { name: "その他" }])

  # おもちゃ・ホビー・グッズ
  toy, talent_goods, comic, trading_cards, figures, instruments, collection, military, art_work, art_supplies, toys_others = toys.children.create([{ name: "おもちゃ" }, { name: "タレントグッズ" }, { name: "コミック/アニメグッズ" }, { name: "トレーディングカード" }, { name: "フィギュア" }, { name: "楽器/器材" }, { name: "コレクション" }, { name: "ミリタリー" }, { name: "美術品" }, { name: "アート用品" }, { name: "その他" }])

  # おもちゃ
  character_goods, plush_doll, accessory, model, minicar, toy_radio_control, plastic_model, hobby_radio_controll, train_model, other = toy.children.create([{ name: "キャラクターグッズ" }, { name: "ぬいぐるみ" }, { name: "小物/アクセサリー" }, { name: "模型/プラモデル" }, { name: "ミニカー" }, { name: "トイラジコン" }, { name: "プラモデル" }, { name: "ホビーラジコン" }, { name: "鉄道模型" }, { name: "その他" }])

  # タレントグッズ
  idol, musicians, talent, athlete, other = talent_goods.children.create([{ name: "アイドル" }, { name: "ミュージシャン" }, { name: "タレント/お笑い芸人" }, { name: "スポーツ選手" }, { name: "その他" }])

  # コミック/アニメグッズ
  strap, key_ring, badge, card, clear_file, poster, towel, other = comic.children.create([{ name: "ストラップ" }, { name: "キーホルダー" }, { name: "バッジ" }, { name: "カード" }, { name: "クリアファイル" }, { name: "ポスター" }, { name: "タオル" }, { name: "その他" }])

  # トレーディングカード
  yugio, magic_the_gathering, pokemon, duel_masters, battle_spirit, prepare, aikatsu, vanguard, weiss_schwarz, owners_league, baseball_heroes, doragon_ball, sleeve, other = trading_cards.children.create([{ name: "遊戯王" }, { name: "マジック：ザ・ギャザリング" }, { name: "ポケモンカードゲーム" }, { name: "デュエルマスターズ" }, { name: "バトルスピリッツ" }, { name: "プリパラ" }, { name: "アイカツ" }, { name: "カードファイト!! ヴァンガード" }, { name: "ヴァイスシュヴァルツ" }, { name: "プロ野球オーナーズリーグ" }, { name: "ベースボールヒーローズ" }, { name: "ドラコンボール" }, { name: "スリーブ" }, { name: "その他" }])

  # フィギュア
  comic, special_effects, game, sf, amecomi, sprorts_figure, military_figure, other = figures.children.create([{ name: "コミック/アニメ" }, { name: "特撮" }, { name: "ゲームキャラクター" }, { name: "SF/ファンタジー/ホラー" }, { name: "アメコミ" }, { name: "スポーツ" }, { name: "ミリタリー" }, { name: "その他" }])

  # 楽器/器材
  electric_guitar, acoustic_guitar, base, effector, amplifer, string_instrument, wind_instrument, keyboard_instrument, percussion_instrument, japanese_instrument, score, recording, dj_equipment, dtm, other = instruments.children.create([{ name: "エレキギター" }, { name: "アコースティックギター" }, { name: "ベース" }, { name: "エフェクター" }, { name: "アンプ" }, { name: "弦楽器" }, { name: "管楽器" }, { name: "鍵盤楽器" }, { name: "打楽器" }, { name: "和楽器" }, { name: "楽譜/スコア" }, { name: "レコーディング/PA楽器" }, { name: "DJ楽器" }, { name: "DTM/DAW" }, { name: "その他" }])

  # コレクション
  armor, stamps, old_currency, printed_matter, novelty_goods, other = collection.children.create([{ name: "武具" }, { name: "使用済切手/官制はがき" }, { name: "旧貨幣/金貨/銀貨/記念硬貨" }, { name: "印刷物" }, { name: "ノベルティグッズ" }, { name: "その他" }])

  # ミリタリー
  toigan, personal_equipment, other = military.children.create([{ name: "トイガン" }, { name: "個人装備" }, { name: "その他" }])

  # 美術品
  ceramics, glass, lacquerware, metal_crafts, painting, printmaking, sculpture, book, photo, other = art_work.children.create([{ name: "陶芸" }, { name: "ガラス" }, { name: "漆芸" }, { name: "金属工芸" }, { name: "絵画/タペストリ" }, { name: "版画" }, { name: "彫刻/オブジェクト" }, { name: "書" }, { name: "写真" }, { name: "その他" }])

  # アート用品
  painting_material, picture_frame, other = art_supplies.children.create([{ name: "画材" }, { name: "額縁" }, { name: "その他" }])

  # おもちゃ・その他
  trump, karuta, darts, billiards, mahjong, puzzle, go, othello, game_of_life, baseball, sports_toy, tricycle, yo_yo, model_equipment, railway, aircraft, amateur_radio, pachinko, other = toys_others.children.create([{ name: "トランプ/UNO" }, { name: "カルタ/百人一首" }, { name: "ダーツ" }, { name: "ビリヤード" }, { name: "麻雀" }, { name: "パズル/ジグソーパズル" }, { name: "囲碁/将棋" }, { name: "オセロ/チェス" }, { name: "人生ゲーム" }, { name: "野球/サッカーゲーム" }, { name: "スポーツ" }, { name: "三輪車/乗り物" }, { name: "ヨーヨー" }, { name: "模型製作用品" }, { name: "鉄道" }, { name: "航空機" }, { name: "アマチュア無線" }, { name: "パチンコ/パチスロ" }, { name: "その他" }])

  # コスメ・香水・美容
  base_make, makeup, nail_care, perfume, skin_care, hair_care, body_care, oral_care, relaxation, diet, cosmetics_others = cosmetics.children.create([{ name: "ベースメイク" }, { name: "メイクアップ" }, { name: "ネイルケア" }, { name: "香水" }, { name: "スキンケア/基礎化粧品" }, { name: "ヘアケア" }, { name: "ボディケア" }, { name: "オーラルケア" }, { name: "リラクゼーション" }, { name: "ダイエット" }, { name: "その他" }])

  # ベースメイク
  foundation, makeup_base, control_color, bb_cream, cc_cream, concealer, face_powder, trial_set, other = base_make.children.create([{ name: "ファンデーション" }, { name: "化粧下地" }, { name: "コントロールカラー" }, { name: "BBクリーム" }, { name: "CCクリーム" }, { name: "コンシーラー" }, { name: "フェイスパウダー" }, { name: "トライアルセット/サンプル" }, { name: "その他" }])

  # メイクアップ
  eye_shadow, lipstick, lip_gloss, lip_liner, cheek, face_color, mascara, eyeliner, eyelash, eyebrow_pencil, eyebrow_powder, eyebrow_mascara, trial_set, makeup_tool, facial_appliances, other = makeup.children.create([{ name: "アイシャドウ" }, { name: "口紅" }, { name: "リップグロス" }, { name: "リップライナー" }, { name: "チーク" }, { name: "フェイスカラー" }, { name: "マスカラ" }, { name: "アイライナー" }, { name: "つけまつげ" }, { name: "アイブロウペンシル" }, { name: "パウダーアイブロウ" }, { name: "眉マスカラ" }, { name: "トライアルセット/サンプル" }, { name: "メイク道具/化粧小物" }, { name: "美顔用品/美顔ローラー" }, { name: "その他" }])

  # ネイルケア
  nail_color, color_gel, base_coat, nail_art_supplies, nail_parts, nail_tips, care_tools, removal_solution, other = nail_care.children.create([{ name: "ネイルカラー" }, { name: "カラージェル" }, { name: "ネイルベースコート/トップコート" }, { name: "ネイルアート用品" }, { name: "ネイルパーツ" }, { name: "ネイルチップ/付け爪" }, { name: "手入れ用品" }, { name: "除光液" }, { name: "その他" }])

  # 香水
  for_woman, for_men, unisex, body_mist, other = perfume.children.create([{ name: "香水(女性用)" }, { name: "香水(男性用)" }, { name: "ユニセックス" }, { name: "ボディミスト" }, { name: "その他" }])

  # スキンケア/基礎化粧品
  toner, latex, essence_liquid, face_cream, facial_wash, cleansing, pack, gel, booster, eye_care, lip_care, trial_set, cleansing_goods, other = skin_care.children.create([{ name: "化粧水/ローション" }, { name: "乳液/ミルク" }, { name: "美容液" }, { name: "フェイスクリーム" }, { name: "洗顔料" }, { name: "クレンジング/メイク落とし" }, { name: "パック/フェイスマスク" }, { name: "ジェル/ゲル" }, { name: "ブースター/導入液" }, { name: "アイケア" }, { name: "リップケア" }, { name: "トライアルセット/サンプル" }, { name: "洗顔グッズ" }, { name: "その他" }])

  # ヘアケア
  shampoo, treatment, conditioner, rinse, styling_agent, coloring_agent, brush, other = hair_care.children.create([{ name: "シャンプー" }, { name: "トリートメント" }, { name: "コンディショナー" }, { name: "リンス" }, { name: "スタイリング剤" }, { name: "カラーリング剤" }, { name: "ブラシ" }, { name: "その他" }])

  # ボディケア
  oil, hand_cream, lotion, sunscreen, body_soap, bath_addtive, deodorant, foot_care, other = body_care.children.create([{ name: "オイル/クリーム" }, { name: "ハンドクリーム" }, { name: "ローション" }, { name: "日焼け止め/サンオイル" }, { name: "ボディソープ" }, { name: "入浴剤" }, { name: "制汗/デオドランド" }, { name: "フットケア" }, { name: "その他" }])

  # オーラルケア
  etiquette_supplies, toothbrush, other = oral_care.children.create([{ name: "口臭防止/エチケット用品" }, { name: "歯ブラシ" }, { name: "その他" }])

  # リラクゼーション
  essential_oil, fragrance, incense, candle, relaxation_goods, other = relaxation.children.create([{ name: "エッセンシャルオイル" }, { name: "芳香器" }, { name: "お香/香炉" }, { name: "キャンドル" }, { name: "リラクゼーショングッズ" }, { name: "その他" }])

  # ダイエット
  diet_food, exercise_supplies, weight_scale, body_fat_meter, other = diet.children.create([{ name: "ダイエット食品" }, { name: "エクササイズ食品" }, { name: "体重計" }, { name: "体脂肪計" }, { name: "その他" }])

  # コスメ・その他
  health_supplies, nursing_products, emergency_goods, other = cosmetics_others.children.create([{ name: "健康用品" }, { name: "看護/介護用品" }, { name: "救急/衛生用品" }, { name: "その他" }])

  # 家電・スマホ・カメラ
  smartphone, smartphone_accessory, pc, camera, television, audio, beauty, air_conditioning, consumer_electronics, electronics_others = electronics.children.create([{ name: "スマートフォン/携帯電話" }, { name: "スマホアクセサリー" }, { name: "PC/タブレット" }, { name: "カメラ" }, { name: "テレビ/映像機器" }, { name: "オーディオ機器" }, { name: "美容/健康" }, { name: "冷暖房/空調" }, { name: "生活家電" }, { name: "その他" }])

  # スマートフォン/携帯電話
  smartphone_body, battery, mobile_phone_body, phs_body, other = smartphone.children.create([{ name: "スマートフォン本体" }, { name: "バッテリー/充電器" }, { name: "携帯電話本体" }, { name: "PHS本体" }, { name: "その他" }])

  # スマホアクセサリー
  android_case, iphone_case, cover, earphone_jack, strap, film, self_porting_stick, other = smartphone_accessory.children.create([{ name: "Android用ケース" }, { name: "iPhone用ケース" }, { name: "カバー" }, { name: "イヤホンジャック" }, { name: "ストラップ" }, { name: "フィルム" }, { name: "自撮り棒" }, { name: "その他" }])

  # PC/タブレット
  tablet, notebook_pc, desktop_pc, display, ebook_reader, pc_peripheral_device, pc_parts, other = pc.children.create([{ name: "タブレット" }, { name: "ノートPC" }, { name: "デスクトップ型PC" }, { name: "ディスプレイ" }, { name: "電子ブックリーダー" }, { name: "PC周辺機器" }, { name: "PCパーツ" }, { name: "その他" }])

  # カメラ
  digital_camera, video_camera, single_focus_lens, zoom_lens, flim_camera, surveillance_camera, other = camera.children.create([{ name: "デジタルカメラ" }, { name: "ビデオカメラ" }, { name: "レンズ(単焦点)" }, { name: "レンズ(ズーム)" }, { name: "フィルムカメラ" }, { name: "防犯カメラ" }, { name: "その他" }])

  # レンズ(単焦点)・サイズ
  nikon_f, canon_ef, pentax_k, pentax_q, four_thirds, micro_four_thirds, alpha_a, alpha_e, nicon_1, canon_ef_m, x_mount, sigma_sa = single_focus_lens.children.create([{ name: "ニコンFマウント" }, { name: "キャノンEFマウント" }, { name: "ペンタックスKマウント" }, { name: "ペンタックスQマウント" }, { name: "フォーサーズマウント" }, { name: "マイクロフォーサーズマウント" }, { name: "αAマウント" }, { name: "αEマウント" }, { name: "ニコン1マウント" }, { name: "キャノンEF-Mマウント" }, { name: "Xマウント" }, { name: "シグマSAマウント" }])

  # レンズ(ズーム)・サイズ
  nikon_f, canon_ef, pentax_k, pentax_q, four_thirds, micro_four_thirds, alpha_a, alpha_e, nicon_1, canon_ef_m, x_mount, sigma_sa = zoom_lens.children.create([{ name: "ニコンFマウント" }, { name: "キャノンEFマウント" }, { name: "ペンタックスKマウント" }, { name: "ペンタックスQマウント" }, { name: "フォーサーズマウント" }, { name: "マイクロフォーサーズマウント" }, { name: "αAマウント" }, { name: "αEマウント" }, { name: "ニコン1マウント" }, { name: "キャノンEF-Mマウント" }, { name: "Xマウント" }, { name: "シグマSAマウント" }])


  # テレビ/映像機器
  tv_set, projector, blu_ray_recorder, dvd_recorder, blu_ray_player, dvd_player, video_cable, other = television.children.create([{ name: "テレビ" }, { name: "プロジェクター" }, { name: "ブルーレイレコーダー" }, { name: "DVDレコーダー" }, { name: "ブルーレイプレーヤー" }, { name: "DVDプレーヤー" }, { name: "映像用ケーブル" }, { name: "その他" }])

  # テレビ・サイズ
  to_20inches, to_26inches, to_32inches, to_37inches, to_40inches, to_42inches, to_46inches, to_52inches, to_60inches, more_60inches = tv_set.children.create([{ name: "〜20インチ" }, { name: "20〜26インチ" }, { name: "26〜32インチ" }, { name: "32〜37インチ" }, { name: "37〜40インチ" }, { name: "40〜42インチ" }, { name: "42〜46インチ" }, { name: "46〜52インチ" }, { name: "52〜60インチ" }, { name: "60インチ〜" }])

  # オーディオ機器
  portable_player, earphone, headphones, amplifer, speaker, cable, radio, other = audio.children.create([{ name: "ポータブルプレーヤー" }, { name: "イヤフォン" }, { name: "ヘッドフォン" }, { name: "アンプ" }, { name: "スピーカー" }, { name: "ケーブル/シールド" }, { name: "ラジオ" }, { name: "その他" }])

  # 美容/健康
  hair_dryer, hair_iron, beauty_equipment, electric_shaver, electric_toothbrush, other = beauty.children.create([{ name: "ヘアドライヤー" }, { name: "ヘアアイロン" }, { name: "美容機器" }, { name: "電気シェーバー" }, { name: "電気歯ブラシ" }, { name: "その他" }])

  # 冷暖房/空調
  air_condition, air_purifier, humidifier, fan, dehumidifier, fan_heater, electric_heater, oil_heater, stove, hot_carpet, kotatsu, electric_blanket, other = air_conditioning.children.create([{ name: "エアコン" }, { name: "空気清浄器" }, { name: "加湿器" }, { name: "扇風機" }, { name: "除湿機" }, { name: "ファンヒーター" }, { name: "電気ヒーター" }, { name: "オイルヒーター" }, { name: "ストーブ" }, { name: "ホットカーペット" }, { name: "こたつ" }, { name: "電気毛布" }, { name: "その他" }])

  # 生活家電
  refrigerator, washing_machine, rice_cooker, microwave_oven, cooking_equipment, iron, vacuum_cleaner, espersso_machine, coffee_maker, clothes_dryer, other = consumer_electronics.children.create([{ name: "冷蔵庫" }, { name: "洗濯機" }, { name: "炊飯器" }, { name: "電子レンジ/オーブン" }, { name: "調理機器" }, { name: "アイロン" }, { name: "掃除機" }, { name: "エスプレッソマシン" }, { name: "コーヒーメーカー" }, { name: "衣類乾燥機" }, { name: "その他" }])

  # その他
  other = electronics_others.children.create([{ name: "その他" }])

  # スポーツ・レジャー
  golf, fishing, bicycle, training, baseball, football, tennis, snow_board, skiing, other_sports, outdoor, sports_others = sports.children.create([{ name: "ゴルフ" }, { name: "フィッシング" }, { name: "自転車" }, { name: "トレーニング/エクササイズ" }, { name: "野球" }, { name: "サッカー/フットサル" }, { name: "テニス" }, { name: "スノーボード" }, { name: "スキー" }, { name: "その他スポーツ" }, { name: "アウトドア" }, { name: "その他" }])

  # ゴルフ
  club, wear_men, wear_women, bag, shoes_men, shoes_women, accessory, other = golf.children.create([{ name: "クラブ" }, { name: "ウエア(男性用)" }, { name: "ウエア(女性用)" }, { name: "バッグ" }, { name: "シューズ(男性用)" }, { name: "シューズ(女性用)" }, { name: "アクセサリー" }, { name: "その他" }])

  # フィッシング
  rod, reel, lure, wear, fishing_line, other = fishing.children.create([{ name: "ロッド" }, { name: "リール" }, { name: "ルアー用品" }, { name: "ウエア" }, { name: "釣り糸/ライン" }, { name: "その他" }])

  # 自転車
  bicycle_body, wear, parts, accessory, bag, tools, other = bicycle.children.create([{ name: "自転車本体" }, { name: "ウエア" }, { name: "パーツ" }, { name: "アクセサリー" }, { name: "バッグ" }, { name: "工具/メンテナンス" }, { name: "その他" }])

  # トレーニング/エクササイズ
  running, walking, yoga, training_equipment, other = training.children.create([{ name: "ランニング" }, { name: "ウォーキング" }, { name: "ヨガ" }, { name: "トレーニング用品" }, { name: "その他" }])

  # 野球
  wear, shoes, glove, bat, accessory, armor, practice_equipment, memorable_goods, supportive_goods, other = baseball.children.create([{ name: "ウェア" }, { name: "シューズ" }, { name: "グローブ" }, { name: "バット" }, { name: "アクセサリー" }, { name: "防具" }, { name: "練習機器" }, { name: "記念グッズ" }, { name: "応援グッズ" }, { name: "その他" }])

  # サッカー/フットサル
  wear, shoes, ball, accessory, memorable_goods, supportive_goods, other = football.children.create([{ name: "ウェア" }, { name: "シューズ" }, { name: "ボール" }, { name: "アクセサリー" }, { name: "記念グッズ" }, { name: "応援グッズ" }, { name: "その他" }])

  # テニス
  hard_type_racket, soft_type_racket, wear, shoes, ball, accessory, memorable_goods, supportive_goods, other = tennis.children.create([{ name: "ラケット(硬式用)" }, { name: "ラケット(軟式用)" }, { name: "ウェア" }, { name: "シューズ" }, { name: "ボール" }, { name: "アクセサリー" }, { name: "記念グッズ" }, { name: "応援グッズ" }, { name: "その他" }])

  # スノーボード
  board, binding, boots_men, boots_woman, boots_children, wear_men, wear_women, wear_children, accessory, bag, other = snow_board.children.create([{ name: "ボード" }, { name: "バインディング" }, { name: "ブーツ(男性用)" }, { name: "ブーツ(女性用)" }, { name: "ブーツ(子ども用)" }, { name: "ウエア(男性用)" }, { name: "ウエア(女性用)" }, { name: "ウエア(子ども用)" }, { name: "アクセサリー" }, { name: "バッグ" }, { name: "その他" }])

  # スノーボード・ボード・サイズ
  less_140cm, to_145cm, to_150cm, to_155cm, to_160cm, to_165cm, to_170cm = board.children.create([{ name: "135cm-140cmm未満" }, { name: "140cm-145cm未満" }, { name: "145cm-150cm未満" }, { name: "150cm-155cm未満" }, { name: "155cm-160cm未満" }, { name: "160cm-165cm未満" }, { name: "165cm-170cm未満" }])

  # スキー
  ski, boots_men, boots_woman, boots_children, binding, wear_men, wear_women, wear_children, stock, other = skiing.children.create([{ name: "板" }, { name: "ブーツ(男性用)" }, { name: "ブーツ(女性用)" }, { name: "ブーツ(子ども用)" }, { name: "バインディング" }, { name: "ウエア(男性用)" }, { name: "ウエア(女性用)" }, { name: "ウエア(子ども用)" }, { name: "ストック" }, { name: "その他" }])

  # スキー板・サイズ
  cm_140, cm_150, cm_160, cm_170, screwboard, for_children, other = ski.children.create([{ name: "140cm〜" }, { name: "150cm〜" }, { name: "160cm〜" }, { name: "170cm〜" }, { name: "スキーボード" }, { name: "子ども用" }, { name: "その他" }])

  # その他スポーツ
  dance, surfing, basketball, badminton, volleyball, skateboard, athletics, rugby, american_football, boxing, bowling, other = other_sports.children.create([{ name: "ダンス/バレエ" }, { name: "サーフィン" }, { name: "バスケットボール" }, { name: "バドミントン" }, { name: "バレーボール" }, { name: "スケートボード" }, { name: "陸上競技" }, { name: "ラグビー" }, { name: "アメリカンフットボール" }, { name: "ボクシング" }, { name: "ボウリング" }, { name: "その他" }])

  # アウトドア
  tent, light, sleeping_bag, table, stove, kitchenware, dishes, climbing_equipment, other = outdoor.children.create([{ name: "テント/タープ" }, { name: "ライト/ランタン" }, { name: "寝袋/寝具" }, { name: "テーブル/チェア" }, { name: "ストーブ/コンロ" }, { name: "調理器具" }, { name: "食器" }, { name: "登山用品" }, { name: "その他" }])

  # スポーツ・その他
  travel_goods, other = sports_others.children.create([{ name: "旅行用品" }, { name: "その他" }])

  # ハンドメイド
  accessory_woman, fashion_accessory, accessory, daily_necessities, hobbies, kids, material, secondary_creation, hand_made_others = hand_made.children.create([{ name: "アクセサリー(女性用)" }, { name: "ファッション/小物" }, { name: "アクセサリー/時計" }, { name: "日用品/インテリア" }, { name: "趣味/おもちゃ" }, { name: "キッズ/ベビー" }, { name: "素材/材料" }, { name: "二次創作物" }, { name: "その他" }])

  # ハンドメイド・アクセサリー(女性用)
  pierced_earrings, earrings, necklace, bracelet, ring, charm, hair_rubber, anklet, other = accessory_woman.children.create([{ name: "ピアス" }, { name: "イヤリング" }, { name: "ネックレス" }, { name: "ブレスレット" }, { name: "リング" }, { name: "チャーム" }, { name: "ヘアゴム" }, { name: "アンクレット" }, { name: "その他" }])

  # ハンドメイド・ファッション/小物
  bag_women, bag_men, wallet_women, wallet_men, fashion_accessory, other = fashion_accessory.children.create([{ name: "バッグ(女性用)" }, { name: "バッグ(男性用)" }, { name: "財布(女性用)" }, { name: "財布(男性用)" }, { name: "ファッション雑貨" }, { name: "その他" }])

  # ハンドメイド・アクセサリー/時計
  accessory_men, watch_women, watch_men, other = accessory.children.create([{ name: "アクセサリー(男性用)" }, { name: "時計(女性用)" }, { name: "時計(男性用)" }, { name: "その他" }])

  # ハンドメイド・日用品/インテリア
  kitchen_equipment, furniture, stationery, art, aroma, flower, other = daily_necessities.children.create([{ name: "キッチン用品" }, { name: "家具" }, { name: "文房具" }, { name: "アート/写真" }, { name: "アロマ/キャンドル" }, { name: "フラワー/ガーデン" }, { name: "その他" }])

  # ハンドメイド・趣味/おもちゃ
  craft, toys, other = hobbies.children.create([{ name: "クラフト/布製品" }, { name: "おもちゃ/人形" }, { name: "その他" }])

  # ハンドメイド・キッズ/ベビー
  fashion_accessory, stay, outing_goods, name_tag, other = kids.children.create([{ name: "ファッション雑貨" }, { name: "スタイ/よだれかけ" }, { name: "外出用品" }, { name: "ネームタグ" }, { name: "その他" }])

  # ハンドメイド・素材/材料
  parts, fabric, pattern, other = material.children.create([{ name: "各種パーツ" }, { name: "生地/糸" }, { name: "型紙/パターン" }, { name: "その他" }])

  # ハンドメイド・二次創作物
  ingress, creators_space_brothers = secondary_creation.children.create([{ name: "Ingress" }, { name: "クリエイターズ宇宙兄弟" }])

  # チケット
  music, sports, drama, event, movies, facility_ticket, coupon, other = tickets.children.create([{ name: "音楽" }, { name: "スポーツ" }, { name: "演劇/芸能" }, { name: "イベント" }, { name: "映画" }, { name: "施設利用券" }, { name: "優待券/割引券" }, { name: "その他" }])

  # チケット・音楽
  male_idols, female_idols, korean, domestic_artist, overseas_artist, music_festival, voice_actress, other = music.children.create([{ name: "男性アイドル" }, { name: "女性アイドル" }, { name: "韓流" }, { name: "国内アーティスト" }, { name: "海外アーティスト" }, { name: "音楽フェス" }, { name: "声優/アニメ" }, { name: "その他" }])

  # チケット・スポーツ
  football, baseball, tennis, martial_arts, sumo, golf, volleyball, basketball, motor_sports, winter_sports, other = sports.children.create([{ name: "サッカー" }, { name: "野球" }, { name: "テニス" }, { name: "格闘技/プロレス" }, { name: "相撲/武道" }, { name: "ゴルフ" }, { name: "バレーボール" }, { name: "バスケットボール" }, { name: "モータースポーツ" }, { name: "ウィンタースポーツ" }, { name: "その他" }])

  # 演劇/芸能
  musical, theater, tranditional_culture, rakugo, comedy, opera, circus, ballet, other = drama.children.create([{ name: "ミュージカル" }, { name: "演劇" }, { name: "伝統芸能" }, { name: "落語" }, { name: "お笑い" }, { name: "オペラ" }, { name: "サーカス" }, { name: "バレエ" }, { name: "その他" }])

  # イベント
  voice_actress, kids, talk_show, other = event.children.create([{ name: "声優/アニメ" }, { name: "キッズ/ファミリー" }, { name: "トークショー/講演会" }, { name: "その他" }])

  # 映画
  japanese_movies, foreign_films, other = movies.children.create([{ name: "邦画" }, { name: "洋画" }, { name: "その他" }])

  # 施設利用券
  amusement, museum, ski_resort, golf_course, fitness_club, pool, bowling_alley, aquarium, zoo, other = facility_ticket.children.create([{ name: "遊園地/テーマパーク" }, { name: "美術館/博物館" }, { name: "スキー場" }, { name: "ゴルフ場" }, { name: "フィットネスクラブ" }, { name: "プール" }, { name: "ボウリング場" }, { name: "水族館" }, { name: "動物園" }, { name: "その他" }])

  # 優待券/割引券
  shopping, restaurant, food, accommodation_voucher, other = coupon.children.create([{ name: "ショッピング" }, { name: "レストラン/食事券" }, { name: "フード/ドリンク券" }, { name: "宿泊券" }, { name: "その他" }])

  # 自動車・オートバイ
  automobile_body, automotive_tires, car_parts, automotive_accessory, motorcycle_body, mortorcycle_parts, motorcycle_accessory = automobile.children.create([{ name: "自動車本体" }, { name: "自動車タイヤ/ホイール" }, { name: "自動車パーツ" }, { name: "自動車アクセサリー" }, { name: "オートバイ車体" }, { name: "オートバイパーツ" }, { name: "オートバイアクセサリー" }])

  # 自動車本体
  domestic_automobile_body, foreign_car_body = automobile_body.children.create([{ name: "国内自動車本体" }, { name: "外国自動車本体" }])

  # 自動車タイヤ/ホイール
  tire_set, tire, wheel, other = automotive_tires.children.create([{ name: "タイヤ/ホイールセット" }, { name: "タイヤ" }, { name: "ホイール" }, { name: "その他" }])

  # タイヤ/ホイールセット・サイズ
  inches_12, inches_13, inches_14, inches_15, inches_16, inches_17, inches_18, inches_19, inches_20, inches_21, inches_22, inches_23, inches_24 = tire_set.children.create([{ name: "12インチ" }, { name: "13インチ" }, { name: "14インチ" }, { name: "15インチ" }, { name: "16インチ" }, { name: "17インチ" }, { name: "18インチ" }, { name: "19インチ" }, { name: "20インチ" }, { name: "21インチ" }, { name: "22インチ" }, { name: "23インチ" }, { name: "24インチ" }])

  # タイヤ・サイズ
  inches_12, inches_13, inches_14, inches_15, inches_16, inches_17, inches_18, inches_19, inches_20, inches_21, inches_22, inches_23, inches_24 = tire.children.create([{ name: "12インチ" }, { name: "13インチ" }, { name: "14インチ" }, { name: "15インチ" }, { name: "16インチ" }, { name: "17インチ" }, { name: "18インチ" }, { name: "19インチ" }, { name: "20インチ" }, { name: "21インチ" }, { name: "22インチ" }, { name: "23インチ" }, { name: "24インチ" }])

  # ホイールセット・サイズ
  inches_12, inches_13, inches_14, inches_15, inches_16, inches_17, inches_18, inches_19, inches_20, inches_21, inches_22, inches_23, inches_24 = wheel.children.create([{ name: "12インチ" }, { name: "13インチ" }, { name: "14インチ" }, { name: "15インチ" }, { name: "16インチ" }, { name: "17インチ" }, { name: "18インチ" }, { name: "19インチ" }, { name: "20インチ" }, { name: "21インチ" }, { name: "22インチ" }, { name: "23インチ" }, { name: "24インチ" }])

  # その他・サイズ
  inches_12, inches_13, inches_14, inches_15, inches_16, inches_17, inches_18, inches_19, inches_20, inches_21, inches_22, inches_23, inches_24 = other.children.create([{ name: "12インチ" }, { name: "13インチ" }, { name: "14インチ" }, { name: "15インチ" }, { name: "16インチ" }, { name: "17インチ" }, { name: "18インチ" }, { name: "19インチ" }, { name: "20インチ" }, { name: "21インチ" }, { name: "22インチ" }, { name: "23インチ" }, { name: "24インチ" }])

  # 自動車パーツ
  suspension, brake, exterior, light, interior_item, steering, muffler_system, engine, clutch, electrical_components, reinforced_parts, general_parts, foreign_car_parts, other = car_parts.children.create([{ name: "サスペンション" }, { name: "ブレーキ" }, { name: "外装、エアロパーツ" }, { name: "ライト" }, { name: "内装品、シート" }, { name: "ステアリング" }, { name: "マフラー・排気系" }, { name: "エンジン、過給機、冷却装置" }, { name: "クラッチ、ミッション、駆動系" }, { name: "電装品" }, { name: "補強パーツ" }, { name: "汎用パーツ" }, { name: "外国自動車用パーツ" }, { name: "その他" }])

  # 自動車アクセサリー
  in_car_accessory, car_navigation_system, car_audio, external_accessory, maintenance_goods, child_seat, drive_recorder, radar_detector, catalog, security, etc, other = automotive_accessory.children.create([{ name: "車内アクセサリー" }, { name: "カーナビ" }, { name: "カーオーディオ" }, { name: "車外アクセサリー" }, { name: "メンテナンス用品" }, { name: "チャイルドシート" }, { name: "ドライブレコーダー" }, { name: "レーダー/探知機" }, { name: "カタログ/マニュアル" }, { name: "セキュリティ" }, { name: "ETC" }, { name: "その他" }])

  # オートバイ車体・サイズ
  less_50cc, to_125cc, to_250cc, to_400cc, to_750cc, more_751cc = motorcycle_body.children.create([{ name: "50cc以下" }, { name: "51cc-125cc" }, { name: "126cc-250cc" }, { name: "251cc-400cc" }, { name: "401cc-750cc" }, { name: "751cc以上" }])

  # オートバイパーツ
  tire, muffler_system, engine, cowl, suspension, wheel, sheet, brake, tank, light, chain, meter, electrical_system, mirror, foreign_motorcycle_parts, other = mortorcycle_parts.children.create([{ name: "タイヤ" }, { name: "マフラー" }, { name: "エンジン、冷却装置" }, { name: "カウル、フェンダー、外装" }, { name: "サスペンション" }, { name: "ホイール" }, { name: "シート" }, { name: "ブレーキ" }, { name: "タンク" }, { name: "ライト、ウィンカー" }, { name: "チェーン、スプロケット、駆動系" }, { name: "メーター" }, { name: "電装系" }, { name: "ミラー" }, { name: "外国オートバイ用パーツ" }, { name: "その他" }])

  # オートバイアクセサリー
  helmet, bike_wear, accessory, maintenance, catalog, other = motorcycle_accessory.children.create([{ name: "ヘルメット/シールド" }, { name: "バイクウエア/装備" }, { name: "アクセサリー" }, { name: "メンテナンス" }, { name: "カタログ/マニュアル" }, { name: "その他" }])

  # ヘルメット・サイズ
  xs, s, m, l, xl, xxl, free_size, for_children = helmet.children.create([{ name: "XSサイズ以下" }, { name: "Sサイズ" }, { name: "Mサイズ" }, { name: "Lサイズ" }, { name: "XLサイズ" }, { name: "XXLサイズ以上" }, { name: "フリーサイズ" }, { name: "子ども用" }])

  # その他
  summary_selling, pet_supplies, food, drinks, daily_necessities, antique, stationery, office, others = others.children.create([{ name: "まとめ売り" }, { name: "ペット用品" }, { name: "食品" }, { name: "飲料/酒" }, { name: "日用品/生活雑貨/旅行" }, { name: "アンティーク/コレクション" }, { name: "文房具/事務用品" }, { name: "事務/店舗用品" }, { name: "その他" }])

  # その他・ペット用品
  pet_food, dog_supplies, cat_supplies, fish_supplies, small_animal_supplies, raptiles_supplies, basket, birds, insects_supplies, other = pet_supplies.children.create([{ name: "ペットフード" }, { name: "犬用品" }, { name: "猫用品" }, { name: "魚用品/水草" }, { name: "小動物用品" }, { name: "爬虫類/両生類用品" }, { name: "かご/おり" }, { name: "鳥用品" }, { name: "虫類用品" }, { name: "その他" }])

  # その他・食品
  confectionery, rice, vegetables, fruit, seasoning, seafood, meat, other_processed_food, other = food.children.create([{ name: "菓子" }, { name: "米" }, { name: "野菜" }, { name: "果物" }, { name: "調味料" }, { name: "魚介類(加工食品)" }, { name: "肉類(加工食品)" }, { name: "その他 加工食品" }, { name: "その他" }])

  # その他・飲料/酒
  coffee, soft_drink, mineral_water, tea, whisky, wine, brandy, shochu, sake, beer, other = drinks.children.create([{ name: "コーヒー" }, { name: "ソフトドリンク" }, { name: "ミネラルウォーター" }, { name: "茶" }, { name: "ウイスキー" }, { name: "ワイン" }, { name: "ブランデー" }, { name: "焼酎" }, { name: "日本酒" }, { name: "ビール、発泡酒" }, { name: "その他" }])

  # その他・日用品/生活雑貨/旅行
  towel, household_goods, detergent, travel_goods, disaster_goods, other = daily_necessities.children.create([{ name: "タオル/バス用品" }, { name: "日用品/生活雑貨" }, { name: "洗剤/柔軟剤" }, { name: "旅行用品" }, { name: "防災関連グッズ" }, { name: "その他" }])

  # その他・アンティーク/コレクション
  sundries, craft, furniture, printed_matter, other = antique.children.create([{ name: "雑貨" }, { name: "工芸品" }, { name: "家具" }, { name: "印刷物" }, { name: "その他" }])

  # その他・文房具/事務用品
  writing_instrument, notes, tape, calendar, album, file, scissors, card_holder, glue, other = stationery.children.create([{ name: "筆記具" }, { name: "ノート/メモ帳" }, { name: "テープ/マスキングテープ" }, { name: "カレンダー/スケジュール" }, { name: "アルバム/スクラップ" }, { name: "ファイル/バインダー" }, { name: "はさみ/カッター" }, { name: "カードホルダー/名刺管理" }, { name: "のり/ホッチキス" }, { name: "その他" }])

  # その他・事務/店舗用品
  office_general, office_furniture, store_supplies, oa_equipment, wrapping, other = office.children.create([{ name: "オフィス用品一般" }, { name: "オフィス家具" }, { name: "店舗用品" }, { name: "OA機器" }, { name: "ラッピング/包装" }, { name: "その他" }])
end

CSV.foreach('db/csv/brands.csv', headers: true) do |row|
  Brand.create!(id: row['id'],
                name: row['name'])
end

CSV.foreach('db/csv/items.csv', headers: true) do |row|
  Item.create!(id: row['id'],
               name: row['name'],
               comment: row['comment'],
               category_id: row['category_id'],
               shipping_fee: row['shipping_fee'],
               prefecture_id: row['prefecture_id'],
               brand_id: row['brand_id'],
               days_to_ship: row['days_to_ship'],
               price: row['price'],
               condition: row['condition'],
               user_id: row['user_id'],
               closed: row['closed'],
               transportation: row['transportation'],
               item_photos_attributes: [{image: open("#{Rails.root}/db/fixture/image#{row['id']}.jpg")}])
end
