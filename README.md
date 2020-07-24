# fraction-to-mixed-number

Task

Given a string representing a simple fraction x/y, your function must return a string representing the corresponding mixed fraction in the following format:

[sign]a b/c

where a is integer part and b/c is irreducible proper fraction. There must be exactly one space between a and b/c. Provide [sign] only if negative (and non zero) and only at the beginning of the number (both integer part and fractional part must be provided absolute).

If the x/y equals the integer part, return integer part only. If integer part is zero, return the irreducible proper fraction only. In both of these cases, the resulting string must not contain any spaces.

Division by zero should raise an error (preferably, the standard zero division error of your language).

Value ranges

-10 000 000 < x < 10 000 000
-10 000 000 < y < 10 000 000
Examples

Input: 42/9, expected result: 4 2/3.
Input: 6/3, expedted result: 2.
Input: 4/6, expected result: 2/3.
Input: 0/18891, expected result: 0.
Input: -10/7, expected result: -1 3/7.
Inputs 0/0 or 3/0 must raise a zero division error.
Note

Make sure not to modify the input of your function in-place, it is a bad practice.


## Development Journal

First I ran:
```
rpsec --init
mkdir lib
touch lib/mixed_faction.rb
touch spec/mixed_faction_spec.rb
touch .rubocop.yml
```

Then I added the following rules to ```.rubocop.yml```:
```yml
Style/FrozenStringLiteralComment:
  Enabled: false

AllCops:
  Exclude:
    - 'spec/spec_helper.rb'
```

That is my basic setup done.

### First test

```ruby
require './mixed_fraction.rb'

describe 'mixed_fraction' do
  it 'returns 4 2/3 for 42/9' do
    expect(mixed_fraction('42/9')).to eq '4 2/3'
  end
end
```

RED.

Simplist answer:

```ruby
def mixed_fraction(simple_fraction)
  '4 2/3'
end
```

GREEN.

### Second Test

Now lets write another test and force the code to do something logical.

```ruby
  it 'returns 2 for 6/3' do
    expect(mixed_fraction('6/3')).to eq '2'
  end
```

RED

Here is my solution:

```ruby
def mixed_fraction(simple_fraction)
  numerator = simple_fraction.split('/')[0].to_i
  denominator = simple_fraction.split('/')[1].to_i
  remainder = numerator % denominator

  if remainder == 0
    mixed_fraction = (numerator / denominator).to_s
  else 
    first_number = (numerator / denominator).floor
    new_numerator = (numerator - (first_number * denominator)).to_s
    fraction = Rational(new_numerator, denominator).to_s
    mixed_fraction = "#{first_number.to_s} #{fraction}"
  end
  mixed_fraction
end
```

GREEN.

Okay lets refactor it.

It can be simplified down to the following code:

```ruby
def mixed_fraction(s)
  n = s.split('/')[0].to_i
  d = s.split('/')[1].to_i
  num = (n / d).floor
  (n % d).zero? ? num.to_s : "#{num} #{Rational(n - (num * d), d)}"
end
```

There we are, short and sweet. GREEN.

### Test three

Now I am going to write another test to prove my code wrong.

Test for 2/3:

```ruby 
  it 'returns 2/3 for 2/3' do
    expect(mixed_fraction('2/3')).to eq '2/3'
  end
```

RED.

And a solution, add in these two lines:

```ruby
  num1 = num.zero? ? nil : num.to_s + ' '
  (n % d).zero? ? num.to_s : "#{num1}#{Rational(n - (num * d), d)}"
```

This is getting a bit unreadable, lets improve that.

REFACTOR. GREEN.

### Test 4

New test.

```ruby
  it 'returns -2/3 for -2/3' do
    expect(mixed_fraction('-2/3')).to eq '-2/3'
  end
```

RED.

The solution is another peice of logic: 

```ruby
if numerator < 0
  return Rational(numerator, denom).to_s
end
```

GREEN.

Lets refactor again.

### Test 5

New test for another edge case:

```ruby
  it 'returns -2/3 for 4/-6' do
    expect(mixed_fraction('4/-6')).to eq '-2/3'
  end
```

RED.

Simple fix for this one, adjust the last additional statement to:

```ruby
if numerator < 0 || denom < 0
  return Rational(numerator, denom).to_s
end
```
The extra ```||``` statement takes care of negative denominators.

GREEN.

### Test 6

I found another edge case:

```ruby
  it 'returns -1 3/7 for 10/-7' do
    expect(mixed_fraction('10/-7')).to eq '-1 3/7'
  end
```
