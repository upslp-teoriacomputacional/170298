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