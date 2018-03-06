# == Schema Information
#
# Table name: artworks
#
#  id         :integer          not null, primary key
#  title      :string
#  image_url  :string
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord

  validates :title, uniqueness: { scope: :artist_id, message: "should be unique under the scope of an artist" }

  belongs_to :artist,
    class_name: :User,
    foreign_key: :artist_id

  has_many :artwork_shares,
    class_name: :ArtworkShare,
    foreign_key: :artwork_id

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

end
