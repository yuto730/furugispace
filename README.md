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
| store_profile         | text   |             | <!-- プロフィール -->

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
| user_profile          | text   |             | <!-- プロフィール -->

### Association
- has_many :communities
- has_many :messages
- has_many :community_users
- has_many :coordinations
- has_many :comments
- has_many :follow


## Relationships テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| follow | references | null: false, foreign_key: true |

### Association
- belongs_to :user


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
| community_profile | text       | null: false                    | <!-- プロフィール -->
| store             | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association
- has_many :store
- has_many :user
- has_many :messages
- has_many :community_users


## messages テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | string     |                                |
| user      | references | null: false, foreign_key: true |
| community | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :community


## community_users テーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| community | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :community


## coordinations テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| coordination_title   | string     | null: false                    | <!-- コーディネート名 -->
| coordination_profile | text       |                                | <!-- プロフィール -->
| item_id              | integer    | null: false                    | <!-- アイテム -->
| item_text            | string     | null: false                    | <!-- アイテム詳細 -->
| store                | references | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :store
- belongs_to :user
- has_many   :comments


## comments テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       | null: false                    | <!-- コメント -->
| user         | references | null: false, foreign_key: true |
| coordination | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :coordination

# ER図
![furugispace](https://user-images.githubusercontent.com/72351740/108597284-9a58d380-73cb-11eb-8b98-1b27e8367a8a.png)