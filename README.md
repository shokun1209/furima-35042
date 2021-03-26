# README

## users テーブル

|   Column           |   Type   |   Options                 |
|--------------------|----------|---------------------------|
| email              |  string  | null: false, unique: true |
| encrypted_password |  string  | null: false               |
| nickname           |  string  | null: false               |
| first_name         |  string  | null: false               |
| last_name          |  string  | null: false               |
| first_name_ruby    |  string  | null: false               |
| last_name_ruby     |  string  | null: false               |
| birthday           |  date    | null: false               |

## association

- has_many :items
- has_many :purchase_records



## items テーブル

|   Column        |   Type     |   Options                      |
|-----------------|------------|--------------------------------|
| name            |  string    | null: false                    |
| text            |  text      | null: false                    |
| category_id     |  integer   | null: false                    |
| status_id       |  integer   | null: false                    |
| shipping_id     |  integer   | null: false                    |
| area_id         |  integer   | null: false                    |
| days_id         |  integer   | null: false                    |
| price           |  integer   | null: false                    |
| user            | references | null: false, foreign_key: true |

- has_one :purchase_record
- belongs_to :user


## purchase_records テーブル

|   Column        |   Type     |   Options                      |
|-----------------|------------|--------------------------------|
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

|   Column        |   Type     |   Options                      |
|-----------------|------------|--------------------------------|
| area_id         |  integer   | null: false                    |
| municipality    |  string    | null: false                    |
| address         |  string    | null: false                    |
| building        |  string    |                                |
| postal_code     |  string    | null: false                    |
| tell            |  string    | null: false                    |
| purchase_record | references | null: false, foreign_key: true |

- belongs_to :purchase_record
