$("#get_dish").on("click", function() {
  $.get("/random_dish.json", function(randomDish) {
    alert(randomDish["dish"]);
  });
});
