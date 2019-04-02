NuPack
===============
My implementation of a Nulogy programming exercise. Here is a link to the [exercise prompt](./exercise_prompt.md).

#### Assumptions and notes:
* Main program input is a single argument; a comma separated string containing three order-dependent input parameters.
* Spec suite written in Ruby's MiniTest.
* This exercise is a demonstartion of the use of various programming idioms and how I would organize a project directory.


###### Main program output

```ruby
 Main.run(input: "$1,299.99, 3 people, food")
 # =>"$1,591.58"

Main.run(input: "$5,432.00, 1 person, drugs")
# => "$6,199.81"

 Main.run(input: "$12,456.95, 4 people, books")
 # => "$13,707.63"
```
