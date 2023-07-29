Program lectura;

Type
	Sal = Record // Defino Archivo de Salida
		Nombre: String[40];
		Fecha: Record
			Anio: Integer;
			Mes: Integer;
			Dia: Integer;
		End;
	End;

Var 
	// Defino Archivo y Registro
	Arch_Sal: file of Sal;
	reg_sal: Sal;

Begin
    assign(Arch_Sal, 'archSal.txt');
	{$I-}
        Reset(Arch_Sal);
    {$I+}
	
	if IOResult <> 0 then
        writeln('Error de archivo. "archSal.txt" no existe en el directorio raiz.')
    else
	begin
		read(Arch_Sal, reg_sal);
		Writeln('Archivo de Salida con Orden:');
		writeln(' * Nombre de Sustancias NO Terrestres');
		writeln(' * Fecha de Registro - DD/MM/AAAA');
		writeln('--------------------------------------');
		writeln();
		while not EOF(Arch_Sal) do
		begin
			write('- ');
			write(reg_sal.Nombre,' -> ');
			write(reg_sal.Fecha.Dia,'/');
			write(reg_sal.Fecha.Mes,'/');
			write(reg_sal.Fecha.Anio);
			read(Arch_Sal,reg_sal);
			writeln();
		end;
			write('- ');
			write(reg_sal.Nombre,' -> ');
			write(reg_sal.Fecha.Dia,'/');
			write(reg_sal.Fecha.Mes,'/');
			write(reg_sal.Fecha.Anio);
			close(Arch_Sal);
			writeln();
	End;
	writeln();
	writeln('El Programa ha Finalizado - Presiona "Enter" para Salir');
    readln;
end.
