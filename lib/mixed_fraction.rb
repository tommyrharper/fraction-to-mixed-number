def mixed_fraction(s)
  numerator = s.split('/')[0].to_i
  denom = s.split('/')[1].to_i

  if (numerator < 0 || denom < 0 ) && (numerator.abs <= denom.abs)
    return Rational(numerator, denom).to_s
  elsif (numerator < 0 || denom < 0 )
    puts "yo"
    num = (numerator.to_f / denom.to_f).ceil
    puts numerator
    puts denom
    puts numerator / denom
    puts num
    num_s = num.zero? ? nil : num.to_s + ' '
    fraction = Rational((numerator - (num * denom)), denom.abs)

  else

    num = (numerator / denom).floor
    num_s = num.zero? ? nil : num.to_s + ' '

    fraction = Rational(numerator - (num * denom), denom)
  end

  (numerator % denom).zero? ? num.to_s : "#{num_s}#{fraction}"
end
