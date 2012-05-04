class Reply < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates_presence_of :subject, :body
end
