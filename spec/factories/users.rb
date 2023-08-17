
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :user do
    name {'user22' }
    email {'user22@gmail.com'}
    age {'26'}
    password {'passpass' }
    introduce {'ユーザー2です。'}
    tag_list {'なにわ男子,大橋和也'}
  end
end