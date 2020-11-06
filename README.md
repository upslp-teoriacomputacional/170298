# 170298
#!/bin/usr/perl

# Nombre Archivo 170298_dfa.pl
# Nombre: Manuel Camacho Rodriguez
# Matricula: 170298
# Profesor: Juan Carlos González Ibarra

use strict;
use warnings;


my $simbolo = ""; #variables
my $fin = "";

sub caracter {
    $simbolo = "";#inicializar variable
    $fin = "";
    my $digito = "[0-9]"; 
    my $operador = "(\+|\-|\*|\/)";
    #print "$_[0]\n";
                if ($_[0] =~  m/[0-9]/ ){ #comprueba si es un numero
                    $simbolo = " Digito ";
                    return 0;
                }else{
                    if($_[0] =~  m/[\+\-\/\*]/){ #si es un operador
                        $simbolo = "Operador";
                        return 1;
                    }else{
                        if ($_[0] == " "){#si es algo nulo
                            return 2;            
                        }
                        
                    }
                    print "Error el carcater: $_[0] no es  valido\n";
                    exit();
                    
                }       
                
            }

sub encabezado {
    print "\tEdo. Actual \tCaracter \t Simbolo  Edo. Siguiente |\n";
    &body;
}

sub contenido{
    print("|     $_[0]        |    $_[1]\t | $_[2]  |       $_[3]\t     |");
    &body;
}

sub body{
    print "\n+--------------+---------+-----------+---------------+\n";
}

print "Ingrese una cadena a evaluar:   \n\n";


#tabla de transiciones del automata AFD
my @tabla = ([1,"E","E"],["E",2,"E"],[3,"E","E"],["E","E","A"]);

my $estado = 0;

my $cadena = <STDIN>;
&body;
&encabezado;

#ciclo para recorrer la cadena
my $character = "";
foreach $character (split //, $cadena) {
    #print "$char\n";
    my $estadosig = $estado;
  
    #llamamos al metodo para saber si es un caracter valido y el valor retornado se guarda en charcaracter
    my $charcaracter = &caracter($character);
    
    #guardamos en estado el valor obtenido en la tabla segun las cordenadas que recibio anteriormente
    $estado=$tabla[$estado][$charcaracter];
    
    if ($estado eq "E"){
        print "|     $estadosig        |  $character\t|$simbolo |\t$estado  \t|";
        &body;
        print "|              Cadena No Valida :(g                   |";
        print "\n+----------------------------------------------------+\n";
        exit();
    }
    &contenido($estadosig,$character,$simbolo,$estado);       
}

if ($estado != 3){ #mustra cadena invalida cuando cumpla las condiciones
    print "|              Cadena No Valida :((                   |\n";

}    

if ($estado == 3){ #Cuando sea una cadena valida muestra el siguinete mensaje
    print "|\t$estado\t|\t\t|Fin Cadena |\t\t|";
    &body;
     print "\n|                Cadena Valida :)                     |\n";

}     


...

# Nombre Archivo 170298_ER.pl
# Nombre: Manuel Camacho Rodriguez
# Matricula: 170298
# Profesor: Juan Carlos González Ibarra
# Descripcion: Expresiones regulares.

use strict;
use warnings;

my %tokens=();
my @source_code =  split /\s+/, 'int es + 6;'; #cadena 

my $word;


foreach $word (@source_code){
    
    # Buscara el tipo de dato
    if ($word =~ m/str|int|bool/){        
		$tokens{'DATATYPE'} = $word;
    #Buscara un identificador que solo es una palabra
    }elsif($word =~ m/[a-z A-Z]/){		       
		$tokens{'IDENTIFIER'} = $word;
    # Buscara el operador
    }elsif($word =~ m/[\+\-\/\*\=\%]/){        
		$tokens{'OPERATOR'} = $word;
    # Busca Elementos y los convierte en enteros   
    }elsif ($word =~ m/[0-9]/){
		my @wd = $word;		 	
		if($wd[scalar(@wd)-1] =~ m/;/){			
			$tokens{'INTEGER'} = substr $word,0,-1;
			$tokens{'END STATEMENT'} = ';';
		}else{			   
		   $tokens{'INTEGER'} = $word;
		}	
	}
}
my $key;
my $value;

while ( ($key, $value) = each %tokens ) {
 print "$key => $value\n"; #Imprimira la salida del codigo
}


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
