require 'spec_helper'

describe SetStructure do
  let(:set) { SetStructure.new }

  describe "#empty?" do

    context "when the data structure is empty" do
      it "returns true" do
        set.empty?.should be_true
      end
    end

    context "when the data structure is not empty" do
      it "returns false" do
        set.add("one")
        set.empty?.should be_false
      end
    end
  end

  describe "#contains?" do
    context "when the element belongs to the structure" do
      it "returns true" do
        set.add("one")
        set.contains?("one").should be_true
      end
    end

    context "when the element does not belongs to the structure" do
      it "returns false" do
        set.contains?("two").should be_false
      end
    end
  end
end
