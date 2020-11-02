class Book < ApplicationRecord
    
    validates :year, presence: true
    validates :month, presence: true
    validates :inout, presence: true
    validates :category, presence: true
    validates :amount, presence: true
    #validates（検証機能）入力していない項目があった場合に登録させないという処理
    #presence(入力必須にする)
end
