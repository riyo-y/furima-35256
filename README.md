# テーブル設計

## users テーブル

| Column                                | Type         | Options     |
| --------------------------------------| ------------ | ----------- |
| nickname                              | string       | null: false |
| email                                 | string,unique| null: false |
| encrypted_password                    | string       | null: false |
| last_name                             | string       | null: false |
| last_name(kana)                       | string       | null: false |
| first_name                            | string       | null: false |
| first_name(kana)                      | string       | null: false |
| birthday                              | date         | null: false |


## items テーブル

| Column                | Type        | Options                         |
| --------------------- | ----------- | ------------------------------- |
| products_name         | string      | null: false                     |
| images	              | text        | null: false                     |
| price                 | integer     | null: false                     |
| admins                | string      | null: false foreign_key: true   |
| category_id           | integer     | null: false                     |
| products_states_id    | integer     | null: false                     |
| shipping_id           | integer     | null: false foreign_key: true   |
| admins_information_id | integer     | null: false foreign_key: true   |
| arrival_date_id       | integer     | null: false                     |
| comments              | text        | null: false                     |


## purchases テーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| postcode          | integer    | null: false                     |  
| prefecture_id     | integer    | null: false                     |
| city              | integer    | null: false                     |
| block             | integer    | null: false                     |
| building          | integer    | null: false                     |
| phone_number      | integer    | null: false                     |