class Client < ActiveRecord::Base
has_many :tasks, dependent: :destroy
has_many :attachments, dependent: :destroy
has_many :users
end
