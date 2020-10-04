class Book < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_category_relations
  has_many :categories, through: :post_category_relations
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  enum prefecture: {
    "--未選択--":0,北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def Book.search(search, user_or_book, how_search)
    if user_or_book == "2"
      if how_search == "1"
        Book.where(['title LIKE ?', "#{search}"])
      elsif how_search == "2"
        Book.where(['title LIKE ?', "#{search}%"])
      elsif how_search == "3"
        Book.where(['title LIKE ?', "%#{search}"])
      elsif how_search == "4"
        Book.where(['title LIKE ?', "%#{search}%"])
      else
        Book.all
      end
    end
  end
end
