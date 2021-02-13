# README
## usersテーブル

| Column               | Type       | Options |
| -------------------- | ---------- | ------- |
| email                | string     | NOT NULL|
| encrypted_password   | string     | NOT NULL|
| name                 | string     | NOT NULL|
| profile              | text       | NOT NULL|
| occupation           | text       | NOT NULL|
| position             | text       | NOT NULL|

### Association
- has_many :prototypes
- has_many :comments

## prototypesテーブル

| Column    | Type       | Options                        |
| ---------------------- | ------------------------------ |
| title     | string     | NOT NULL                       |
| catch_copy| text       | NOT NULL                       |
| concept   | text       | NOT NULL                       |
| image     | ActiveStorage実装                           |
| user      | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user

## commentsテーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| text      | text      | NOT NULL                       |
| user      | reference | null: false, foreign_key: true |
| prototype | reference | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :prototype
