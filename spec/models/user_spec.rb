require 'rails_helper'

describe User do

  it "has the username set correctly" do
    user = User.new username:"Pekka"
    expect(user.username).to eq("Pekka")
  end

  it "is not saved without a password" do
    user = User.create username:"Pekka"
    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "is not saved with password that has less than 4 charachters" do
    user = User.create username:"Pekka", password:"Se1"
    expect(user.valid?).to be(false);
    expect(User.count).to eq(0)
  end

  it "is not saved with password that only has lowercase letters" do
    user = User.create username:"Pekka", password:"asdasdasd"
    expect(user.valid?).to be(false);
    expect(User.count).to eq(0)
  end

  describe "favorite beer" do
    let (:user){FactoryGirl.create(:user)}


      it "has method for determining one" do
        expect(user).to respond_to(:favorite_beer)
      end

      it "without ratings does not have one" do
        expect(user.favorite_beer).to eq(nil)
      end

    it "is the only rated if only one rating" do
      beer = create_beer_with_rating(10, user)
      expect(user.favorite_beer).to eq(beer)
    end

    it "is the one with highest rating if several rated" do
      create_beers_with_ratings(10, 20, 15, user)
      best = create_beer_with_rating(25, user)

      expect(user.favorite_beer).to eq(best)
    end

  end#describe favourite beer

  describe "favourite style" do
    let(:user){FactoryGirl.create(:user)}

    it "has method for determining one" do
      expect(user).to respond_to(:favorite_style)
    end

    it "is the only rated if only one style has ratings" do
      beer = create_beer_with_rating(10, user)
      expect(user.favorite_style).to eq(beer.style)
    end

  end


  describe "with proper password" do
    let(:user){FactoryGirl.create(:user)}

    it "is saved" do
      expect(user.valid?).to be(true)
      expect(User.count).to eq(1)
    end

    it "and with two ratings, has the correct average rating" do
      user.ratings << FactoryGirl.create(:rating)
      user.ratings << FactoryGirl.create(:rating2)

      expect(user.ratings.count).to eq(2)
      expect(user.average_rating).to eq(15.0)
    end

  end#describe with proper password

  def create_beer_with_rating(score, user)
    beer = FactoryGirl.create(:beer, name:"#{user}-beer-#{score}")
    FactoryGirl.create(:rating, score:score, beer:beer, user:user)
    return beer
  end

  def create_beers_with_ratings(*scores, user)
    scores.each do |score|
      create_beer_with_rating(score, user)
    end
  end

end