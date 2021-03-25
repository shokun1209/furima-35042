# README

## users テーブル

|   Column        |   Type   |   Options   |
|-----------------|----------|-------------|
| email           |  string  | null: false |
| password        |  string  | null: false |
| nickname        |  string  | null: false |
| first_name      |  string  | null: false |
| last_name       |  string  | null: false |
| first_name_ruby |  string  | null: false |
| last_name_ruby  |  string  | null: false |
| birthday        |  date    | null: false |

## association

- has_many :items
- has_many :purchase_records



## items テーブル

|   Column        |   Type     |   Options   |
|-----------------|------------|-------------|
| name            |  string    | null: false |
| text            |  text      | null: false |
| category        |  string    | null: false |
| status          |  string    | null: false |
| shipping        |  string    | null: false |
| area            |  string    | null: false |
| days            |  string    | null: false |
| price           | integer    | null: false |
| user_id         | references | null: false |

- has_many :purchase_records
- belongs_to :user


## purchase_records テーブル

|   Column        |   Type     |   Options   |
|-----------------|------------|-------------|
| users_id        | references | null: false |
| items_id        | references | null: false |

- belongs_to :user
- has_one :item
- belongs_to :address


## addresses テーブル

|   Column        |   Type     |   Options   |
|-----------------|------------|-------------|
| prefecture      |  string    | null: false |
| municipality    |  string    | null: false |
| address         |  string    | null: false |
| building        |  string    |             |
| postal_code     |  string    | null: false |
| tell            |  string    | null: false |
| record_id       | references | null: false |

- has_one :purchase_record