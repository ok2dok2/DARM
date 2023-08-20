FactoryBot.define do
  factory :user do
    name {'user22' }
    email {'user22@gmail.com'}
    age {'26'}
    password {'passpass' }
    introduce {'ユーザー2です。'}
    tag_list {'なにわ男子,大橋和也'}
  end

  factory :user2, class: User do
    name {'user222' }
    email {'user222@gmail.com'}
    age {'30'}
    password {'passpass' }
    introduce {'ユーザー222です。'}
    tag_list {'INFINITE,엘'}
  end

  factory :user3, class: User do
    name {'user2222' }
    email {'user2222@gmail.com'}
    age {'31'}
    password {'passpass' }
    introduce {'ユーザー2222です。'}
    tag_list {'apink,bomi'}
  end
end