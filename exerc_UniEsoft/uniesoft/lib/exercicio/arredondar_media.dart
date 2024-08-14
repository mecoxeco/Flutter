
const int multiplo = 5;

int arredondaMedia(int media) {

 int restoMultiplo = media % multiplo;

 if(multiplo - restoMultiplo < 3 ){
    return media - restoMultiplo + multiplo;
 } 

 return media;

} 