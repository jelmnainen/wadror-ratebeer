require 'rails_helper'

describe Beer do

  it "is not created if it doesn't have name" do
    beer = Beer.create(style:"Weizen")

    expect(beer.valid?).to be(false)
    expect(Beer.count).to eq(0)
  end

  it "is not created if it doesn't have a style" do
    beer = Beer.create(name:"testiolut")

    expect(beer.valid?).to be(false)
    expect(Beer.count).to eq(0)
  end

  it "is created if it has a name and a style" do
    beer = Beer.create(name:"testiolut", style:"Weizen")

    expect(beer.valid?).to be(true)
    expect(Beer.count).to eq(1)
  end

end