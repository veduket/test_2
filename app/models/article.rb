class Article < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"   
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  ratyrate_rater
end
