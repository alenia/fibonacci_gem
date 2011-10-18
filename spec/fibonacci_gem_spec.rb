require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "FibbonacciGem" do
  describe "#fib(n)" do
    it "should return 0 if n = 0 and 1 if n = 1" do
      fib(0).should == 0
      fib(1).should == 1
    end
    it "should return fib(n-1) + fib(n-2) if n > 1" do
      20.times do |n|
        n += 2
        fib(n).should == fib(n-1) + fib(n-2)
      end
    end
  end
  
  describe "#which_fib(F)" do
    context "when the integer is a fibonacci number" do
      it "should correctly for the base cases" do
        which_fib(0).should == 0
        which_fib(1).should == 1 #note that fib(1) == fib(2)
      end
      it "should return n for fib(n)" do
        20.times do |n|
          n += 3
          which_fib(fib(n)).should == n
        end
      end
    end
  end
  
  describe "Integer.closest_fibonacci" do
    it "should return false if n is negative" do
      -1.closest_fibonacci.should be_false
    end
    context "when the integer is a fibonacci number" do
      it "should return fib(n) for fib(n)" do
        100.times do |n|
          fib(n).closest_fibonacci.should == fib(n)
        end
      end
    end
    context "when the integer is not fibonacci number" do
      it "should return fib(n) for the integer fib(n) + 1 (when  fib(n) + 1 is not itself a fibonacci number)" do
        100.times do |n|
          n += 4
          (fib(n) + 1).closest_fibonacci.should == fib(n)
        end
      end
      it "should return fib(n-1) for the integer fib(n) - 1 (when fib(n) - 1 is big enough and not a fibonacci number)" do
        100.times do |n|
          n += 5
          (fib(n) - 1).closest_fibonacci.should == fib(n-1)
        end
      end
    end
  end
end
