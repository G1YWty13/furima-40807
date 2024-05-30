# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null: false               |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name          | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :deals


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| information   | string     | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| cost_id       | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| send_day_id   | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :deal


## deals テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| house_number  | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| town          | string     | null: false                    |
| street        | string     | null: false                    |
| building      | string     |                                |
| phone         | integer    | null: false                    |
| deal_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user