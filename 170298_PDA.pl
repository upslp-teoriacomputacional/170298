
use strict;                     
use warnings;
use feature "say";    



use vars qw($simbolo);		
use vars qw($fin);    		
$simbolo = undef;			
$fin = undef;	

our @pila=(" ");

sub caracter {
	my ($character) = @_;		
	$simbolo = "";			
	$fin = "";
	
	if($_[0] =~/a/)
	{	
		$simbolo = "a";
		$a++;
		return 0;
	}
	else
	{
		if($_[0]=~/b/)
		{
				$simbolo = "b";
				pop @pila;
				$b++;
				return 1;
		}
		else
		{	
				$simbolo = "No valido";
				return 2;
				exit();
		}
	}
}


sub encabezado
 {
	say ("\n|  Edo. Actual	|Caracter| Simbolo 	| Edo. Sig   | ");
	&body;
}

sub contenido 
{
	my ($estadosig, $character, $simbolo, $estado) = @_;
	say ("\n|	",$_[0],"	| ",$_[1],"	 | ",$_[2],"		|  ",$_[3],"	     | ",@pila);
	&body;
}


sub body 
{
	say ("\n+---------------+--------+--------------+------------+");
}


my @tabla= ([0,1,2],[1,2,2],[2,2,2];
my $estado = 0;

say ("+-------------------------------------------+"); say ("|    Ingrese una cadena a evaluar:         |"); say ("+-------------------------------------------+");
	
my $cadena = <STDIN>;			
chomp $cadena;				
my @cadena = split (//, $cadena);	
&body;
&encabezado;
print("\n|	",$estado,"       |Epsilon |              |  ",$estado,"	     |");
&body;

for my $character (@cadena) 
{
	my $estadosig = $estado;
	push(@pila," x ");
	my $charcaracter = &caracter ( $character );
	$estado = $tabla [$estado][$charcaracter];
	if ($estado eq "E") 
	{
		say ("|       ",$estadosig,"      |    ",$character,"    | ",$simbolo,"  |       ",$estado,"       |");
		&body;
		say "|              Cadena no valida :(                   |";   say ("+---------------------------------------------------------+");
		exit ();
	}
	if($charcaracter==1){
		pop @pila;
	}

	&contenido ($estadosig, $character, $simbolo, $estado);
}
 
		if ($a != $b) 
		{
		        say "|              Cadena no valida :(                   |"; 
		        &body;
		        say ("+---------------------------------------------------------+");
		}

	if (($estado==1 or $estado==2 or $estado==0) and $a==$b) 
	{
		say ("|       ",$estado,"      |         | Fin cadena|               |");
		     &body;
		say ("|                Cadena valida                       |"); say ("+---------------------------------------------------------+");
	}