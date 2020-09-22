Programa de Perl en donde se trabaja con diferentes tipos de operaciones de 3 conjuntos de elementos.

1. Primero para la instalacion de perl y el codificador utilice PadrePerl del siguiente link. https://code.google.com/archive/p/dwimperl/downloads
Despues realice la intalacion como tal otra y ya que instalo, abri mi cmd y ejecute estos comandos
---cPAN App::cpanminus
--cpanm Set::Scalar
2. Prosegui a investigar como funcionaban la sintaxis de perl y encontre una pagina en la cual me decia como imprimir y como declarar los conjuntos y darles o meter elementos a los conjuntos.

y este es mi codigo del programa.

#!/usr/bin/perl


# Nombre Archivo 170298_Conjuntos.pl
# Nombre: Manuel Camacho Rodriguez
# Matricula:170298
# Profesor: Juan Carlos González Ibarra
# Descripcion: Programa en el cual se ve la sintaxis de los conjuntos y sus operaciones.

use strict;
use warnings;
use Set::Scalar; #Librerias


print "Antes que nada para un buen comienzo en un nuevo lenguaje de programacion para mi y por tradicion\n\n" ;
print "Hola Mundo en Perl\n\n\n" ;

#definir 3 conjutnos
my $A = Set::Scalar->new();
my $B = Set::Scalar->new();
my $C = Set::Scalar->new();

#Se le asignan valores a los conjuntos
$A->insert(1..4);
$B->insert(2..8);
$C->insert(4..8);

#IMPRIME LOS CONJUNTOS
print "Conjunto A : $A\n"; 
print "Conjunto B : $B\n";
print "Conjunto C : $C\n\n\n";

#remove un elemento del conjunto 

print "Borrando los elementos 1,2,3 del conjunto A: $A\n";
$A->delete(1,2,3); #Borra los elementos 1,2,3
print "Conjunto A : $A\n\n\n"; 


#remove todos los elementos del conjunto 
print "Borrando los elementos del conjunto C: $C\n";
$C->clear;  # Borra los elementos del conjunto C
print "Conjunto C : $C\n\n\n";


#GENERA NUEVAMENTE LOS VALORES DE LOS CONJUNTOS A,B,C
$A->insert(1..4);
$B->insert(2..8);
$C->insert(4..8);

#Copy un conjunto 
my $CopyC = Set::Scalar->new();


$CopyC->insert();
$CopyC = $C->copy;         # Clone of clone.
print "Copia del conjunto C : $CopyC\n\n\n";


# %% Añadir un elemento 
print "Anadiendo los elementos 10,11,12 al conjunto A: $A\n";
$A->insert(10,11,12);
print "Conjunto A : $A\n\n\n"; 


# ****Operaciones de conjunto ****


#Intersection
my $i = Set::Scalar->new();
$i->insert();

$i = $B * $C;
print "La interseccion de B y C es: : $i\n\n\n";


#Diference 
my $d = Set::Scalar->new();
$d->insert();
$d = $B - $C;  
print "La diferencia de B y C es: : $d\n\n\n";


#Symmetric diferencia 
my $sd = Set::Scalar->new();
$sd->insert();
$sd = $A % $C;  
print "La diferencia simetrica de A y C es: : $sd\n\n\n";


$A->insert(1..10);
$C->insert(4..8);

#Subset 
print "¿¿El conjunto A es subconjunto de C ???\n\n";
my $is = Set::Scalar->new();
$is = $A->is_subset($C);
print "$is";

if ($is==1)
{
	print "El conjunto A es subconjuntoO de C \n\n";
}else{
	print "El conjunto A no es subconjunto de C \n\n";

}



#Superset 
print "El conjunto A es superconjunto de C ???\n\n";
my $iS = Set::Scalar->new();
$iS = $A->is_superset($C);
print "$iS";

if ($iS==1)
{
	print "El conjunto A es superconjunto de C \n";
}else{
	print "El conjunto A no es superconjunto de C \n";

}#!/usr/bin/perl

# Nombre Archivo 170298_Compuestas.pl
# Nomgbre: Manuel Camacho Rodriguez
# Matricula: 170298
# Profesor: Juan Carlos González Ibarra
# Descripcion: Programa en el cual se crean tablas de verdad.

use strict;
use warnings;

my @b = (0,1); #Arreglo con verdadero y falso

printf "\n\nTabla de verdad or\n";
printf "x        y       x or y\n\n";  #or

my $x;
my $y;#variables para los ciclos for for

for ($x = 0; $x <= 1; $x++){#imprime los valores  x e y y en el or son la suma de x e y con un resultado verdadero
    for ($y = 0; $y <= 1; $y++) {        
        printf "%d        %d            %d\n",$b[$x],$b[$y],($b[$x] or $b[$y]);                
    }     
}

printf "\n Tabla de verdad and\n";# imprime cuando x e y son verdaderos arroja un verdadero 1
printf "\nx      y       x and y\n\n"; #and


for ($x = 0; $x <= 1; $x++){
    for ($y= 0; $y<= 1; $y++) {                 
        printf "%d      %d           %d\n",$b[$x],$b[$y],($b[$x] and $b[$y]);                
    }     
}
printf "\nTabla de verdad not\n"; # imprime tabla con la contraria de x
printf "\nx      not x\n\n"; #not


for ($x = 0; $x <= 1; $x++){
    printf "%d           %d\n",$b[$x],not($b[$x]);                          
}


printf "\n Tabla de verdad ^\n"; #cuando sea x e y iguales va arrojar un falso 0
printf "\nx      y       x ^ y\n\n"; #^


for ($x = 0; $x <= 1; $x++){
    for ($y = 0; $y <= 1; $y++) {                 
        printf "%d      %d        %d\n",$b[$x],$b[$y],($b[$x] xor $b[$y]);                
    }     
}







