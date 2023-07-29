program labPascal;
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
        // Defino Secuencia y Ventana
        Sec: file of Char;
        v: Char;
        i: Integer;

        // Defino Archivo y Registro
        Arch_Sal: file of Sal;
        reg_sal: Sal;

        // Creo Resguardos
        res_Nombre: String[40];
        res_Anio: Integer;
        res_Mes: Integer;
        res_Dia: Integer;
        res_Cantidad: Real;

        Generar: Boolean;
        Posicion: LongInt;
        cant_kg, mes1, mes2, mes3, mes4, mes5, mes6, mes7, mes8, mes9, mes10, mes11, mes12: Real;

        Function Caracter(num: Char): Integer; // Funcion -> Caracter a Entero
        Begin
            Case num of
                '0': Caracter:= 0;
                '1': Caracter:= 1;
                '2': Caracter:= 2;
                '3': Caracter:= 3;
                '4': Caracter:= 4;
                '5': Caracter:= 5;
                '6': Caracter:= 6;
                '7': Caracter:= 7;
                '8': Caracter:= 8;
                '9': Caracter:= 9;
            End;
        End;

        Function CambioMes(numero: Integer): String;
        Begin
            Case numero of
                1: CambioMes := 'Enero';
                2: CambioMes := 'Febrero';
                3: CambioMes := 'Marzo';
                4: CambioMes := 'Abril';
                5: CambioMes := 'Mayo';
                6: CambioMes := 'Junio';
                7: CambioMes := 'Julio';
                8: CambioMes := 'Agosto';
                9: CambioMes := 'Septiembre';
                10: CambioMes := 'Octubre';
                11: CambioMes := 'Noviembre';
                12: CambioMes := 'Diciembre';
            End;
        End;

        Function AcumuladorMes(numero: Integer): Real;
        Begin
            Case numero of
                1: AcumuladorMes:= mes1;
                2: AcumuladorMes:= mes2;
                3: AcumuladorMes:= mes3;
                4: AcumuladorMes:= mes4;
                5: AcumuladorMes:= mes5;
                6: AcumuladorMes:= mes6;
                7: AcumuladorMes:= mes7;
                8: AcumuladorMes:= mes8;
                9: AcumuladorMes:= mes9;
                10: AcumuladorMes:= mes10;
                11: AcumuladorMes:= mes11;
                12: AcumuladorMes:= mes12;
            End;
        End;

        Procedure tratamiento_fecha;
        Begin
            res_Dia:= (res_Dia + (Caracter(v) * 10));
            Read(Sec,v);
            res_Dia:= (res_Dia + Caracter(v));
            Read(Sec,v);
            res_Mes:= (res_Mes + (Caracter(v) * 10));
            Read(Sec,v);
            res_Mes:= (res_Mes + Caracter(v));
            Read(Sec,v);
            res_Anio:= (res_Anio + (Caracter(v) * 1000));
            Read(Sec,v);
            res_Anio:= (res_Anio + (Caracter(v) * 100));
            Read(Sec,v);
            res_Anio:= (res_Anio + (Caracter(v) * 10));
            Read(Sec,v);
            res_Anio:= (res_Anio + Caracter(v));
            Read(Sec,v);
        End;

        Procedure meses_clasif;  // Procedimiento -> Clasificación Sustantancia según Mes
        Begin
            Case res_Mes of
                1: mes1:= mes1 + cant_kg;
                2: mes2:= mes2 + cant_kg;
                3: mes3:= mes3 + cant_kg;
                4: mes4:= mes4 + cant_kg;
                5: mes5:= mes5 + cant_kg;
                6: mes6:= mes6 + cant_kg;
                7: mes7:= mes7 + cant_kg;
                8: mes8:= mes8 + cant_kg;
                9: mes9:= mes9 + cant_kg;
                10: mes10:= mes10 + cant_kg;
                11: mes11:= mes11 + cant_kg;
                12: mes12:= mes12 + cant_kg;
            End;
        End;

        Procedure informe_por_mes;  // Procedimiento que Genera Informe
        Begin
            for i:= 1 to 12 do
            Begin
                writeln('- ', CambioMes(i), ' -> ',AcumuladorMes(i):1:1,' kg');
            End;
        End;

        Procedure inicializar_var; // Inicio Variables y Resguardos
        Begin
            res_Nombre:= '';
            res_Anio:= 0;
            res_Mes:= 0;
            res_Dia:= 0;
            res_Cantidad:= 0;
            cant_kg:= 0;
            Posicion:= 1;
        End;
        
Begin
    assign(Arch_Sal, 'archSal.txt');
    assign(Sec, 'Secuencia.txt');
    {$I-}
        Reset(Sec);
    {$I+}
    if IOResult <> 0 then
        writeln('Error de archivo. No existe.')
    else
        Read(Sec, v);
        Rewrite(Arch_Sal); // Abro Archivo Salida
        inicializar_var;
        mes1:= 0;
        mes2:= 0;
        mes3:= 0;
        mes4:= 0;
        mes5:= 0;
        mes6:= 0;
        mes7:= 0;
        mes8:= 0;
        mes9:= 0;
        mes10:= 0;
        mes11:= 0;
        mes12:= 0;
        WriteLn('| LABORATORIO PASCAL - Grupo 20 |');
        writeln('----------------------------------');
        WriteLn('Sustancias Almacenadas Correctamente, en orden: Nombre y Cantidad de Sustancia en Kg.');
        WriteLn();

    while not EOF(Sec) do
    Begin
        if (v = 'N') then
    Begin
        Generar:= true;
    End
    else 
    Begin
        Generar:= false;
    End;

    Read(Sec, v);
    tratamiento_fecha;
    write('- ');
    while (v <> '#') do // Utilizo la Funcion concat() de Pascal para guardar caracter por caracter el Nombre
    Begin
        write(v);
        res_Nombre:= concat(res_Nombre, v);
        Read(Sec,v);
    End;

    write(' -> ');
    Read(Sec, v);

    while (v <> '#') do // Avanzo Codigo. Cientifico
    Begin
        Read(Sec, v);
    End;

    Read(Sec,v);
    while (v <> '#') do // Convierto Cantidad (en libras) a Entero
    Begin
        res_Cantidad:= res_Cantidad + (Caracter(v) / Posicion);
        Posicion:= (Posicion * 10);
        Read(Sec,v);
    End;

    res_Cantidad:= (res_Cantidad * (Posicion / 10));
    
    cant_kg:= res_Cantidad * 0.45359237; // Convierto a Kilogramos
    writeln(cant_kg:1:1,' kg');

    if Generar then // Si Generar es Verdadero, asigno a la salida los valores y muestro
    Begin 
        reg_sal.Nombre:= res_Nombre;
        reg_sal.Fecha.Anio:= res_Anio;
        reg_sal.Fecha.Mes:= res_Mes;
        reg_sal.Fecha.Dia:= res_Dia;
        write(Arch_Sal, reg_sal);
    End;

    //Si el año coincide entonces clasifico la sustancia segun el Mes y acumulo la Cantidad en ese Mes
    if (res_Anio = 2022) then
    Begin
        meses_clasif();
    End;

    if not EOF(Sec) then
    Begin
        Read(Sec,v);
        inicializar_var;
    End;
    End;
    
    // Genero los informes mensuales segun los datos recopilados 
	Writeln();
	Writeln('| Informe Mensual de la Cantidad de Sustancias Ingresadas en el Anio 2022 |');
	Writeln();
    informe_por_mes; // Emito Informe
    Writeln();
    writeln('El Programa ha Finalizado - Presiona "Enter" para Salir');
    readln;
    Close(Sec); // Cierro mi Secuencia y Archivo
    Close(Arch_Sal);
End.