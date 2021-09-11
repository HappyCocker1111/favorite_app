class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  
  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def already_favorited?(recipe)
    #current_user（self）に結びついているいいねの中で対象となるレシピがあるか確認している
    #trueだったらいいねずみ。falseならいいねできるようにボタンを表示する
    self.favorites.exists?(recipe_id: recipe.id)
  end
end
