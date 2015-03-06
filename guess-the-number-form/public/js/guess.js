function getRandomInt() {
    return Math.floor(Math.random() * 100) + 1;
  }


function gameTurn(userGuess, compGuess) {
      if (userGuess == compGuess) {
        return userGuess + " is correct!";
    } else if (userGuess > compGuess) {
        return userGuess + " is too high!";
    } else {
        return userGuess + " is too low!";
  }}


var compGuess = getRandomInt();

$(document).ready(function () {
  $("#form").submit(function (event) {
    event.preventDefault();
    var strGuess = $("#guess").val();
    var userGuess = parseInt(strGuess);

    $("#result").append("<li class='answers'>" + gameTurn(userGuess, compGuess) + "</li>");
  });

  $("#reset").click( function() {
    compGuess = getRandomInt();
    $(".answers").remove();
  });

});
