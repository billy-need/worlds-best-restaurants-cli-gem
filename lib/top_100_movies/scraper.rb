class top_100_movies::Scraper

  def get_page
    Nokogiri::HTML(open("hhttps://www.imdb.com/list/ls055592025/"))
  end

  def scrape_movies_index
     self.get_page.css("div[data-list='1-100'] a.item")
  end

  def make_movies
    scrape_movies_index.each do |r|
      top_100_movies::Movies.new_from_index_page(r)
    end
  end
end
