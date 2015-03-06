function validateForm() {
  var input = document.forms["grocery"]["item"].value;
    if (input == null || input == "") {
      alert("Please enter an item!");
      return false;
    }
}   
