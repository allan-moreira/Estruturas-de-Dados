# Problema dos Trens

## Objetivo
Esta prática tem como objetivo implementar uma máquina de estado, na FPGA, que simule a interação entre dois trens que compartilham um segmento de trilho. Esta é uma adaptação simplificada do problema proposto pelo livro Rapid Prototyping of Digital Systems.

## Modulos Utilizados
- Máquina de Estado (feito a partir de código em verilog)

## Funcionamento Geral
Conforme os sensores detectam a presença ou não de um trem, os estados do sistema são alterados. Dessa forma, é possível acompanhar, com base no estado, se os trens estão em movimento e se as chaves de conexão entre os trilhos estão ativas.

