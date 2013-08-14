function doPasswordsMatch() {
  if ($("#password").val() != $("#password_confirmation").val()) {
    return "Password fields do not match.";
  }
  return null;
}

function isGoodPassword() {
  var password = $("#password").val();
  var mainRegex = /[A-Za-z0-9]{6}/;
  var numEx = /[0-9]/;
  var charEx = /[A-Za-z0-9]/;
  if (!mainRegex.test(password) || !numEx.test(password) || !charEx.test(password)) {
    return "Password must be at least six characters long, and have at least one number in it.";
  }
  return null;
}

function isValidEmail() {
  var email = $("#email").val();
  var regex = /[^@]+@[^@]+\.com/;
  if (!regex.test(email)) {
    return "Email is not valid."
  }
  return null;
}

function setErrorMessage(error) {
  alert(error);
}

$("document").ready(function() {
    $("#submit").click(function(event) {
      var errors = [doPasswordsMatch(), isGoodPassword(), isValidEmail()];
      var finalErrors = [];

      for (var i = 0; i < errors.length; i++) {
        if (errors[i] != null) {
          finalErrors.push(errors[i]);
        }
      }

      if (finalErrors.length != 0) {
        event.preventDefault();
        setErrorMessage(finalErrors[0]);
      }

    });
  })
