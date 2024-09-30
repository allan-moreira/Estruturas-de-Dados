# Texto Rotativo

## Objetivo
Esta prática tem como objetivo implementar um visor, na FPGA, que exiba um texto que percorra os displays de 7 seguimentos.

## Modulos Utilizados
- Memória ROM de 28 bits x 8 palavras (Gerado pelo MegaWizard no Quartus II)
- Contador de 3 bits (Gerado pelo MegaWizard no Quartus II)

## Funcionamento Geral
A cada pulso de clock, o contador incrementa uma unidade no endereço da ROM. Em cada endereço da ROM é definido pelo arquivo "memoria.mif" e representa os valores que serão enviados para os 4 visores de 7 segmentos da placa. Dessa forma, os 7 bits menos significativos do dado emitido pela memória serão associados aos 7 segmentos do visor mais à direita. Os demais 21 bits serão associados aos 3 visores restantes da mesma forma.
