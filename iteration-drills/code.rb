
#Write Ruby<->English answers here as comments in your code

array = [28214, 63061, 49928, 98565, 31769, 42316, 23674, 3540, 34953, 70282, 22077, 94710, 50353, 17107, 73683, 33287, 44575, 83602, 33350, 46583]

# Write Ruby code to find out the answers to the following questions:

# * What is the sum of all the numbers in `array`?
puts
sum = 0
array.each { |number| sum += number }
puts sum

#using array method reduce
puts array.reduce(:+)

# * How would you print out each value of the array?
puts
array.each {|number| puts number}

# * What is the sum of all of the even numbers?
puts
sum = 0
array.each {|number| sum +=number if number % 2 == 0}
puts sum

#using array method reduce
puts array.select{|number| number %2 == 0}.reduce(:+)


# * What is the sum of all of the odd numbers?
puts
sum = 0
array.each {|number| sum +=number if number % 2 != 0}
puts sum

#using array method reduce
puts array.select{|number| number %2 != 0}.reduce(:+)


# * What is the sum of all the numbers divisble by 5?
puts
sum = 0
array.each {|number| sum +=number if number % 5 == 0}
puts sum

#using array method reduce
puts array.select{|number| number % 5 == 0}.reduce(:+)


# * What is the sum of the squares of all the numbers in the array?
puts
sum = 0
array.each {|number| sum +=number*number}
puts sum

# using methods map and reduce
puts array.map{|number| number * number}.reduce(:+)


array = ["joanie", "annamarie", "muriel", "drew", "reva", "belle", "amari",
  "aida", "kaylie", "monserrate", "jovan", "elian", "stuart", "maximo",
  "dennis", "zakary", "louvenia", "lew", "crawford", "caitlyn"]

# Write Ruby code to find out the answers to the following questions:

# * How would you print out each name backwards in `array`?
puts
array.each {|i| puts i.reverse}

# * What are the total number of characters in the names in `array`?
puts
sum = 0
array.each {|i| sum += i.length }
puts sum

#using map/reduce
puts array.map {|i| i.length}.reduce(:+)

# * How many names in `array` are less than 5 characters long?
puts
puts array.count {|i| i.length < 5}

# * How many names in `array` end in a vowel?
puts
puts array.count {|i| i[-1] =~ /[aeiou]/}

# * How many names in `array` are more than 5 characters long?
puts
puts array.count {|i| i.length > 5 }

# * How many names in `array` are exactly 5 characters in length?
puts
puts array.count {|i| i.length == 5}


best_records = {
 "Tupac"=>"All Eyez on Me",
 "Eminem"=>"The Marshall Mathers LP",
 "Wu-Tang Clan"=>"Enter the Wu-Tang (36 Chambers)",
 "Led Zeppelin"=>"Physical Graffiti",
 "Metallica"=>"The Black Album",
 "Pink Floyd"=>"The Dark Side of the Moon",
 "Pearl Jam"=>"Ten",
 "Nirvana"=>"Nevermind"
 }

#  Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of the artists?
puts
puts best_records.keys

#iteration
best_records.each {|key, value| puts key}

# * How would you print out all the names of the albums?
puts
puts best_records.values

#iteration
best_records.each {|key, value| puts value}

# * Which artist has the longest name?
puts
longest = best_records.keys[0]
best_records.keys.each { |key, value| longest = key if key.length >= longest.length  }
puts longest

#using max_by
best_records.keys.max_by {|key, value| key.length}


# * How would you change all the album titles for every artist to `Greatest Hits`?
puts
best_records.each {|key, value| best_records[key] = "Greatest Hits"}
puts best_records

# * How would you delete a key-value pair if the artist's name ends in a vowel?
puts
best_records.delete_if {|key, value| key[-1] =~ /[aeiou]/ }
puts best_records


ages = {"Arch"=>89, "Gretchen"=>93, "Simone"=>12, "Daija"=>96, "Alivia"=>22, "Serena"=>28, "Alek"=>3, "Lula"=>24, "Christian"=>62, "Darryl"=>47, "Otha"=>32, "Evalyn"=>44, "Lincoln"=>27, "Rebeca"=>99, "Beatrice"=>99, "Kelton"=>10, "Zachary"=>18, "Aurelie"=>91, "Dell"=>71, "Lisandro"=>22}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `ages`?
puts
puts ages.keys

# * How would you print out each key-value pair in the format of `<name> is <age> years old.`?
puts
ages.each {|key, value| puts "#{key} is #{value} years old."}


# * How would you print out every person with odd numbered age?
puts
#using iteration
odd = ages.select {|key, value| value % 2 != 0}
odd.each {|key, value| puts key}

#using map method
ages.map {|key, value| puts key if value %2 != 0}

# * How would you delete everyone under 25 years of age?
puts
ages.delete_if {|key, value| value < 25}
puts ages

# * What is the name and age of everyone with a name greater than or equal to 5 characters?
ages.map {|key, value| puts "#{key}: #{value}" if key.length >= 5}

people =
{
  "Alia O'Conner PhD" => {
         "phone" => "538.741.1841",
       "company" => "Leuschke-Stiedemann",
      "children" => [
          "Simone",
          "Cindy",
          "Jess"
      ]
  },
           "Ike Haag" => {
         "phone" => "(661) 663-8352",
       "company" => "Carter Inc",
      "children" => [
          "Joe",
          "Ofelia",
          "Deron"
      ]
  },
       "Brian Heller" => {
         "phone" => "1-288-601-5886",
       "company" => "O'Conner Group",
      "children" => [
          "Renee"
      ]
  },
       "Maryse Johns" => {
         "phone" => "218-571-8774",
       "company" => "Kuhlman Group",
      "children" => [
          "Dominick",
          "Tricia"
      ]
  },
  "Dr. Adela DuBuque" => {
        "phone" => "1-203-483-1226",
      "company" => "Heidenreich, Nietzsche and Dickinson"
  }
}

# Write Ruby code to find out the answers to the following questions:

# * How would you print out all the names of `people`?
puts
puts people.keys


# * How would you print out all the names of `people` and which company they work for?
puts
people.each {|k,v| puts "#{k}: #{v["company"]}" }


# * What are the names of all the children of everyone in `people`?
puts
people.each {|k,v| puts "#{v["children"]}" }


# * What are the names of all the companies that people work for?
puts
people.each {|k,v| puts "#{v["company"]}"}


# * How would you convert all the phone numbers to the same standard (pick one)?
phones = people.map do |key, value|
  number = value["phone"].chars.select{ |digit| digit =~ /[0-9]/ }.join('')
  number = number[-10, 10] if number.length < 10
  "#{number[0, 3]}-#{number[3, 3]}-#{number[6, 4]}"
end
puts phones


people =
[
    {
          "Derek Wehner" => {
               "phone" => "588-047-7782",
             "company" => "Daniel-Carroll",
            "children" => [
                "Phoebe",
                "Gretchen",
                "Wiley"
            ]
        },
           "Ali Koelpin" => {
               "phone" => "1-127-057-0020",
             "company" => "Rau, Rutherford and Lockman",
            "children" => [
                "Juwan"
            ]
        },
        "Ervin Prohaska" => {
               "phone" => "(393) 630-3354",
             "company" => "Carter Inc",
            "children" => [
                "Virgil",
                "Piper",
                "Josianne"
            ]
        },
          "Hellen Borer" => {
              "phone" => "1-687-825-0947",
            "company" => "Maggio, Ferry and Moen"
        }
    },

    {
        "Elinor Johnson" => {
              "phone" => "819.911.5553",
            "company" => "Pollich Group"
        }
    },

    {
        "Richmond Murray" => {
               "phone" => "1-516-432-2364",
             "company" => "Sporer and Sons",
            "children" => [
                "Kade",
                "Sage"
            ]
        },
            "Nakia Ferry" => {
               "phone" => "134-079-2237",
             "company" => "Hamill, O'Keefe and Lehner",
            "children" => [
                "Rollin"
            ]
        }
    }
]

# Write Ruby code to find out the answers to the following questions:

# * What are the names of everyone in `people`?
puts
combined_people = people[0].merge(people[1]).merge(people[2])
puts combined_people.keys

# * What are the names of all the children in `people`?
puts
combined_people.each {|k,v| puts "#{v["children"]}" }

# * How would you create a new hash called `phone_numbers` that has a key of a name and value of a phone number in `people`?
puts
phone_numbers = combined_people.map { |key, value| {key => value["phone"]} }
puts phone_numbers


# * How would you create a new hash called `employers` that has a key of a name and a value of a company name in `people`?
puts
employers = combined_people.map { |key, value| {key => value["company"]} }
puts employers

# * How would you create a new hash called `children_count` that has a key of a name and a value of the number of children a person has?
puts
children_count = combined_people.map do |key, value|
  { key => value.include?("children") ? value["children"].count : 0 }
end
puts children_count
