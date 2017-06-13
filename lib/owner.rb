require 'pry'
class Owner

  attr_accessor :pets, :name
  attr_reader :species

  @@all = []

  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
    @species = "human"
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    self.pets[:cats] << new_cat
  end
  #Associate that new pet instance to the owner by adding it to the appropriate array-value of the `@pets` hash

  def buy_dog(name)
    new_dog = Dog.new(name)
    self.pets[:dogs] << new_dog
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    self.pets[:fishes] << new_fish
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.length
  end

  def say_species
    "I am a #{@species}."
  end

  def walk_dogs
    self.pets[:dogs].map {|dog| dog.mood="happy"}
  end

  def play_with_cats
    self.pets[:cats].map {|cat| cat.mood="happy"}
  end

  def feed_fish
    self.pets[:fishes].map {|fish| fish.mood="happy"}
  end

  def sell_pets
    self.pets.map { |pet_type, attr_array| attr_array.map { |attribute| attribute.mood= "nervous"}}
    self.pets.clear
  end

  def list_pets
    fish = self.pets[:fishes].length
    cat = self.pets[:cats].length
    dog = self.pets[:dogs].length
    "I have #{fish} fish, #{dog} dog(s), and #{cat} cat(s)."
  end

end
