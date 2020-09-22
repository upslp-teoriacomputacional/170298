#!/usr/bin/perl

# Nombre Archivo 170298_Compuestas.pl
# Nombre: Manuel Camacho Rodriguez
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
