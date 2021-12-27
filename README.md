# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birth_day          | string | null: false               |
| name               | string | null: false               |
| name_kana          | string | null: false               |

### Association

- has_many :products
- has_many :purchase_products

## products テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product_name | string     | null: false                    |
| content      | text       | null: false                    |
| category     | string     | null: false                    |
| condition    | string     | null: false                    |
| delivery     | string     | null: false                    |
| area         | string     | null: false                    |
| day          | string     | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchase_products

## purchase_products テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| account_number | integer    | null: false                    |
| date           | integer    | null: false                    |
| CVV            | integer    | null: false                    |
| post_code      | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| room_number    | string     |                                |
| phone_number   | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| product        | references | null: false, foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
