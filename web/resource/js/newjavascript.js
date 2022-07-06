//check invalid field
(function () {
    'use strict';
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation');
    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }

                    form.classList.add('was-validated');
                }, false);
            });
})();

//change event
const forget = document.getElementById('forget-form');
const register = document.getElementById('register');
const login = document.getElementById('login');
const btn = document.getElementById('btn');
const btn1 = document.getElementById('btn1');
const logo = document.getElementById('logo');
const btn3 = document.getElementById('btn3');
const btn2 = document.getElementById('btn2');
btn.addEventListener('click', function handleClick() {
    if (register.style.display === 'none') {
        register.style.display = 'block';
        login.style.display = 'none';
        logo.style.display = 'none';
    } else {
        register.style.display = 'none';
    }
});
btn1.addEventListener('click', function handleClick() {
    if (login.style.display === 'none') {
        login.style.display = 'block';
        register.style.display = 'none';
        logo.style.display = 'block';
    } else {
        register.style.display = 'none';
    }
});
btn3.addEventListener('click', function handleClick() {
    if (forget.style.display === 'none') {
        forget.style.display = 'block';
        login.style.display = 'none';
        logo.style.display = 'none';
    } else {
        forget.style.display = 'none';
        logo.style.display = 'block';
    }
});
btn2.addEventListener('click', function handleClick() {
    if (forget.style.display === 'block') {
        forget.style.display = 'none';
        login.style.display = 'block';
        logo.style.display = 'none';
    }
});

//chck validate passowrd
function validate_password() {

    var pass = document.getElementById('register_password').value;
    var confirm_pass = document.getElementById('register_confirm_password').value;
    if (pass != confirm_pass) {
        $('#alert-pass').html('Not Matching!').css('color', '#dc3545');
        document.getElementById('create-account1').disabled = true;
        document.getElementById('create-account1').style.opacity = (0.4);
    } else {
        $('#alert-pass').html('Matching!').css('color', 'green');
        document.getElementById('create-account1').disabled = false;
        document.getElementById('create-account1').style.opacity = (1);
    }
}
function validate_password1() {

    var pass = document.getElementById('forget_password').value;
    var confirm_pass = document.getElementById('forget_confirm_password').value;
    if (pass != confirm_pass) {
        $('#alert-pass1').html('Not Matching!').css('color', '#dc3545');
        document.getElementById('nextBtn').disabled = true;
        document.getElementById('nextBtn').style.opacity = (0.4);
    } else {
        $('#alert-pass1').html('Matching!').css('color', 'green');
        document.getElementById('nextBtn').disabled = false;
        document.getElementById('nextBtn').style.opacity = (1);
    }
}
var currentTab = 0;
showTab(currentTab);

function showTab(n) {

    var x = document.getElementsByClassName("tab");
    x[n].style.display = "block";
    if (n === 0) {
        document.getElementById("prevBtn").style.display = "none";
    } else {
        document.getElementById("prevBtn").style.display = "inline";
    }
    if (n === (x.length - 1)) {
        document.getElementById("nextBtn").innerHTML = "Submit";
    } else {
        document.getElementById("nextBtn").innerHTML = "Next";
    }
    fixStepIndicator(n);
}

function nextPrev(n) {

    var x = document.getElementsByClassName("tab");
    if (n === 1 && !validateForm()){
        return false;
    }
    x[currentTab].style.display = "none";

    currentTab = currentTab + n;

    if (currentTab >= x.length) {

        document.getElementById("forget-form").submit();
        return false;
    }
    showTab(currentTab);
}
function validateForm() {

  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");

  for (i = 0; i < y.length; i++) {

    if (y[i].value == "") {

      valid = false;
    }
  }
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid;
}
function fixStepIndicator(n) {
    var i, x = document.getElementsByClassName("step");
    for (i = 0; i < x.length; i++) {
        x[i].className = x[i].className.replace(" active", "");
    }

    x[n].className += " active";
}
