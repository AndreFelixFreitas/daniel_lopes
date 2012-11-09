class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :author, :body, :email, :url

  validates_presence_of :body, :post
  validates_associated :post

  validates_format_of :email, :allow_blank => true,
  :with => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{1,3})+$/
  validates_format_of :url, :allow_blank => true,
  :with => /^(https?:\/\/)?(www\.)?([a-zA-Z0-9_\-]+)+\.([a-zA-Z]{2,4})/
end
