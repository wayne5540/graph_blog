class User < ActiveRecord::Base
  include Clearance::User
  has_secure_token :api_token

  has_many :posts
end

# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  api_token          :string
#
# Indexes
#
#  index_users_on_api_token       (api_token) UNIQUE
#  index_users_on_email           (email)
#  index_users_on_remember_token  (remember_token)
#
