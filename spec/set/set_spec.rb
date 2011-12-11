require 'spec_helper'

module DataStructure
  describe SetStructure do
    let(:set) { SetStructure.new }

    describe "#new" do
      it "initializes a new set" do
        set.size.should == 0
        set.empty?.should be_true
        set.contains?("one").should be_false
      end

      context "when it receives arguments" do
        it "initializes a new set with the arguments as elements" do
          set = SetStructure.new("one","two")
          set.size.should == 2
          %w(one two).each do |e|
            set.contains?(e).should be_true
          end
        end
      end
    end

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

      context "when the element does not belong to the structure" do
        it "returns false" do
          set.contains?("two").should be_false
        end
      end
    end

    describe "#add" do
      context "when the element does not belong to the structure" do
        it "adds the new element" do
          expect {
            set.add("one")
          }.to change{ set.size }.by(1)
          set.contains?("one").should be_true
        end
      end

      context "when the element belongs to the structure" do
        it "does not duplicate the new element" do
          expect {
            set.add("one")
            set.add("one")
          }.to change{ set.size }.by(1)
          set.contains?("one").should be_true
        end
      end
    end

    %w(size length).each do |method|
      describe "##{method}" do
        it "returns the number of elements into the structure" do
          set.send(method).should == 0
          set.add("one")
          set.send(method).should == 1
          set.add("two")
          set.send(method).should == 2
        end
      end

      describe "##{method}=" do
        it "raises an error" do
          expect {
            set.send("#{method}=", 0)
          }.to raise_error
        end
      end
    end

    describe "#remove" do
      context "when the structure is empty" do
        it "does nothing" do
          set.remove("one")
          set.size.should == 0
          set.contains?("one").should be_false
        end
      end

      it "removes the element from the structure" do
        %w(one two third).each do |e|
          set.add(e)
        end

        expect {
          set.remove("two")
        }.to change{ set.size }.from(3).to(2)

        %w(one third).each do |e|
          set.contains?(e).should be_true
        end
        set.contains?("two").should be_false
      end
    end
  end
end
