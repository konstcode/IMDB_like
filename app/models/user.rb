class User < ApplicationRecord
  has_secure_password
  ratyrate_rater
end
