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

| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| item_name    | string      | null: false                    |
| content      | text        | null: false                    |
| category_id  | integer     | null: false                    |
| condition_id | integer     | null: false                    |
| delivery_id  | integer     | null: false                    |
| area_id      | integer     | null: false                    |
| date_id      | integer     | null: false                    |
| price        | integer     | null: false                    |
| user         | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| area_id      | integer    | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| room_number  | string     |                                |
| phone_number | string     | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase