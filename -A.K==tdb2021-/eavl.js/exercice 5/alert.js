
//----
function validNom() {
    if (document.getElementById('votreNom').value == '') {
        document.getElementById('nomError').innerHTML = 'Le champ ne peut être vide';
        return false;
    } else {
        document.getElementById('nomError').innerHTML = '';
        swal({
            icon: "success",
        });
        return true;
    }
}

function validPrenom() {
    if (document.getElementById('votrePrenom').value == '') {
        document.getElementById('prenomError').innerHTML = 'Le champ ne peut être vide';
        return false;
    } else {
        document.getElementById('prenomError').innerHTML = '';
        swal({
            icon: "success",
        });
        return true;
    }
}

function validAdresse() {
    if (document.getElementById('votreAdresse').value == '') {
        document.getElementById('adresseError').innerHTML = 'Le champ ne peut être vide';
        return false;
    } else {
        document.getElementById('adresseError').innerHTML = '';
        swal({
            icon: "success",
        });
        return true;
    }
}

function validVille() {
    if (document.getElementById('votreVille').value == '') {
        document.getElementById('villeError').innerHTML = 'Le champ ne peut être vide';
        return false;
    } else {
        document.getElementById('villeError').innerHTML = '';
        swal({
            icon: "success",
        });
        return true;
    }
}
//-----ceci-email----
function validEmail() {
    if (document.getElementById('votreEmail').value == '') {
        document.getElementById('emailError').innerHTML = 'Le champ ne peut être vide';
        return false;
    } else {
        document.getElementById('emailError').innerHTML = '';
        swal({
            icon: "success",
        });
        return true;
    }
}
//-- ceci-un-test-checkbox--
function validcheckBox() {
    if (document.getElementById('checkBoxBtn').value == '') {
        document.getElementById('checkError').innerHTML = 'Le champ ne peut être vide';
        return false;
    } else {
        document.getElementById('checkError').innerHTML = '';
        swal({
            icon: "success",
        });
        return true;
    }
}
//--sweetalert2---

function sweetAlert() {
    swal("A wild Pikachu appeared! What do you want to do?", {
            buttons: {
                cancel: "Run away!",
                catch: {
                    text: "Throw Pokéball!",
                    value: "catch",
                },
                defeat: true,
            },
        })
        .then((value) => {
            switch (value) {

                case "defeat":
                    swal("Pikachu fainted! You gained 500 XP!");
                    break;

                case "catch":
                    swal("Gotcha!", "Pikachu was caught!", "success");
                    break;

                default:
                    swal("Got away safely!");
            }
        });
}

function sweetClick() {
    swal({
            title: "Are you sure?",
            text: "Once deleted, you will not be able to recover this imaginary file!",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
        .then((willDelete) => {
            if (willDelete) {
                swal("Poof! Your imaginary file has been deleted!", {
                    icon: "success",
                });
            } else {
                swal("Your imaginary file is safe!");
            }
        });

}