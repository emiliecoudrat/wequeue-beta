class Line < ActiveRecord::Base
  include AlgoliaSearch

  belongs_to :user
  has_many :posts

  validates :place, :city, :address, :date, :user_id, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  algoliasearch index_name: "#{self}#{ENV['ALGOLIA_SUFFIX']}" do
    attributesToIndex ['place', 'address', 'city']
  end

end

