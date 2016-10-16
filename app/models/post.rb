class Post < ActiveRecord::Base



  def self.reset
    self.all = []
  end


end

# def initialize(params)
#   binding.pry
#   @name = params[:name]
#   @content = params[:content]
#   @@all << self
# end
