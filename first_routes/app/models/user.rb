# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#

class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    class_name: :Artwork,
    foreign_key: :artist_id,
    dependent: :destroy

  has_many :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :viewer_id,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

  has_many :comments,
    foreign_key: :user_id,
    class_name: :Comment,
    dependent: :destroy

end
