def mixed_fraction(s)
  n = s.split('/')[0].to_i
  d = s.split('/')[1].to_i
  num = (n / d).floor
  num1 = num.zero? ? nil : num.to_s + ' '
  (n % d).zero? ? num.to_s : "#{num1}#{Rational(n - (num * d), d)}"
end
