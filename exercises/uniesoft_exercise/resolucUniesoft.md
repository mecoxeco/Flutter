var restoMultiplo =(nota % multiplo);

if (multiplo - restoMultiplo <3 ) {
    return nota - restoMultiplo + multiplo;
}

return nota;