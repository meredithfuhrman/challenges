var lastPageLoaded = 1;
var sprouts = $(".more-sprouts")

sprouts.hide();

$(document).ready(function () {
  $(window).scroll(function() {
     if($(window).scrollTop() + $(window).height() == $(document).height()) {
       lastPageLoaded += 1;
       $.get("/tweets.json?page=" + lastPageLoaded, function(addTweets) {
         addTweets.forEach(function(newTweet) {
           $(".tweets").append("<li class='tweet'><div class='body'>" + newTweet.text +
           "</div><div class='user'>" + newTweet.username + "</div></li>");
         });
       });
     };
  });
});


// Talked with Launch alum Kevin who helped me put together the HTML piece in jQuery:
// var $li = $('<li>').addClass('tweet');
// var $text = $('<div>').addClass('body').html(newTweet.text);
// $(".tweets").append($li.html($text.text() + newTweet.username));
