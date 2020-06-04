


%%Prueba nueva 2
%%Prueba push Adrian
clear all; %Limpiamos el espacio de trabajo
close all; %Cerramos todas las ventanas que hayamos abierto

%--------------------------------------------------------

%Variables

%Numero de bits a transmitir de PRUEBA
Bits_TX=[1 0 0 0 1 1 0 1 0 0 0 1 1 0 1 0 0 0 1 1 0 1 0 0 0 1 1 0 1 0 0 0 1 1 0 1 0 0 0 1 1 0 1 0 0 0 1 1 0 1 0 0 0 1 1 0 1 ];
Num_Bits =length(Bits_TX); %5 bytes

%Constelacion que vamos a usar

CONSTEL = 'DBPSK'; %1 simbolo por portadora
%CONSTEL = 'DQPSK'; %2 simbolos por portadora
%CONSTEL = 'D8PSK'; %3 simbolos por portadora

%Bits para la transmision

S=ones(1,7);
OutPutU1=[];
OutPutU2=ones(1,7);
LFSR=ones(1,7); %Registro de desplazamiento de U2

%--------------------------------------------------------

%Eleccion de constelacion

switch CONSTEL
    case 'DBPSK'
        Nbpc=1; %Numero de simbolos por portadora
        C=[1 -1]; %Constelacion a usar
        M = 2*exp(Nbpc);
    case 'DQPSK'
        Nbpc=2;
        C=[1+1*i 1-1*i -1+1*i -1-1*i];
        M = 2*exp(Nbpc);
    case 'D8PSK'
        Nbpc=3;
        C=[-sqrt(2)-sqrt(2)*i -1 1*i -sqrt(2)+sqrt(2)*i -1*i sqrt(2)-sqrt(2)*i sqrt(2)+sqrt(2)*i 1]
        M = 2*exp(Nbpc);
end
%--------------------------------------------------------

%Codificador convolucional:Bloque U1

for i=1:Num_bits

  %Empezamos con el ultimo bit
  S(1)=Bits_TX(Num_Bits-i+1);

  %Salidas FirstOut y SecondOut
  FirstOutU1=xor(xor(   xor(  xor(S(0+1),S(1+1))  ,S(3+1))    ),S(5+1)),S(6+1));
  SecondOutU1=xor(   xor(  xor(S(0+1),S(3+1))  ,S(4+1))    ), S(6+1));

  %Deslazamos los bits
  S=circshift(S,1);

  %La salida entonces será entonces el vector anterior y las dos salidas añadidas
  OutPutU1=[SecondOutU1,FirstOutU1,OutPutU1];
end
%Cuando terminemos todos los ciclos añadimos los 12 bits a cero sobrantes
  OutPutU1=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,OutPutU1]

%--------------------------------------------------------

%Scrambler:Bloque U2

for i=1:length(OutPutU1)
  %Secuencia
  %Revisar Registro de Desplazamiento
  aux=xor(LFSR(3+1), LFSR(6+1));
  OutPutU2[i] = xor(OutPutU1(i),aux);

  %Desplazamos los bits del Lineal FeedBack Shift Register(LFSR) y asignamos el primero a la salida del XOR
  LFSR=circshift(LFSR,1);
  LFSR(1)=aux;

end

%--------------------------------------------------------

%Entrelazado: Bloque U3

%Definimos el numero de bits por simbolo OFDM
Nbps = Nbpc * 96;
OutPutU3=zeros(1,Nbps);
InputU3=OutPutU2;
s	=	8	×	(1+	floor(Nbpc/2));

%Aleatorizamos el vector de salida
for k=1:Nbps
OutPutU3((Nbps /s)	×	(k	mod	s)	+	floor(k/s)	)	=	InputU3(k);
end



%--------------------------------------------------------

%Mapper: Bloque U4

%Se creara una matriz de 128 filas. Cada una de ellas contendrá el número complejo que se le pasará al IFFT



Vport=zeros(128,1); %Vector columna

%% la primera direccion es la de referencia

%Amplitud de referencia 5
Vport(1)=-5+0*i;

%Vector de Teta
T=zeros(97,1);
Phase=zeros(97,1);
Phase(1)=180;
T(1)=180;
Abk =0;
for k=2:97

%%Codigo grey
C1=[00 01 11 10];
abk=C1.get(11))-C1.get(00);
  Abk=Phase(k)-Phase(k-1);
    T(k)	=	(T(k-1) +(2π/M)Abk)	mod	2π;

end




%% Tenemos que acceder a la memoria del interleaver y leerla.
%% La primera direccion de la memoria que genere el mapper será la de referencia (parte real = A (en binario) y parte imaginaria = 0) y las siguientes direcciones se iran rellenando en base al símbolo obtenido de cada direccion de la memoria del interleaver




%Funcion para el mapping

function const_points=Map(x,CONSTEL)
        switch CONSTEL
            case 'DBPSK'

            case 'DQPSK'

            case 'D8PSK'

        end
end
%--------------------------------------------------------



% Mapper
const_points = C(symb+1);

if isreal(const_points)
   const_points=complex(const_points);
end
