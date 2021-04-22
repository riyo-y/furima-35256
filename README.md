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


## items テーブル

| Column                | Type        | Options                         |
| --------------------- | ----------- | ------------------------------- |
| products_name         | string      | null: false                     |
| price                 | integer     | null: false                     |
| user                  | string      | null: false foreign_key: true   |
| category_id           | integer     | null: false                     |
| products_states_id    | integer     | null: false                     |
| shipping_id           | integer     | null: false                     |
| admins_information_id | integer     | null: false                     |
| arrival_date_id       | integer     | null: false                     |
| comments              | text        | null: false                     |


## purchases テーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| postcode_id       | string     | null: false                     |  
| prefecture_id     | integer    | null: false                     |
| city              | string     | null: false                     |
| block             | string     | null: false                     |
| building          | string     |                                 |
| phone_number      | string     | null: false                     |


## user_itemsテーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| user_id           | string     | null: false foreign_key: true   |  
| price_id          | integer    | null: false foreign_key: true   |
| products_name_id  | string     | null: false foreign_key: true   |
