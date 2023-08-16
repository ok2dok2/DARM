# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: 'user1',
  email: 'user1@ggmail.com',
  age: '21',
  password: 'passpass',
  introduce: 'ユーザー１です。',
  images: [File.open("db/images/user1.webp")],
  tag_list: 'なにわ男子,道枝駿佑'
)

User.create(
  name: 'user2',
  email: 'user2@ggmail.com',
  age: '26',
  password: 'passpass',
  introduce: 'ユーザー2です。',
  images: [File.open("db/images/user2.jpg")],
  tag_list: 'なにわ男子,大橋和也'
)

User.create(
  name: 'user3',
  email: 'user3@ggmail.com',
  age: '30',
  password: 'passpass',
  introduce: '유저3입니다',
  images: [File.open("db/images/user3.jpeg")],
  tag_list: 'Apink,bomi,윤보미'
)

User.create(
  name: 'user4',
  email: 'user4@ggmail.com',
  age: '32',
  password: 'passpass',
  introduce: '유저4입니다.',
  images: [File.open("db/images/user4.jpg")],
  tag_list: 'Apink,에이핑크,박초롱'
)

User.create(
  name: 'user5',
  email: 'user5@ggmail.com',
  age: '31',
  password: 'passpass',
  introduce: '유저5입니다.',
  images: [File.open("db/images/user5.jpg")],
  tag_list: '인피니트,김명수,엘'
)

Event.create(
  name: '인스피릿!!!',
  start_at: '2023-07-28 12:00:00',
  place: '감남역',
  introduce: '소개글소개글소개글소개글',
  contact: '카톡',
  tag_list: '인피니트,INFINITE',
  image:  File.open("db/images/event1.jpg"),
  user_id: 1
)

Event.create(
  name: 'PANDA모임',
  start_at:'2023-08-24 15:00:00',
  place:'이마트24 수원고색점',
  introduce: '소개글소개글소개글소개글',
  contact: '카톡',
  tag_list:'에이핑크',
  image:  File.open("db/images/event2.jpg"),
  user_id: 1
)

Event.create(
  name: 'STAYC',
  start_at:'2023-08-24 16:00:00',
  place:'新大久保駅',
  introduce: '紹介文紹介文紹介文紹介文',
  contact: 'LINE',
  tag_list:'STAYC,ステイシー',
  image:  File.open("db/images/event3.jpg"),
  user_id: 2
)

Event.create(
  name: '728会'
  start_at:'2023-07-28 11:00:00',
  place:'大阪駅',
  introduce: '紹介文紹介文紹介文紹介文',
  contact: 'LINE',
  tag_list:'なにわ男子',
  image:  File.open("db/images/event4.webp"),
  user_id: 3
)

Event.create(
  name: 'DIVE'
  start_at:'2023-08-24 19:00:00',
  place:'新大久保 ジャカルチ市場',
  introduce: '紹介文紹介文紹介文紹介文',
  contact: 'LINE',
  tag_list:'IVE,レイ,DIVE',
  image:  File.open("db/images/event5.jpg"),
  user_id: 5
)

Topic.create(
  name: 'Apink',
  image:  File.open("db/images/topic1.png"),
  introduce: '5人組ガールズグループ',
  youtube: 'WqzTRK5GPWQ',
  user_id: 5
)
Topic.create(
  name: 'STAYC',
  image:  File.open("db/images/topic2.jpg"),
  introduce: '6人組ガールズグループ',
  youtube: '3-ptVHZZdBg',
  user_id: 4
)
Topic.create(
  name: 'なにわ男子',
  image:  File.open("db/images/topic3.jpg"),
  introduce: '6人組ボーイズグループ',
  youtube: '8KXbNShp8rs',
  user_id: 1
)
Topic.create(
  name: 'INFINITE',
  image:  File.open("db/images/topic4.jpg"),
  introduce: '6人組ボーイズグループ',
  youtube: 'i1oTSAhdzNQ',
  user_id: 2
)
Topic.create(
  name: 'WANNA ONE',
  image:  File.open("db/images/topic5.png"),
  introduce: '11人組ボーイズグループ',
  youtube: 'aEuSoDT6V6c',
  user_id: 4
)


