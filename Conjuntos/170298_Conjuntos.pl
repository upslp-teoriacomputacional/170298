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

}
