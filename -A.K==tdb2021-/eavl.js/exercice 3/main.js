//-------a.k--ex-4--v.2---
function tableName() {

    let tab = ["Audrey", "Aurelien", "Flavien", "Jeremy", "Laurent", "Melik", "Nouara", "Salem", "Samuel", "Stephane"];
    let tabName = prompt("Veuillez écrire un prénom parmis les suivants : " + tab);
    for (let i = 0; i < tab.length; i++) {
        tab[i] = tab[i].toUpperCase();
    };
    bigName = tabName.toUpperCase();
    let check = tab.includes(bigName);
    if (check) {
        tab.splice(tab.indexOf(bigName), 1);
        tab.push("")
    } else {
        alert("Vous n'avez pas taper un nom parmis les suivants : " + tab);
        window.location.reload(tableName());
    }
    alert("this is the new tab:\n" + tab + '.');
}
tableName();