function openModal() {
    var pwd = document.getElementById('pwd');
    var cpwd = document.getElementById('reped');
    var lower = document.getElementById('lower');
    var upper = document.getElementById('upper');
    var digit = document.getElementById('number');
    var sym = document.getElementById('symbol');
    var leng = document.getElementById('length');
    var match = document.getElementById('match');

    pwd.onkeyup = function () {
        var lowerCase = /[a-z]/g;
        var upperCase = /[A-Z]/g;
        var digitCheck = /[0-9]/g;
        var symbolsCheck = /[!@#$%^&*()]/g;
        var minLeng = 10;

        if(pwd.value.match(lowerCase)) {
            lower.classList.remove("invalid");
            lower.classList.add("valid");
        } else {
            lower.classList.remove("valid");
            lower.classList.add("invalid");
        }

        if(pwd.value.match(upperCase)) {
            upper.classList.remove("invalid");
            upper.classList.add("valid");
        } else {
            upper.classList.remove("valid");
            upper.classList.add("invalid");
        }
        if(pwd.value.match(digitCheck)) {
            digit.classList.remove("invalid");
            digit.classList.add("valid");
        } else {
            digit.classList.remove("valid");
            digit.classList.add("invalid");
        }
        if(pwd.value.match(symbolsCheck)) {
            sym.classList.remove("invalid");
            sym.classList.add("valid");
        } else {
            sym.classList.remove("valid");
            sym.classList.add("invalid");
        }
        if(pwd.value.legnth >= minLeng) {
            leng.classList.remove("invalid");
            leng.classList.add("valid");
        } else {
            leng.classList.remove("valid");
            leng.classList.add("invalid");
        };;

        cpwd.onkeyup = function () {
            var equalsCPwd = (pwd.value == cpwd.value);
            if(equalsCPwd) {
                match.classList.remove("invalid");
                match.classList.add("valid");
            } else {
                match.classList.remove("valid");
                match.classList.add("invalid");
            }

            enableButton(lower, upper, digit, leng, match);
        };;
    }
    
}