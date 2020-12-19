class Url < ApplicationRecord
    validates :original, uniqueness: true, presence: true, allow_blank: false
    validates :short_url, uniqueness: true, presence: true, allow_blank: false

    before_validation :add_short_url

    def add_short_url
        self.short_url = UrlShortener.shorten(original)
    end
end
