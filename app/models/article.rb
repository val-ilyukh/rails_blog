class Article < ApplicationRecord
	has_many :comments
	mount_uploader :picture, PictureUploader
	validates :title, presence: {message: 'Поле не должно быть пустым'}
	validates :body, presence: {message: 'Поле не должно быть пустым'}, length: {minimum: 10, message: 'Статья должна иметь длину не менее 10 символов'}
end
