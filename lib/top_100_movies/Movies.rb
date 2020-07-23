class top_100_movies::Movies

  attr_accessor :name, :position, :Rating, :Star, :Runtime, :description

  @@all = []

  def self.new_from_index_page(r)
    self.new(
      r.css("h2").text,
      "https://www.imdb.com/list/ls055592025/#{r.attribute("href").text}",
      r.css("p")[1].text,
      r.css(".position").text
      )
  end

  def initialize(name=nil, rating=nil, star=nil, position=nil)
    @name = name
    @Rating = rating
    @Star = star
    @position = position
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def star
    
    @star ||= doc.css("div.content.profile").css('p')[6].text
    # @star ||= doc.xpath("//div[@class='c-4 nr nt']/ul[2]/li").text
  end

  def rating #DONE
    @rating ||= doc.css("p.location").text
    # @rating ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[1]").text.split("+").join(". Tel: +")
  end

  def runtime #DONE
    @runtime ||= doc.css("a.telephone").text
    # @contact ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[1]").text.split("+").join(". Tel: +")
  end

  def description #DONE
    @description ||= doc.css("div.content.profile").css('p')[4].text
    # @description ||= doc.xpath("//div[@class='c-8 nl nt']/p[3]").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
