# テーブル設計

## users テーブル

| Column                                | Type         | Options                   |
| --------------------------------------| ------------ | ------------------------- |
| nickname                              | string       | null: false               |
| email                                 | string       | null: false, unique: true |
| encrypted_password                    | string       | null: false               |
| last_name                             | string       | null: false               |
| last_name_kana                        | string       | null: false               |
| first_name                            | string       | null: false               |
| first_name_kana                       | string       | null: false               |
| birthday                              | date         | null: false               |

has_many :items
has_many :orders





## items テーブル

| Column                | Type        | Options                         |
| --------------------- | ----------- | ------------------------------- |
| products_name         | string      | null: false                     |
| price                 | integer     | null: false                     |
| user                  | references  | null: false foreign_key: true   |
| category_id           | integer     | null: false                     |
| products_states_id    | integer     | null: false                     |
| shipping_id           | integer     | null: false                     |
| admins_information_id | integer     | null: false                     |
| arrival_date_id       | integer     | null: false                     |
| comments              | text        | null: false                     |

 belongs_to :user
 has_one :order



## purchases テーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| postcode          | string     | null: false                     |  
| prefecture_id     | integer    | null: false                     |
| city              | string     | null: false                     |
| block             | string     | null: false                     |
| building          | string     |                                 |
| phone_number      | string     | null: false                     |
| order             | references | null: false, foreign_key: true  |

belongs_to :order

## ordersテーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| user              | references | null: false foreign_key: true   |  
| item              | references | null: false foreign_key: true   |

belongs_to :user
belongs_to :item
has_one :purchase

