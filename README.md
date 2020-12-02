

# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| name_kana | string  | null: false |
| birth_day | integer | null: false |


### Association

- has_many :items
- has_one  :payment

## items テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | --------------------------------|
| name             | string     | null: false                     |
| description      | text       | null: false                     |
| category         | string     | null: false                     |
| status           | string     | null: false                     |
| delivery_fee     | string     | null: false                     |
| place            | string     | null: false                     |
| days_to_deliver  | string     | null: false                     |
| price            | integer    | null: false                     |
| user             | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- has_one    :payment

## payments テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| credit_number   | integer     | null: false                    |
| expiration_date | integer     | null: false                    |
| security_code   | integer     | null: false                    |
| user            | references  | null: false, foreign_key: true |
| item            | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :addresses

## addresses テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal_code     | integer     | null: false                    |
| city            | string      | null: false                    |
| address_line    | string      | null: false                    |
| building        | string      |                                |
| phone_number    | integer     | null: false                    |
| payment         | references  | null: false, foreign_key: true |


### Association

- belongs_to :payment