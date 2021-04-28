///a.k-ex-4-v.2--

main()

function main() {
    checkAll()
    redux(total)
}
//-------------------
function checkAll() {
    var total = checkTotal()
    checkNumber(total)
}
//-------------------
function redux(total) {
    let fdp = 0.02 * total;
    let finalPrice
    if (total < 100) {
        alert('Prix  : ' + total)
    }
    if (total >= 100 && total <= 200) {
        finalPrice = total * 0.95
        alert('Prix avant Remise : ' + total + '\n' + 'Prix après remise : ' + finalPrice)
    }
    if (total > 200) {
        finalPrice = total * 0.90
        alert('Prix avant Remise : ' + total + '\n' + 'Prix après remise : ' + finalPrice)

    } else if (fdp < 6) {
        fdp = 6
    }
    if (finalPrice > 500) {
        fdp = 0
    }
    alert('Fais de port :' + fdp)
}
//--------------------------------

function checkNumber(total) {
    if (isNaN(total)) {
        alert('Il faut écrire des nombres')
        checkAll()
    }
}
//----------------------------------------
function checkTotal() {
    let prixU = parseFloat(prompt('Prix unitaire'));
    let quantite = parseInt(prompt('Quantité commandée'));
    total = prixU * quantite;
    return total
}