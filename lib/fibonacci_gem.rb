class Integer
  def closest_fibonacci
    return false if self < 0
    return self if self == 0 || self == 1
    n = which_fib(self)
     fib(n) <= self  ? fib(n) : fib(n-1)
  end
end


def fib(n)
  phi = (1 + Math.sqrt(5))/2
  phi_conjugate = (1-Math.sqrt(5))/2
  f = (phi**n - phi_conjugate**n)/Math.sqrt(5)
  f.to_i
end

def which_fib(f)
  return 0 if f == 0
  n = log_base_phi(f*Math.sqrt(5) + 1/2)
  n = n > 6? n.round(2) : n.round(1) #the higher the number gets the greater the precision of which_fib(f)
  n.to_i
end

def log_base_phi(x)
  phi = (1 + Math.sqrt(5))/2
  Math.log(x)/Math.log(phi)
end