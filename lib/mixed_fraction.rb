def mixed_fraction(s)
  n = s.split('/')[0].to_i
  d = s.split('/')[1].to_i
  num = (n / d).floor
  (n % d).zero? ? num.to_s : "#{num} #{Rational(n - (num * d), d)}"
end
