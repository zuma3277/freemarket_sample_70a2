# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Credit-Cardsテーブル

|column|Type|Options|
|------|----|-------|
|card-number|integer|null: false, unique: true|
|expiration_date|integer|null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user

## Profilesテーブル

|column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|Birthday|date|null: false|
|introduction|text|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
