class Comment < ActiveRecord::Base
  belongs_to :article

  ratyrate_rateable "fun"
end
