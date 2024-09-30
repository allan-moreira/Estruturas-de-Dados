# Unidade de Controle de um Processador

## Objetivo
Esta prática tem como objetivo implementar, na FPGA, um hardware que identifiue a borda de imagens binárias.

## Modulos Utilizados
- ROM de 1 bit x 32.768 palavras (implementada em "unidade_de_controle.v")
- Decodificador de Binário para Exadecimal em visor de 7 segmentos (implementado em "dec_7seg.v")

## Funcionamento Geral
O processador executa as instruções presentes na memória, definida pelo arquivo "memory.mif" da seguinte forma: No estado Fetch, a informação do barramento de dados é passado apra o registrador de instrução. Posteriomente, no estado Decode, o controlador verifica os 8 bits mais significativos do registrador de instrução, que definem a operação a ser executada e separa os 8 bits menos significativos para o registrador de endereço. Por fim, no estado Execute, com a operação e o endereço de memória indentidicados, o último passo pode ser executado.

Como forma de acompanhar o processo, os valores de registradores internos são repesentados por sequências de LEDs e visores de 7 segmentos presentes na placa.



