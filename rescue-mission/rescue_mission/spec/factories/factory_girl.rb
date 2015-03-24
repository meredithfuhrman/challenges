FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "meredith.fuhrman#{n}@gmail.com"}
    password "Password123"
  end

  factory :question do
      title "This is a Test Title for a Test Question"
      description "This is a test question that needs to be at least as long as one whole tweet. Tweet, tweet, tweet. Bullshit tweets for all. This is a test question that needs to be at least as long as one whole tweet. Tweet, tweet, tweet. Bullshit tweets for all."
      user
  end

  factory :answer do
      description "This is a test answer that needs to be as long as a third of a tweet"
      question
      answer
  end
end
