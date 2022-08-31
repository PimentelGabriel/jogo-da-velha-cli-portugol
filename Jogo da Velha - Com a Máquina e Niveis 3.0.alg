algoritmo "semnome"
// Função : Jogo da velha par terminal
// Autor : Gabriel Pimentel de Castro Costa
// Data : 13/12/2018
// Seção de Declarações
var
tabuleiro: vetor [0..2, 0..2] de caractere
peca, nome: vetor [1..2] de caracter
ponto: vetor [1..2] de inteiro
preferencia, lugar, nomeVez, pecaVez, troca: caracter
i, j, m, n, vez, index, rodada, cheio: inteiro
rept, fim, lugarRepetido, aleatoria, praganhar: logico
inicio

//Inicia o tabuleiro
para i de 0 ate 2 faca
   para j de 0 ate 2 faca
      tabuleiro[i,j] := " "
   fimpara
fimpara

escreval("Olá Bem vindo ao Jogo Da Velha")
escreval("Esse é nosso Tabuleiro")
escreval
escreval(" A | B | C ")
escreval("___|___|___")
escreval(" D | E | F ")
escreval("___|___|___")
escreval("   |   |   ")
escreval(" G | H | I ")

escreval
escreval
//Repita Geral para iniciar outra partida
repita
   rept:=falso
   //Onde captura os nomes dos jogadores
   escreval("Digite o nome do Primeiro Jogador")
   leia(nome[1])
   escreval
   nome[2]:= "Máquina"
   se nome[1]=nome[2] entao
      rept:=verdadeiro
      limpatela
      escreval("Os nomes dos jogadores não podem iguais")
   fimse
ate rept=falso

limpatela

//Onde captura os simbolos dos jogadors
repita
   rept:=falso
   peca[2] := "O"
   escreval("O simbolo da ",nome[2]," é ", peca[2])
   escreval("Digite o simbolo de(a) gamer ",nome[1])
   leia(peca[1])
   escreval
   se nome[1]=nome[2] entao
      rept:=verdadeiro
      limpatela
      escreval("Os Simbolos dos jogadores não podem ser iguais")
   fimse
ate rept=falso

//Inicio do Jogo
i := RandI(2)
troca := nome[1]
rodada:=0
repita
   rodada := rodada+1
   escreval("       E Comece o Jogo")

   repita //Repita para Mudar de Vez de Jogador
      limpatela
      fim:=falso
      vez:=vez+1

      se troca = nome[1] entao //Lugar onde Muda Vez do jogador
         nomeVez := nome[1]
         pecaVez := peca[1]
         index:=1
         troca := nome[2]
      senao
         nomeVez := nome[2]
         pecaVez := peca[2]
         index:=2
         troca := nome[1]
      fimse

      limpatela
      repita //Caso o individuo digite em local ja preechido ele volta a esse local
         escreval(rodada,"º Rodada")
         escreval
         escreval("Pontuação: ")
         escreval(nome[1]," ",peca[1],": ",ponto[1])
         escreval(nome[2]," ",peca[2],": ",ponto[2])
         escreval
         escreval("Lugares no Tabuleiro")
         escreval(" A | B | C ")
         escreval("___|___|___")
         escreval(" D | E | F ")
         escreval("___|___|___")
         escreval("   |   |   ")
         escreval(" G | H | I ")
         escreval
         escreval("Lugares Usado do Tabuleiro")
         escreval(" ",tabuleiro[0,0]," | ",tabuleiro[0,1]," | ",tabuleiro[0,2]," ")
         escreval("___|___|___")
         escreval(" ",tabuleiro[1,0]," | ",tabuleiro[1,1]," | ",tabuleiro[1,2]," ")
         escreval("___|___|___")
         escreval("   |   |   ")
         escreval(" ",tabuleiro[2,0]," | ",tabuleiro[2,1]," | ",tabuleiro[2,2]," ")
         escreval

         cheio := 0
         //Verifica se deu Velha
         para i de 0 ate 2 faca
            para j de 0 ate 2 faca
               se tabuleiro[i,j] <> " " entao
                  cheio := cheio + 1
               fimse
            fimpara
         fimpara

         se cheio = 9 entao
            escreval("Iiiiii, Deu Velha!!!!")
            nomeVez := "Deu Velha"
            fim:=verdadeiro
            interrompa
         fimse

         se nomeVez = nome[1] entao //Se a vez eh do nome[1] que eh o humano ele entra e pede

            repita
               rept := falso
               escreval("Vez de: ",nomeVez)
               se (lugarRepetido=verdadeiro) entao
                  lugarRepetido:=falso
                  escreval("Esse local já está preechido!!!")
               fimse

               escreval("Digite a Letra Referente ao lugar em que você quer jogar")
               leia(lugar)

               //Seçãoo Lógica do Jogo onde é impresso cada Simbolo
               escolha lugar
               caso "a"
                  m:=0
                  n:=0
                  //tabuleiro[0,0] := pecaVez
               caso "b"
                  m:=0
                  n:=1
                  //tabuleiro[0,1] := pecaVez
               caso "c"
                  m:=0
                  n:=2
                  //tabuleiro[0,2] := pecaVez
               caso "d"
                  m:=1
                  n:=0
                  //tabuleiro[1,0] := pecaVez
               caso "e"
                  m:=1
                  n:=1
                  //tabuleiro[1,1] := pecaVez
               caso "f"
                  m:=1
                  n:=2
                  //tabuleiro[1,2] := pecaVez
               caso "g"
                  m:=2
                  n:=0
                  //tabuleiro[2,0] := pecaVez
               caso "h"
                  m:=2
                  n:=1
                  //tabuleiro[2,1] := pecaVez
               caso "i"
                  m:=2
                  n:=2
                  //tabuleiro[2,2] := pecaVez
               outrocaso
                  limpatela
                  escreval("Lugar impossivel")
                  rept := verdadeiro
               fimescolha

               //Se o local onde foi digitado o simbolo jś foi preechido ele pede novamente o Dado
               se tabuleiro[m,n] <> " " entao
                  LugarRepetido:=verdadeiro
                  fim := falso
               senao
                  tabuleiro[m,n] := pecaVez
                  fim := verdadeiro
               fimse
            ate rept = falso

         senao
            se nomeVez = nome[2] entao//Parte logica do Jogo da Máquina

               se  ((tabuleiro[0,2] = tabuleiro[2,0]) e (tabuleiro[0,2] = peca[1]) e (((tabuleiro[1,0] = " ") ou (tabuleiro[1,2] = " ")))) entao
                  escreval("Eu entrei no primeir Se")
                  leia()
                  se tabuleiro[1,0] = " " entao
                     m:=1
                     n:=0
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                  senao
                     m:=1
                     n:=2
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                  fimse
               fimse

               se  ((tabuleiro[1,1] = tabuleiro[2,2]) e (tabuleiro[1,1] = peca[1]) e (((tabuleiro[1,0] = " ") ou (tabuleiro[1,2] = " ")))) entao
                  se tabuleiro[1,0] = " " entao
                     m:=1
                     n:=0
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                  senao
                     m:=1
                     n:=2
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                  fimse
               fimse

               //Avaliação se ha posibilidade de de Vencer se tiver ele não faz jogada aleatoria
               para i de 0 ate 2 faca
                  //Analisa as Linhas
                  se  ((tabuleiro[i,0] = tabuleiro[i,1]) e (tabuleiro[i,0] = peca[2]) e (tabuleiro[i,2] = " ")) entao
                     m:=i
                     n:=2
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                     interrompa
                  fimse

                  se  ((tabuleiro[i,0] = tabuleiro[i,2]) e (tabuleiro[i,0] = peca[2]) e (tabuleiro[i, 1] = " "))entao
                     m:=i
                     n:=1
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                     interrompa
                  fimse

                  se  ((tabuleiro[i,1] = tabuleiro[i,2]) e (tabuleiro[i,1] = peca[2]) e (tabuleiro[i,0] = " ")) entao
                     m:=i
                     n := 0
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                     interrompa
                  fimse

                  //Analisa as Colunas
                  se  ((tabuleiro[0,i] = tabuleiro[1,i]) e (tabuleiro[0,i] = peca[2]) e (tabuleiro[2,i] = " ")) entao
                     m:=2
                     n:=i
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                     interrompa
                  fimse

                  se  ((tabuleiro[0,i] = tabuleiro[2,i]) e (tabuleiro[0,i] = peca[2]) e (tabuleiro[1,i] = " ")) entao
                     m:=1
                     n:=i
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                     interrompa
                  fimse

                  se  ((tabuleiro[1,i] = tabuleiro[2,i]) e (tabuleiro[1,i] = peca[2]) e (tabuleiro[0,i] = " ")) entao
                     m:=0
                     n:=i
                     fim :=  verdadeiro
                     praganhar := verdadeiro
                     tabuleiro[m,n] := pecaVez
                     interrompa
                  fimse

               fimpara

               //Analisa a Diagonal Principal
               se  ((tabuleiro[0,0] = tabuleiro[1,1]) e (tabuleiro[0,0] = peca[2]) e (tabuleiro[2,2] = " ")) entao
                  m:=2
                  n:=2
                  fim :=  verdadeiro
                  praganhar := verdadeiro
                  tabuleiro[m,n] := pecaVez
               fimse

               se  ((tabuleiro[0,0] = tabuleiro[2,2]) e (tabuleiro[0,0] = peca[2]) e (tabuleiro[1,1] = " ")) entao
                  m:=1
                  n:=1
                  fim :=  verdadeiro
                  praganhar := verdadeiro
                  tabuleiro[m,n] := pecaVez
               fimse

               se  ((tabuleiro[1,1] = tabuleiro[2,2]) e (tabuleiro[1,1] = peca[2]) e (tabuleiro[0,0] = " ")) entao
                  m:=0
                  n:=0
                  fim :=  verdadeiro
                  praganhar := verdadeiro
                  tabuleiro[m,n] := pecaVez
               fimse


               //Analisa a Diagonal Secundária
               se  ((tabuleiro[0,2] = tabuleiro[1,1]) e (tabuleiro[0,2] = peca[2]) e (tabuleiro[2,0] = " ")) entao
                  m:=2
                  n:=0
                  fim :=  verdadeiro
                  praganhar := verdadeiro
                  tabuleiro[m,n] := pecaVez
               fimse

               se  ((tabuleiro[0,2] = tabuleiro[2,0]) e (tabuleiro[0,2] = peca[2]) e (tabuleiro[1,1] = " ")) entao
                  m:=1
                  n:=1
                  fim :=  verdadeiro
                  praganhar := verdadeiro
                  tabuleiro[m,n] := pecaVez
               fimse

               se  ((tabuleiro[1,1] = tabuleiro[2,0]) e (tabuleiro[1,1] = peca[2]) e (tabuleiro[0,2] = " ")) entao
                  m:=0
                  n:=2
                  fim :=  verdadeiro
                  praganhar := verdadeiro
                  tabuleiro[m,n] := pecaVez
               fimse



               se praganhar = falso entao

                  aleatoria := verdadeiro

                  //Avaliação se ha posibilidade de de Vencer se tiver ele não faz jogada aleatoria
                  para i de 0 ate 2 faca
                     //Analisa as Linhas
                     se  ((tabuleiro[i,0] = tabuleiro[i,1]) e (tabuleiro[i,0] <> " ") e (tabuleiro[i,2] = " ")) entao
                        m:=i
                        n:=2
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                        interrompa
                     fimse

                     se  ((tabuleiro[i,0] = tabuleiro[i,2]) e (tabuleiro[i,0] <> " ") e (tabuleiro[i, 1] = " "))entao
                        m:=i
                        n:=1
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                        interrompa
                     fimse

                     se  ((tabuleiro[i,1] = tabuleiro[i,2]) e (tabuleiro[i,1] <> " ") e (tabuleiro[i,0] = " ")) entao
                        m:=i
                        n := 0
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                        interrompa
                     fimse

                     //Analisa as Colunas
                     se  ((tabuleiro[0,i] = tabuleiro[1,i]) e (tabuleiro[0,i] <> " ") e (tabuleiro[2,i] = " ")) entao
                        m:=2
                        n:=i
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                        interrompa
                     fimse

                     se  ((tabuleiro[0,i] = tabuleiro[2,i]) e (tabuleiro[0,i] <> " ") e (tabuleiro[1,i] = " ")) entao
                        m:=1
                        n:=i
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                        interrompa
                     fimse

                     se  ((tabuleiro[1,i] = tabuleiro[2,i]) e (tabuleiro[1,i] <> " ") e (tabuleiro[0,i] = " ")) entao
                        m:=0
                        n:=i
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                        interrompa
                     fimse

                  fimpara

                  se aleatoria = verdadeiro entao
                     //Analisa a Diagonal Principal
                     se  ((tabuleiro[0,0] = tabuleiro[1,1]) e (tabuleiro[0,0] <> " ") e (tabuleiro[2,2] = " ")) entao
                        m:=2
                        n:=2
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                     fimse

                     se  ((tabuleiro[0,0] = tabuleiro[2,2]) e (tabuleiro[0,0] <> " ") e (tabuleiro[1,1] = " ")) entao
                        m:=1
                        n:=1
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                     fimse

                     se  ((tabuleiro[1,1] = tabuleiro[2,2]) e (tabuleiro[1,1] <> " ") e (tabuleiro[0,0] = " ")) entao
                        m:=0
                        n:=0
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                     fimse


                     //Analisa a Diagonal Secundária
                     se  ((tabuleiro[0,2] = tabuleiro[1,1]) e (tabuleiro[0,2] <> " ") e (tabuleiro[2,0] = " ")) entao
                        m:=2
                        n:=0
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                     fimse

                     se  ((tabuleiro[0,2] = tabuleiro[2,0]) e (tabuleiro[0,2] <> " ") e (tabuleiro[1,1] = " ")) entao
                        m:=1
                        n:=1
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                     fimse

                     se  ((tabuleiro[1,1] = tabuleiro[2,0]) e (tabuleiro[1,1] <> " ") e (tabuleiro[0,2] = " ")) entao
                        m:=0
                        n:=2
                        fim :=  verdadeiro
                        aleatoria := falso
                        tabuleiro[m,n] := pecaVez
                     fimse
                  fimse

                  //Seção de Jogadas Aleatorias
                  se aleatoria = verdadeiro entao
                     se (tabuleiro[1,1] = " ") entao
                        tabuleiro[1,1] := pecaVez
                        fim:=verdadeiro
                     senao
                        repita //Se O local escolhido "aleatoriamente" ja estar preechido ele repete o processo
                           se (((tabuleiro[0,0] = " ") ou (tabuleiro[0,2] = " ")) ou ((tabuleiro[2,0] = " ") ou (tabuleiro[2,2] = " "))) entao

                              m:=RandI(4)

                              escolha m
                              caso 0  //No lugar A
                                 m:=0
                                 n:=0
                              caso 1  //No lugar C
                                 m:=0
                                 n:=2
                              caso 2 //No lugar G
                                 m:=2
                                 n:=0
                              caso 3 //No lugar I
                                 m:=2
                                 n:=2
                              outrocaso
                                 escreval("Erro")
                                 leia(n)
                              fimescolha
                           senao
                              m:=RandI(4)

                              escolha m
                              caso 0  //No lugar B
                                 m:=0
                                 n:=1
                              caso 1  //No lugar D
                                 m:=1
                                 n:=0
                              caso 2 //No lugar F
                                 m:=1
                                 n:=2
                              caso 3 //No lugar H
                                 m:=2
                                 n:=1
                              outrocaso
                                 escreval("Erro")
                                 leia(n)
                              fimescolha
                           fimse

                           se tabuleiro[m,n] <> " " entao //Se o local onde foi digitado o simbolo já foi preechido ele pede novamente o Dado
                              fim := falso
                              aleatoria := verdadeiro
                           senao
                              tabuleiro[m,n] := pecaVez
                              fim := verdadeiro
                           fimse
                        ate fim=verdadeiro
                     fimse
                  fimse
               fimse
               //se tabuleiro[m,n] <> " " entao /Se o local onde foi digitado o simbulo já foi preechido ele pede novamente o Dado
               //  LugarRepetido:=verdadeiro
               // fim := falso
               //senao
               //  tabuleiro[m,n] := pecaVez
               // fim := verdadeiro
               //fimse
            fimse
         fimse


      ate fim=verdadeiro

      se (nomeVez = nome[1]) ou (nomeVez = nome[2]) entao
         //Verifica se há um Ganhador
         fim:=falso
         para i de 0 ate 2 faca
            //Verifica todas as Colunas
            se (tabuleiro[i,0] = tabuleiro[i,1]) e (tabuleiro[i,0] = tabuleiro[i,2]) e (tabuleiro[i,1] <> " ") entao
               fim:=verdadeiro
            fimse
            //Verfifca todas as Linhas
            se (tabuleiro[0,i] = tabuleiro[1,i]) e (tabuleiro[0,i] = tabuleiro[2,i]) e (tabuleiro[0,i] <> " ") entao
               fim:=verdadeiro
            fimse
            //Verifica a Diagonal Principal (Canto superior esquerdo ao inferior direito)
            se (tabuleiro[0,0] = tabuleiro[1,1]) e (tabuleiro[0,0] = tabuleiro[2,2]) e (tabuleiro[0,0] <> " ") entao
               fim:=verdadeiro
            fimse
            //Verfifca a diagonal secundaria (Do superior Direito ao inerior esquerdo)
            se (tabuleiro[0,2] = tabuleiro[1,1]) e (tabuleiro[0,2] = tabuleiro[2,0]) e (tabuleiro[0,2] <> " ") entao
               fim:=verdadeiro
            fimse

            se fim=verdadeiro entao
               limpatela
               escreval("Temos um Vencedor!!!")
               escreval("Parabéns Jogador ",nomeVez)
               ponto[index] := ponto[index] + 1
               escreval(" ",tabuleiro[0,0]," | ",tabuleiro[0,1]," | ",tabuleiro[0,2]," ")
               escreval("___|___|___")
               escreval(" ",tabuleiro[1,0]," | ",tabuleiro[1,1]," | ",tabuleiro[1,2]," ")
               escreval("___|___|___")
               escreval("   |   |   ")
               escreval(" ",tabuleiro[2,0]," | ",tabuleiro[2,1]," | ",tabuleiro[2,2]," ")
               interrompa
            fimse
         fimpara
      fimse

   ate fim = verdadeiro

   escreval

   fim:=falso
   escreval("Voce deseja Jogar Outra Partida?")
   escreval("S - Sim ou N - Não")
   leia(lugar)
   se lugar = "n" entao
      fim:=verdadeiro
   fimse
   //Zera O Tabuleiro
   //Inicia o tabuleiro
   para i de 0 ate 2 faca
      para j de 0 ate 2 faca
         tabuleiro[i,j] := " "
      fimpara
   fimpara

ate fim=verdadeiro

escreval
limpatela
escreval("PLACAR FINAL")
escreval(nome[1],": ",ponto[1])
escreval(nome[2],": ",ponto[2])

fimalgoritmo
