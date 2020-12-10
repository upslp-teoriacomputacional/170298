#!/usr/bin/perl;

#Nombre Archivo tictactoe.pl
#Nombre: Manuel Camacho Rodriguez
#Matricula: 170298
#Profesor: Juan Carlos González Ibarra
#Proyecto: Implementacion en perl del juego de tictactoe

@posicion = ([0,1,2],[3,4,5],[6,7,8]); #numero que se mostraran en el tablero del juego

$GanaComputador = 0;#variable inicializada en 0 cuando la variable sea igual a 1 significa que gano la computadora
$Turnos = 0; #Varible inicializada cuando la variable llge a un valor 5 significa que el tablero esta lleno y no existe un ganador

while (true) {

DibujarTablero(); #Dibuja el tablero

print "\nIngresa Numero de la posicion a elegir:";
$opc = <>;
chomp($opc); #Ingresa el jugador la opcion del tablero

$turnoJugador = validaciondeOpcion($opc); #variable turno del jugador donde manda a la funcion para validar si es un numero correcto y si aun no esta en la tabla la cual si no esta marca la casilla con una X

if($turnoJugador == 0) {
	next;
}


if ($Turnos == 5) {       #Al momento de que turnos sea igual a 5 significa que el jugador jugo 5 veces y el tablero estara lleno y es EMPATE
	DibujarTablero();
	print "\nNo hay ganador,EMPATE!!!!";
	last;
}

ValidacionComputadora();

if ($Ganacomputador == 1) {
	DibujarTablero();
	print "\nNo lograste ganar,PERDISTE!!!!";
	last;
}
}


sub DibujarTablero {
	print "Tablero de Juego\n--- --- ---\n";
	for ($i=0;$i<3;$i++) {
		for ($j=0;$j<3;$j++) {
			print " $posicion[$i][$j] ";
			if ($j!=2) {
				print "|";
			}
		}
		print "\n--- --- ---\n";
	}
}

sub validaciondeOpcion { #Valida la opcion que inserta el jugador que este entre 0 y 8 y si esta en el rango lo va marcar con una x en la determinada posicion.
	
	$opc = @_[0];
	
	if ($opc =~ /[^\d]/ || ($opc < 0 || $opc > 8)) { #Valida si el numero insertado esta entre 0 y 8 si no esta en esos limites sera numero incorrecto
		print "Numero Incorrecto\n";
		return 0;
	}

	for ($i=0;$i<3;$i++) {
		for ($j=0;$j<3;$j++) {
			if ($posicion[$i][$j] eq $opc) {
				$posicion[$i][$j] = "X";
				$Turnos++;
				return 1;
			}
		}
	}
	return 0;
}

sub ValidacionComputadora { #Valida el movimiento que va realizar para dirigirse a las funciones de opcionesvpara ganar o si va a las funciones de bloqueo
	
	$turnoComputadora = 0;
	$rotador = 0;
	
	while ($rotador < 4) {
		
		$turnoComputadora = OpcionesComputadoraGana(); 

		if ($turnoComputadora == 1) {
			last;
		}
		rotarTablero();
		$rotador++;
	}

	if ($turnoComputadora != 1) { #ira rotando posicion en posicion para bloquear al jugador
		$rotador = 0;

		while ($rotador < 4) {

			$turnoComputadora = BloqueoAlJugador();
			if ($turnoComputadora == 1) {
				last;
			}
			rotarTablero();
			$rotador++;
		}		
	}
		
	if ($turnoComputadora != 1) { #ira rotando posicion en posicion para bloquear al jugador 
		$rotador = 0;

		while ($rotador < 4) {
			$turnoComputadora = segundoBloqueo();
			if ($turnoComputadora == 1) {
				last;
			}
			rotarTablero();
			$rotador++;
		}
	}

	#Si no hay opcion para bloquear al jugador la rotacion llegara al inicio de la posicion y marcara la opcion del
	while ($rotador < 4) {
		rotarTablero();
		$rotador++;
	}
			
	if ($turnoComputadora != 1) {
		if ($posicion[1][1] =~ /[^XO]/) {
			$posicion[1][1] = "O";
		} else {
			OUTER: for ($i = 0; $i<3; $i++) {
					for ($j = 0; $j<3; $j++) {
						if ($posicion[$i][$j] =~ /[^XO]/) {
							$posicion[$i][$j] = "O";
							last OUTER;
						}
					}
				}
		}
	}
}

sub OpcionesComputadoraGana { #Opciones para las cuales la computadora Gana la Partida
	
	if ($posicion[0][1] eq "O" && $posicion[0][2] eq "O" && $posicion[0][0] =~ /[^XO]/) {
		$posicion[0][0] = "O";
		$Ganacomputador = 1;
	}
	elsif
	($posicion[1][0] eq "O" && $posicion[2][0] eq "O" && $posicion[0][0] =~ /[^XO]/) {
		$posicion[0][0] = "O";
		$Ganacomputador = 1;	
	}
	elsif($posicion[1][1] eq "O" && $posicion[2][2] eq "O" && $posicion[0][0] =~ /[^XO]/) {
		$posicion[0][0] = "O";
		$Ganacomputador = 1;	
	}
	elsif ($posicion[0][0] eq "O" && $posicion[0][2] eq "O" && $posicion[0][1] =~ /[^XO]/) {
		$posicion[0][1] = "O";
		$Ganacomputador = 1;
	}
	elsif ($posicion[1][1] eq "O" && $posicion[2][1] eq "O" && $posicion[0][1] =~ /[^XO]/) {
		$posicion[0][1] = "O";
		$Ganacomputador = 1;	
	}
	elsif ($posicion[0][1] eq "O" && $posicion[2][1] eq "O" && $posicion[1][1] =~ /[^XO]/) {
		$posicion[1][1] = "O";
		$Ganacomputador = 1;
	}
	elsif ($posicion[0][0] eq "O" && $posicion[2][2] eq "O" && $posicion[1][1] =~ /[^XO]/) {
		$posicion[1][1] = "O";
		$Ganacomputador = 1;	
	}
	if ($Ganacomputador == 1) {
		return 1;
	}
	else {
		return 0;
	}
}

sub BloqueoAlJugador { #Para cada movimiento del jugador hay un patron para el cual la computadora va bloquear el movimiento y no gane el jugador.
	
	if ($posicion[0][1] eq "X" && $posicion[0][2] eq "X" && $posicion[0][0] =~ /[^XO]/) {
		$posicion[0][0] = "O";
		return 1;
	}
	elsif($posicion[1][0] eq "X" && $posicion[2][0] eq "X" && $posicion[0][0] =~ /[^XO]/) {
		$posicion[0][0] = "O";
		return 1;	
	}
	elsif ($posicion[1][1] eq "X" && $posicion[2][2] eq "X" && $posicion[0][0] =~ /[^XO]/) {
		$posicion[0][0] = "O";
		return 1;	
	}
	elsif ($posicion[0][0] eq "X" && $posicion[0][2] eq "X" && $posicion[0][1] =~ /[^XO]/) {
		$posicion[0][1] = "O";
		return 1;
	}
	elsif ($posicion[1][1] eq "X" && $posicion[2][1] eq "X" && $posicion[0][1] =~ /[^XO]/) {
		$posicion[0][1] = "O";
		return 1;	
	}
	elsif ($posicion[0][1] eq "X" && $posicion[2][1] eq "X" && $posicion[1][1] =~ /[^XO]/) {
		$posicion[1][1] = "O";
		return 1;
	}
	elsif ($posicion[0][0] eq "X" && $posicion[2][2] eq "X" && $posicion[1][1] =~ /[^XO]/) {
		$posicion[1][1] = "O";
		return 1;	
	} 
	else {
		return 0;
	}
}

sub segundoBloqueo { #Para cada movimiento del jugador hay un patron para el cual la computadora va bloquear el movimiento y no gane el jugador.
	
	if ($posicion[0][2] eq "X" && $posicion[1][1] eq "O" && $posicion[2][0] eq "X" && $posicion[0][0] =~ /[^XO]/ && $posicion[1][0] =~ /[^XO]/ && $posicion[1][2] =~ /[^XO]/ && $posicion[2][1] =~ /[^XO]/ && $posicion[2][2] =~ /[^XO]/ && $posicion[0][1] =~ /[^XO]/) {
		$posicion[0][1] = "O";
		return 1;
	}
	elsif ($posicion[0][1] eq "X" && $posicion[1][0] eq "X" && $posicion[1][1] eq "O" && $posicion[0][2] =~ /[^XO]/ && $posicion[2][0] =~ /[^XO]/ && $posicion[0][0] =~ /[^XO]/) {
		$posicion[0][0] = "O";
		return 1;	
	}
	elsif ($posicion[0][2] eq "X" && $posicion[1][0] eq "X" && $posicion[1][1] eq "O" && $posicion[0][1] =~ /[^XO]/ && $posicion[2][0] =~ /[^XO]/ && $posicion[0][0]=~ /[^XO]/) {
		$posicion[0][0] = "O";
		return 1; 
	}
	elsif ($posicion[0][2] eq "X" && $posicion[1][1] eq "O" && $posicion[2][1] eq "X" && $posicion[1][2] =~ /[^XO]/ && $posicion[2][0] =~ /[^XO]/ && $posicion[2][2] =~ /[^XO]/) {
		$posicion[2][2] = "O";
		return 1;	
	}
	elsif ($posicion[0][2] eq "X" && $posicion[1][1] eq "O" && $posicion[2][0] eq "X" && $posicion[0][1] =~ /[^XO]/ && $posicion[1][0] =~ /[^XO]/ && $posicion[0][0] =~ /[^XO]/) {
		$posicion[0][0] = "O";
		return 1;
	}
	elsif ($posicion[1][1] eq "X" && $posicion[2][2] =~ /[^XO]/ && $posicion[0][0] =~ /[^XO]/) {
		$posicion[0][0] = "O";
		return 1;
	}
	elsif ($posicion[1][1] eq "X" && $posicion[2][1] =~ /[^XO]/ && $posicion[0][1] =~ /[^XO]/) {
		$posicion[0][1] = "O";
		return 1;
	} else {
		return 0;
	}
}

sub rotarTablero {
	@temp = map { [@$_] } @posicion;
	@topRow = ($temp[0][2],$temp[1][2],$temp[2][2]);
	@middleRow = ($temp[0][1],$temp[1][1],$temp[2][1]);
	@bottomRow = ($temp[0][0],$temp[1][0],$temp[2][0]);
	@posicion = (\@topRow,\@middleRow,\@bottomRow);
}

