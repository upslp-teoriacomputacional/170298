# Nombre Archivo 170298_palindromo.pl
# Nombre: Manuel Camacho Rodriguez
# Matricula: 170298
# Profesor: Juan Carlos González Ibarra
#Muestra si una cadena es o no es un palindromo

use strict;
use warnings;

print "Ingrese una cadena a evaluar:\n";

my $cadena = <STDIN>; #entrada de la cadena

$cadena =~ s/\s//g; #Quita los espacios de la cadena
$cadena =~ tr/A-Z/a-z/; #Convierte todo a minusculas.
#
my @palindromo = split //,$cadena;

sub pald{	
	my @re = reverse(@palindromo); 
	
	my $cont = 0;	
	
	for(@palindromo){
		if ($palindromo[$cont] ne $re[$cont]){ #si no coincide alguna parte en la cadena significa que no es un palindromo y regresa un 0 para la hora de imprimir
				return 0;
		}
		$cont+=1; #Va recorriendo la cadena 
	}
	return 1;
}
	
if (&pald == 1){ #Dependiendo de los valores que regresen si es o no es 
	print "La palabra $cadena es un palindromo";
}else{
	print "La palabra $cadena  no es un palindromo";
}