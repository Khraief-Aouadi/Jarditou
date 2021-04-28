var a;
do {
    a = prompt("Saisissez un nomre entier");
} while (isNaN(a) || a % 1 !== 0);

document.write("La table de multiplication du nombre: " + a + ".")
document.write("<table border >");

for (var i = 1; i <= 10; i++) {
    document.write("<tr>");
    document.write("<td>" + a + " x " + i + " =</td>");
    document.write("<td>" + a * i + "</td>");
    document.write("</tr>");
}
document.write("</table>");