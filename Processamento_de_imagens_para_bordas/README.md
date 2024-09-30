# Unidade de Controle de um Processador

## Objetivo
Esta prática tem como objetivo implementar, na FPGA, um hardware que identifiue a borda de imagens binárias. Esta atividade é baseda no livro Rapid Prototyping of Digital Systems.

## Modulos Utilizados
- ROM de 1 bit x 32.768 palavras (implementado pelo MegaWizard do Quartus II)
- Registrador Shifter de 256 bits (implementado pelo MegaWizard do Quartus II)
- Registrador Shifter de 3 bits (implementado pelo MegaWizard do Quartus II)
- Detector de Borda (implementado em "borda.v")
- Concatenador de Sinais (implementado em "conc.v")
- Detector da Posição do PIxel da Tela em Relação à Imagem (Implementado em "janela.v")
- Multiplexador Entre a Imagem com Borda e a Original (Implementado em "troca.v")
- Módulos do Sistema VGA (Fornecidos pelo Professor)

## Funcionamento Geral
O sistema de VGA gera a posição atual do pixel, que é levada para o bloco janela, no qual se verifica se o pixel atual da tela está dentro da área de 256 x 128 (tamanho da imagem). Ao mesmo tempo, a posição atual do pixel é levada para o bloco conc, no qual se junta os 7 bits menos significativos da coluna e os 6 bits menos significativos das linhas. Este enderenço concatenado é levado para a memória, a qual armazena a imagem presente em "image.mif". Em seguida, cada bit que sai da memória entra na cadeia de registradores, a fim de simular uma matriz 3x3 na imagem. Os bits dessa máscara 3x3 são levados ao bloco borda, onde a borda pode ser detectada. Por fim, o bit resultante é selecionado pelo multiplexador e armazenado no flip-flop de entrada do sistema VGA, para ser exibido na tela.



