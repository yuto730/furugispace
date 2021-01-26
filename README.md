# データベース設計

## stores テーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| store_nickname        | string | null: false | <!-- 店舗名 -->
| email                 | string | null: false | <!-- メールアドレス -->
| password_confirmation | string | null: false | <!-- パスワード -->
| address               | string | null: false | <!-- 住所 -->
| building              | string |             | <!-- 建物名 -->
| phone_number          | string | null: false | <!-- 電話番号 -->
| store_profile         | text   |             | <!-- 店舗プロフィール -->

### Association
- has_many :notices
- has_many :events
- has_many :communities
- has_many :coordinations


## users テーブル
| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| user_nickname         | string | null: false | <!-- ユーザー名 -->
| email                 | string | null: false | <!-- メールアドレス -->
| password_confirmation | string | null: false | <!-- パスワード -->
| user_profile          | text   |             | <!-- ユーザープロフィール -->

### Association
- has_many :communities
- has_many :coordinations


## notices テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| notice_title       | string     | null: false                    | <!-- お知らせ名 -->
| notice_display     | string     | null: false                    | <!-- 表示/非表示 -->
| notice_heading     | string     | null: false                    | <!-- お知らせ見出し -->
| notice_description | text       | null: false                    | <!-- お知らせ詳細 -->
| store              | references | null: false, foreign_key: true |

### Association
- belongs_to :store


## events テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| event_title       | string     | null: false                    | <!-- イベント名 -->
| event_display     | string     | null: false                    | <!-- 表示/非表示 -->
| start_on          | string     | null: false                    | <!-- イベント開催日 -->
| end_on            | string     | null: false                    | <!-- イベント終了日 -->
| event_heading     | string     | null: false                    | <!-- イベント見出し -->
| event_description | text       | null: false                    | <!-- イベント詳細 -->
| entry_fee         | string     | null: false                    | <!-- 入場料 -->
| prefecture_id     | integer    | null: false                    | <!-- 都道府県 -->
| event_address     | string     | null: false                    | <!-- イベント住所 -->
| venue             | string     | null: false                    | <!-- イベント会場 -->
| store             | references | null: false, foreign_key: true |

### Association
- belongs_to :store


## communities テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| community_title   | string     | null: false                    | <!-- コミュニティ名 -->
| community_profile | text       | null: false                    | <!-- コミュニティプロフィール -->
| store             | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :store
- belongs_to :user


## coordinations テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| hat      | string     |                                | <!-- 帽子 -->
| outer    | string     |                                | <!-- アウター -->
| inner    | string     | null: false                    | <!-- インナー -->
| belt     | string     |                                | <!-- ベルト -->
| Pant     | string     | null: false                    | <!-- パンツ -->
| sock     | string     |                                | <!-- 靴下 -->
| shoe     | string     | null: false                    | <!-- 靴 -->
| eye      | string     |                                | <!-- 眼鏡/サングラス -->
| earring  | string     |                                | <!-- ピアス/イヤリング -->
| necklace | string     |                                | <!-- ネックレス -->
| bracelet | string     |                                | <!-- ブレスレット -->
| ring     | string     |                                | <!-- 指輪 -->
| store    | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :store
- belongs_to :user

# ER図
![furugispace_er](https://user-images.githubusercontent.com/72351740/105690782-c0f82b80-5f3f-11eb-87c6-4fd150643f0e.png)
