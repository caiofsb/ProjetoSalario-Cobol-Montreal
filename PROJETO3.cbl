IDENTIFICATION DIVISION.
       PROGRAM-ID. PROJETO3.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77  WKR-NOMEFUN           PIC X(30).
       77  WKR-SALARIO           PIC 9(7)V99.
       77  WKR-BONUS             PIC 9(7)V99.
       77  WKR-SALARIO-FINAL     PIC 9(7)V99.
       77  WKR-TEMPOEMP          PIC 99.
       77  WKR-PERCENTUAL        PIC X(10).
       77  WKR-OP                PIC 9 VALUE 0.
       77  WKR-CONT              PIC X VALUE 'S'.
       77  WKR-VALIDO            PIC X VALUE 'S'.
       77  WKR-SALARIO-DISP      PIC ZZZZZ9,99.
       77  WKR-BONUS-DISP        PIC ZZZZZ9,99.
       77  WKR-FINAL-DISP        PIC ZZZZZ9,99.

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM PROCESSA-MENU UNTIL WKR-OP = 2.
           DISPLAY 'O Programa sera encerrado'.
           STOP RUN.

       PROCESSA-MENU.
           PERFORM EXIBE-MENU.
           IF WKR-OP = 1
               PERFORM ROTINA-OPCAO-1.
           IF WKR-OP NOT = 1 AND WKR-OP NOT = 2
               DISPLAY 'Opcao invalida!'
               PERFORM PAUSA.

       ROTINA-OPCAO-1.
           PERFORM LIMPA-DADOS.
           PERFORM ENTRADA-DADOS.
           PERFORM VALIDA-DADOS.
           IF WKR-VALIDO = 'S'
               PERFORM CALCULA-BONUS
               PERFORM CALCULA-SALARIO
               PERFORM EXIBE-RESULTADO
               PERFORM PAUSA.

       EXIBE-MENU.
           DISPLAY ' '.
           DISPLAY '     Sistema de Calculo Salarial     '.
           DISPLAY ' '.
           DISPLAY '1 - Calcular o Salario'.
           DISPLAY '2 - Sair'.
           DISPLAY ' '.
           DISPLAY 'Digite uma Opcao: '.
           ACCEPT WKR-OP.

       LIMPA-DADOS.
           MOVE SPACES TO WKR-NOMEFUN.
           MOVE ZEROS  TO WKR-SALARIO.
           MOVE ZEROS  TO WKR-TEMPOEMP.
           MOVE ZEROS  TO WKR-BONUS.
           MOVE ZEROS  TO WKR-SALARIO-FINAL.
           MOVE SPACES TO WKR-PERCENTUAL.

       ENTRADA-DADOS.
           DISPLAY ' '.
           DISPLAY 'Digite o Nome do Funcionario: '.
           ACCEPT WKR-NOMEFUN.
           DISPLAY 'Digite o Salario Base: '.
           ACCEPT WKR-SALARIO.
           DISPLAY 'Digite o tempo do funcionario na empresa: '.
           ACCEPT WKR-TEMPOEMP.

       VALIDA-DADOS.
           MOVE 'S' TO WKR-VALIDO.
           IF WKR-SALARIO NOT GREATER THAN ZERO
               DISPLAY 'Salario digitado invalido!'
               PERFORM PAUSA
               MOVE 'N' TO WKR-VALIDO.
           IF WKR-SALARIO GREATER THAN ZERO AND
              WKR-TEMPOEMP LESS THAN ZERO
               DISPLAY 'Tempo de empresa invalido!'
               PERFORM PAUSA
               MOVE 'N' TO WKR-VALIDO.

       CALCULA-BONUS.
           IF WKR-TEMPOEMP NOT GREATER THAN 1
               MOVE '5%' TO WKR-PERCENTUAL
               COMPUTE WKR-BONUS = (WKR-SALARIO * 5) / 100.
           IF WKR-TEMPOEMP GREATER THAN 1 AND
              WKR-TEMPOEMP NOT GREATER THAN 5
               MOVE '10%' TO WKR-PERCENTUAL
               COMPUTE WKR-BONUS = (WKR-SALARIO * 10) / 100.
           IF WKR-TEMPOEMP GREATER THAN 5
               MOVE '15%' TO WKR-PERCENTUAL
               COMPUTE WKR-BONUS = (WKR-SALARIO * 15) / 100.

       CALCULA-SALARIO.
           COMPUTE WKR-SALARIO-FINAL = WKR-SALARIO + WKR-BONUS.

       EXIBE-RESULTADO.
           MOVE WKR-SALARIO TO WKR-SALARIO-DISP.
           MOVE WKR-BONUS TO WKR-BONUS-DISP.
           MOVE WKR-SALARIO-FINAL TO WKR-FINAL-DISP.

           DISPLAY ' '.
           DISPLAY ' '.
           DISPLAY '       RESULTADO DO CALCULO       '.
           DISPLAY ' '.
           DISPLAY 'Nome do Funcionario: ' WKR-NOMEFUN.
           DISPLAY 'Salario Base ......: ' WKR-SALARIO-DISP.
           DISPLAY ' '.
           DISPLAY 'BONUS APLICADO:'.
           DISPLAY 'Percentual ........: ' WKR-PERCENTUAL.
           DISPLAY 'Valor do Bonus.....: ' WKR-BONUS-DISP.
           DISPLAY ' '.
           DISPLAY 'Salario Final......: ' WKR-FINAL-DISP.
           DISPLAY ' '.

       PAUSA.
           DISPLAY ' '.
           DISPLAY 'Tecle Enter para continuar'.
           ACCEPT WKR-CONT.