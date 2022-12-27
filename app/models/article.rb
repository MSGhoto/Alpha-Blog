class Article < ApplicationRecord
    belongs_to :user  #, class_name: "user  #", foreign_key: "user  #_id"
    validates :title, presence: true, length:{minimum:5,maximum:100}
    validates :description, presence: true, length:{minimum:5,maximum:1000}
    
end