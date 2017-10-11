require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Jay") }
  subject(:brownies) { Dessert.new("brownies", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownies.type).to eq("brownies")
    end

    it "sets a quantity" do
      expect(brownies.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(brownies.ingredients).to be_an_instance_of(Array)
      expect(brownies.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("test", "string", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownies.add_ingredient("eggs")
      expect(brownies.ingredients).to include("eggs")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      brownies.add_ingredient("eggs")
      brownies.add_ingredient("milk")
      brownies.add_ingredient("sugar")
      orig_order = brownies.ingredients.dup
      brownies.mix!
      expect(brownies.ingredients).to_not eq(orig_order)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownies.eat(6)
      expect(brownies.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{ brownies.eat(11) }.to raise_error(RuntimeError, "not enough left!")
    end
  end

  describe "#serve" do
    # allow(chef).to receive(:name) { "chef" }
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jay the Great Baker")
      # expect(brownies.serve).to eq("Chef Jay the Great Baker has made 10 brownies!")
      expect(brownies.serve).to include("Chef Jay the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(brownies)
      brownies.make_more
    end
  end
end
