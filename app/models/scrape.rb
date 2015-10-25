class Scrape

  attr_accessor :title, :hotness, :image_url, :rating, :director, :genre, :release_date, :duration, :summary, :failure


  def scrape_new_movie(url)
    begin
      #url = "http://www.rottentomatoes.com/m/the_martian/"
      doc = Nokogiri::HTML(open(url))
      doc.css('script').remove

      self.title = doc.at("//h1[@itemprop = 'name']").text
      self.hotness = doc.at("//span[@itemprop = 'ratingValue']").text.to_i
      self.image_url = doc.at_css("#movie-image-section img")['src']
      self.rating = doc.at("//td[@itemprop = 'contentRating']").text
      self.director = doc.at("//span[@itemprop = 'name']").text
      self.genre = doc.at("//span[@itemprop = 'genre']").text
      self.release_date = doc.at("//td[@itemprop = 'datePublished']").text.to_date
      self.duration = doc.at("//time[@itemprop = 'duration']").text
      self.summary = doc.css("#movieSynopsis").text.tidy_bytes



      return true

    rescue Exception => e
      self.failure = "An error has occured. (Sorry haha)" + e.message
    end
  end

  # def save_movie
  #   movie = Movie.new(
  #          title: self.title,
  #          hotness: self.hotness,
  #          image_url: self.image_url,
  #          rating: self.rating,
  #          director: self.director,
  #          genre: self.genre,
  #          release_date: self.release_date,
  #          duration: self.duration
  #
  #
  #   )
  #
  #   movie.save
  # end


end