
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last-name_kana     | string | null: false |
| first-name_kana    | string | null: false |
| user_birth_date    | date | null: false |

### Association

- has_many :items
- has_many :comments




## photo テーブル

| Column                   | Type     | Options     |
| ------------------------ | -------- | ----------- |
| photo-name                   | string   | null: false |
| photo-info                   | text     | null: false |
| photo-price                  | integer  | null: false |
| user                        |references| foreign_key: true |

### Association

- belongs_to :user
- has_many comments

## comments テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ------------------|
| user      | references | foreign_key: true |
| items     | references | foreign_key: true |
| comments  | text       | null:  false      |
### Association 

- belongs_to :item
- belongs_to :user


## likesテーブル

| Column    | Type       | Options           |
| --------- | ---------- | ------------------|
| title_name      | string| null: false |

できたらタグでける
