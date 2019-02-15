crumb :root do
  link "メルカリ", root_path
end

crumb :user_profiles do |user|
  link "マイページ", user_profiles_path
  parent :root
end

crumb :user_profile do |user|
  link "プロフィール", user_profile_path(id: current_user.profile.id)
  parent :user_profiles
end

crumb :card_profiles do |user|
  link "支払い方法", card_user_profile_path
  parent :user_profiles
end

crumb :identification_profile do |user|
  link "本人情報の登録", identification_user_profile_path(id: current_user.profile.id)
  parent :user_profile
end

crumb :logout_profile do |user|
  link "ログアウト",logout_user_profiles_path(id: current_user.profile.id)
  parent :user_profile
end

crumb :categories do |categories|
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :item_show do |item|
  link "#{item.name}", item_path
  parent :root
end

