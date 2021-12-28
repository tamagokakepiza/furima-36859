# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birth_day          | date   | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| item_name_id    | integer     | null: false                    |
| content_id      | integer     | null: false                    |
| category_id     | integer     | null: false                    |
| condition_id    | integer     | null: false                    |
| delivery_id     | integer     | null: false                    |
| area_id         | integer     | null: false                    |
| day_id          | integer     | null: false                    |
| price_id        | integer     | null: false                    |
| user_id         | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_one :address

## purchase テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| room_number    | string     |                                |
| phone_number   | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :item