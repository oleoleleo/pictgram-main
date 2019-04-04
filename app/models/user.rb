class User < ApplicationRecord
  validates :name, presence: true, length: (1..15)
                                    # Rails05課題 名前の長さに制限を追加する
  validates :email, presence: true, format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
                                    # Rails05課題　メールアドレスの正規表現を追加してください

  has_secure_password
    validates :password, length: (8..32), presence: true, format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  # Rails05課題　スワードの文字数制限を追加する
  # Rails05課題　パスワードをアルファベット、数字の混合のみ可能にしてください
  has_many :topics, dependent: :destroy
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'

  # def favorite_topics
  #
  # end

  has_many :comments
end
