let age;
Y = 0;
A = 0;
O = 0;

do {
    age = parseInt(prompt("Quel est l'âge de la personne ?"));

    if (isNaN(age)) {
        age = parseInt(prompt("On demande des chiffres.. Merci de recommencer."))
    } else if (age < 20) {
        Y++;
    } else if (age >= 20 && age <= 40) {
        A++;
    } else if (age > 40) {
        O++;
    }
} while (age != 100);

alert("Nombre de jeunes : " +
    Y + "\nNombre d'adultes : " +
    A + "\nNombre de personnes agées : " +
    O);