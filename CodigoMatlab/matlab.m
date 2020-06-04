%Trabajo SEC 2020
%
%Grupo:
%       Luis Callejon Reche
%       Maria Jaramillo Sojo
%       Adrian Sanchez Garcia

%clear all; %Limpiamos el espacio de trabajo
close all; %Cerramos todas las ventanas que hayamos abierto

%--------------------------------------------------------

%Variables-----------------------------------------------

Bits_TX = inputStream;              %Bits de Entrada a transmitir
Num_Bits = length(inputStream);     %Calculamos el numero de bits que vamos a transmitir


%Constelacion que vamos a usar

%CONSTEL = 'DBPSK'; %1 simbolo por portadora    %Aqui escogemos la constelacion que vayamos a usar
%CONSTEL = 'DQPSK'; %2 simbolos por portadora   %Aqui escogemos la constelacion que vayamos a usar
CONSTEL = 'D8PSK'; %3 simbolos por portadora    %Aqui escogemos la constelacion que vayamos a usar

%Bits para la transmision

S=zeros(1,7);         %Inializacion de vector s que luego usaremos
OutPutU1=[];          %Inicializacion del bloque 1
OutPutU2=[];          %Inicializacion del bloque 2
LFSR=ones(1,7);       %Registro de desplazamiento de U2



%Vector de Teta

Abk = 0;  %Incremento de fase, Inicializacion
A = 1;    %Potencia con la que vamos a transmitir



%--------------------------------------------------------

%Eleccion de constelacion

switch CONSTEL
    case 'DBPSK'
        Nbpc=1;             %Numero de bits transmitidos por portadora
        M = 2^Nbpc;         %Numero de bits por simbolo
        Cgrey = [0 1];      %Codigo Grey
        Simb_ant=1;         %Referencia
    case 'DQPSK'
        Nbpc=2;
        M = 2^Nbpc;
        Cgrey=[00 01 11 10];
        Simb_ant=11;
        
    case 'D8PSK'
        Nbpc=3;
        M = 2^Nbpc;
        Cgrey = [000 001 011 010 110 111 101 100];
        Simb_ant=110;
        
end

Nbps = Nbpc*96; %Numero de bits por simbolo OFDM

%--------------------------------------------------------
times = ((Num_Bits)*2/Nbps); %Calculamos el numero de simbolos OFDM
remanente_bits=mod((Num_Bits),Nbps/2);
%2.3
if(remanente_bits>42)
add=zeros(1,(Nbps-remanente_bits))';%Rellenamos el simbolo que nos queda,y otro mas,puesto que nos quedaban menos de 6 huecos en el primero    
else
add=zeros(1,Nbps/2-remanente_bits)';    
end
Bits_TX=[inputStream;add];
Num_Bits = length(Bits_TX);     %Calculamos el numero de bits que vamos a transmitir





%Codificador convolucional:Bloque U1

for i=1:Num_Bits    %Recorremos el numero de bits
 
  %Empezamos con el ultimo bit
  S(1)=Bits_TX(i);

   

  %Salidas FirstOut y SecondOut
  auxu1_1 = xor (S(1),S(2));          %Xor Auxiliares para calcular la primera salida
  auxu1_2 = xor (auxu1_1, S(4));      %Xor Auxiliares para calcular la primera salida
  auxu1_3 = xor (auxu1_2, S(6));      %Xor Auxiliares para calcular la primera salida
  FirstOutU1 = xor (auxu1_3, S(7));   %Xor Para calcular la primera salida

  auxu1_1 = xor (S(1),S(4));          %Xor Auxliares para calcular la segunda salida
  auxu1_2 = xor (auxu1_1, S(5));      %Xor Auxliares para calcular la segunda salida
  SecondOutU1 = xor (auxu1_2, S(7));  %Xor para calcular la segunda salida

  %Deslazamos los bits
  

  OutPutU1=[OutPutU1,FirstOutU1,SecondOutU1]; %La salida entonces sera entonces el vector
                                              %anterior y las dos salidas añadidas
  S=circshift(S,[0,1]);               %Desplazamiento de Bits a la derecha
end



%--------------------------------------------------------

%Scrambler:Bloque U2

for i=1:length(OutPutU1)                %Recorremos la salida del bloque 1

  aux22=xor(LFSR(3+1), LFSR(6+1));        %Variable auxiliar con la que haremos un xor a continuacion
  OutPutU2(i) = xor(OutPutU1(i),aux22);   %Xor de la variable auxiliar con el primer valor que nos llega por U1

  LFSR=circshift(LFSR,[0,1]);           %Desplazamos los bits del Lineal FeedBack Shift Register(LFSR)
  LFSR(1)=aux22;                          %Asignamos el primero a la salida del XOR

end

%--------------------------------------------------------

%Entrelazado: Bloque U3


                                      %para enviar todos los bits
if (times ~= floor (times))           %Si tenemos que enviar 1.5 simbolos,
    times = floor(times) + 1;         %Enviamos 2 y rellenaremos con 0
end

InputU3=zeros(1,Nbps*times);           %Inicializacion de la salida


InputU3(1, 1:length(OutPutU2))= OutPutU2;                    %Guardamos la salida del anterior bloque en la variable InputU3

s	=	8*(1+floor(Nbpc/2));              %S la usaremos para desordenar los datos

OutPutU3=zeros(times,Nbps);           %Inicializacion de la salida

for l = 1:times                      %Recorremos el numero de simbolos OFDM a transmitir
                                     %Aleatorizamos el vector de salida
for k=0:Nbps-1 %Pero solo los bits que tienen informacion, no los ceros del final
OutPutU3(l,(Nbps/s)*(mod(k,s))+floor(k/s)+1)=InputU3(k+(l-1)*Nbps+1);
end
end


%--------------------------------------------------------

%Mapper: Bloque U4

Vport=zeros(times,128);   %Vector columna del valor de la portadora(Ck)
Vport(:,1)=-A+0*1i;       %Valor potencia a transmitir en todas las filas, primera columna
T=zeros(times,97);        %Inicializacion de la matriz T
T(:,1)=pi;                %Angulo de referencia

aux=zeros(96,times);
%Se creara una matriz de 128 filas. Cada una de ellas contendrá el número complejo que se le pasará al IFFT
for z=1:times      %Recorremos el numero de simbolos OFDM a transmitir
 
 aux= reshape(OutPutU3(z,:), Nbpc,[]).'; %Agrupamos OutputU3 en simbolos de Nbpc
 %Simb_fila=aux(
end

for k=2:97                                                %Recorremos los datos validos
                                                            %
    simb_fila=aux(k-1,:);                                   %Cogemos un vector
    Simb=simb_fila;   %[1 1 0 ] --> 110 (Ejemplo)
    Abk=find(Cgrey==Simb)-1;                                %Calculamos el incremento de fase
    fase_ant=T(:,k-1);                                      %Calculamos la fase anterior
    inc=(2*pi/M)*Abk;                                       %Calculamos el incremento real que hemos dado
    T(z,k)	=	mod(fase_ant+inc,2*pi);                       %Calculamos la tetha
    Vport(:,k)=A*exp(1*1i*T(:,k));                          %Calculamos el valor de la portadora a transmitir
 
end

OutPutU4=circshift(Vport,[0,16]);                         %Hacemos un desplazamiento de 16, para los ceros

% Tenemos que acceder a la memoria del interleaver y leerla.
% La primera direccion de la memoria que genere el mapper será la de referencia (parte real = A (en binario) y parte imaginaria = 0)
%y las siguientes direcciones se iran rellenando en base al símbolo obtenido de cada direccion de la memoria del interleaver


% %Mapper: Bloque U4
% 
% Vport=zeros(times,128);   %Vector columna del valor de la portadora(Ck)
% Vport(:,1)=-A+0*1i;       %Valor potencia a transmitir en todas las filas, primera columna
% T=zeros(times,97);        %Inicializacion de la matriz T
% T(:,1)=pi;                %Angulo de referencia
% 
% %Se creara una matriz de 128 filas. Cada una de ellas contendrá el número complejo que se le pasará al IFFT
% for z=1:times                               %Recorremos el numero de simbolos OFDM a transmitir
%  aux = reshape(OutPutU3(z,:), Nbpc,[]).';    %Agrupamos OutputU3 en simbolos de Nbpc
% 
% 
%   for k=2:97                                                %Recorremos los datos validos
%                                                             %
%     simb_fila=aux(k-1,:);                                   %Cogemos un vector
%     Simb=str2double(strrep(num2str(simb_fila), ' ', ''));   %[1 1 0 ] --> 110 (Ejemplo)
%     Abk=find(Cgrey==Simb)-1;                                %Calculamos el incremento de fase
%     fase_ant=T(z,k-1);                                      %Calculamos la fase anterior
%     inc=(2*pi/M)*Abk;                                       %Calculamos el incremento real que hemos dado
%     T(z,k)	=	mod(fase_ant+inc,2*pi);                       %Calculamos la tetha
%     Vport(z,k)=A*exp(1*1i*T(z,k));                          %Calculamos el valor de la portadora a transmitir
%   end
% end
% 
% OutPutU4=circshift(Vport,[0,16]);






%--------------------------------------------------------


%Modulacion OFDM: Bloque U5
%OutPutU4=OutPutU4*100;
OutPutU5=ifftshift(OutPutU4,2);                         %Desplazamos la muestra para centrarla a frecuencia 0
OutPutU5 = ifft(OutPutU5,[],2);                         %Calculamos la IFFT y la guardamos en OutPutU5

%--------------------------------------------------------

%Prefijo ciclico: Bloque U6

Aux_U6=OutPutU5;                                        %Sacamos las 12 ultimas muestras y las ponemos al principio
Aux_U6=[Aux_U6(:,117:128),Aux_U6];                      %
OutPutU6=Aux_U6;                                        %

%--------------------------------------------------------
