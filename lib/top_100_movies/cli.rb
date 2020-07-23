class top100movies::CLI

  def call
    top100movies::Scraper.new.make_movies
    puts "Hello welcome to the top 100 movies in the history of film"
    start
  end

  def start
    puts ""
    puts "What number movies would you like to see? 1-10, 11-20, 21-30, 31-40, 41-50, 51-60, 61-70, 71-80, 81-90, 91-100?"
    input = gets.strip.to_i

    print_movies(input)

    puts ""
    puts "What movie would you like more information on?"
    input = gets.strip

    restaurant = top100movies::Movies.find(input.to_i)

    print_movies(movies)

    puts ""
    puts "Would you like to see another film? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      start
    end
  end

  def print_Movie(Movie)
    puts ""
    puts "----------- #{movie.name} - #{movie.position} -----------"
    puts ""
    puts "#{movie.intro_quote}"
    puts "Stars:              #{movie.star}"
    puts "Rating:"            #{movie.rating}

    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{movie.description}"
    puts ""
  end

  def print_movie(from_number)
    puts ""
    puts "---------- movies #{from_number} - #{from_number+9} ----------"
    puts ""
    top_100_movies::Movies.all[from_number-1, 10].each.with_index(from_number) do |movies, index|
      puts "#{index}. #{movie.name} - #{movie.rating}"
    end
  end

end
