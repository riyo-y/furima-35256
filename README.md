# テーブル設計

## users テーブル

| Column                           | Type   | Options     |
| -------------------------------- | ------ | ----------- |
| nickname                         | text   | null: false |
| email                            | string | null: false |
| encrypted_password               | string | null: false |
| encrypted_password(confirmation) | string | null: false |
| name                             | string | null: false |
| name(kana)                       | string | null: false |
| birthday                         | date   | null: false |


## items テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------- |
| products_name      | string     | null: false                     |
| images	           | text       | null: false                     |
| price              | string     | null: false                     |
| admins             | string     | null: false foreign_key: true   |
| category           | string     | null: false                     |
| products_states    | string     | null: false                     |
| shipping           | string     | null: false foreign_key: true   |
| admins_information | string     | null: false foreign_key: true   |
| arrival_date       | string     | null: false                     |
| comments           | text       | null: false                     |


## purchases テーブル

| Column            | Type       | Options                         |
| ----------------- | ---------- | ------------------------------- |
| credit_card_number| string     | null: false                     |
| credit_card_images| text       | null: false                     |
| credit_card_date  | string     | null: false                     |
| credit_card_code  | string     | null: false                     |
| postcode          | integer    | null: false                     |  
| prefecture_id     | integer    | null: false                     |
| city              | integer    | null: false                     |
| block             | integer    | null: false                     |
| building          | integer    | null: false                     |
| phone_number      | integer    | null: false                     |
| images	          | text       | null: false                     |
| price             | string     | null: false                     |
| products_name     | string     | null: false                     |