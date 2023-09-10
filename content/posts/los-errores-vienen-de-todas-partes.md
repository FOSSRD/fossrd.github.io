---
title: "Los Errores Vienen De Todas Partes"
date: 2023-09-01T05:59:48Z
draft: false
toc: false
images:
tags:
  - SRE
  - Visibility
  - Post Mortem
---
## De que vas hoy?

El dia de hoy, mientras terminaba los ultimos *tickets y pendientes* del dia,
me percate de que habia recibido un mensaje interesante en uno de los chats.
Se trataba de una muy interesante lectura llamada [How Complex Systems Fail.](https://how.complexsystems.fail/)
> [Version local](/HowComplexSystemsFail.html)

Y leyendo de reojo lo que se hablaba sobre esa lectura pude ver que se trataba
de una especie de conjunto de ideas filosoficas sobre ser un SRE, aunque luego
bajo mas inspeccion me pude percatar que en realidad se trataba de basicamente
un compendio de ideas a tomar en cuenta por cualquier persona que se dedica a
mantener sistemas de alta complejidad de cualquier tipo, de doctores a hasta
los ingenieros viales y pasando por quienes trabajamos en sistemas informaticos.

De la lista de secciones mostrados en esa pagina basicamente se
podrian clasificar todos en unas cuantas categorias de las cuales hablare 
y tratare de ejemplificar: (podras ver de que secciones se ha extraido dicho
tema justo debajo de cada subtitulo)
+ La naturaleza de los fallos
+ Como se evaluan los fallos
+ Como los fallos se atribuyen a una causa proxima (5 whys)
+ El resultante nuevo entendimiento de la seguridad del "paciente" 

## Como fallan los sistemas complejos
### La naturaleza de los fallos
> 1  2  4  5  14 

Los sistemas complejos suelen ser por defecto peligrosos, esto es parte de la naturaleza de estos sistemas, esta es la razon por la que creamos defensas en
todos los sistemas de este tipo.

Tambien debemos entender que debido a esto mismo es  que todos los sistemas
complejos que existen tienen defensas contra estas fragilidades, defensas que
son hasta cierta medida exitosas, pues de no ser asi dichos sistemas no podrian
existir por mucho tiempo en primer lugar.

Esta misma complejidad tambien lleva al hecho de que en todos los sistemas
complejos tengamos puntos debiles presentes, latentes pero ocultos debido a las
protecciones que tenemos puestas en nuestro sistema, esperando a ser posibles
partes en un fallo mayor y siempre cambiando con los cambios de tecnologia,
politicas de la empresa u organizmo regidor del sistema y esfuerzos para 
erradicar fallos. Es muy importante notar como esto implica que casi todo el 
tiempo los sistemas estan funcionando parcialmente rotos, apoyados en los 
sistemas de redundancia, carga operacional humana y bajo una capacidad menor
a la maxima que permitiria el sistema.

Otra parte muy importante de la naturaleza de los fallos que podria ser hasta
obvio para algunos, pero que no debemos perder de vista ni un segundo, es que
los cambios introducen nuevas formas de fallar a un sistema, por lo que los 
sistemas que estan cambiando frecuentemente tambien estan diversificando de
forma frecuente sus formas de fallar. Esto es importante porque implica que
todos los cambios hechos para eliminar fallos frecuentes de bajo impacto
empiezan a traer consigo nuevos modos de fallo mucho menos frecuentes pero que
usualmente son de mayor impacto al sistema y llevando con esto al fenomeno de 
que conforme crece un sistema, mas crecen las posibilidades de que cuando
_escuches galopes se trate de una zebra y no de un caballo._

### Como se evaluan los fallos
> 3  6  8  9  11

Los problemas en los sistemas complejos, como se puede derivar de la parte
anterior, necesitan de multiples fallos en distintos puntos para poder suceder,
debido a todas las defensas implementadas en un sistema complejo es casi con 
certetza que podemos afirmar que  detras de cada catastrofe han habido
multiples fallos que llevasen a la misma.

Tambien debemos tener en cuenta durantet la evaluacion de estos fallos que los
sistemas complejos estan siempre cerca del punto de quiebre tanto fisica como
temporalmente y esto es algo que muchos evaluadores no tienen en mente al
momento de analizar una catastrofe en el sistema, los operadores no tienen que
llevar la carga del fallo, pues este casi siempre esta por ocurrir, esto es lo
que lleva a la idea de analisis post mortem que no sean solo tabularios para
contar culpas y "pecados" de los operarios, sino solamente una forma de buscar
que mejorias implementar al sistema.

Es normal ver que en las investigacions post accidente parezca mas que claro
que el/los operarios del sistema claramente fallaron en ver que habia un error
evidente para todos, esto tambien es parte de nuestra parcializacion como
humanos, el poder "predecir el pasado" y creer que las situaciones fueron mas
que evidentes para los operacios pero su falta de diligencia o habilidad no les
permitio ver de manera clara el problema, algo que se aleja de la realidad en
muchos de los casos como veremos mas adelante. Y es que el operario vive en una
dualidad de roles como alguien de quien se pide confiabilidad y tambien alta
productividad, roles que en muchas ocasiones son antagonicos.

### Como los fallos se atribuyen a una causa proxima
>3  5  7  8  18

Como ya pudimos ver, es lo normal que siempre existan errores compuestos en los
sistemas complejos, pero es muy normal ver que se le adjudiquen las catastrofes
a un _root cause_ o falla principal, esto es, a grandes razgos un error rotundo
y a mejor inspeccion, un reflejo de la forma habitual de razonar de los seres
humanos.

Otro punto importante es el hecho de que como se menciono en _la naturaleza_
_de los fallos_ los sistemas suelen correr de manera permanente en un estado
degradado, lo que hace que en muchos momentos se este a punto de fallar pero
sin llegar a ello, y es importante que en nuestros analisis post catastrofe se
puedan tener en cuenta estos encuentros cercanos con la catastrofe y el estado
degradado en el que se encontraba el sistema para poder tener un mejor 
entendimiento de como realmente podriamos evitar esa catastrofe a futuro o
que tantos errores realmente se necesitaron para llegar al punto del 
desequilibrio.

De nuevo, adjudicar a una "raiz" del incidente es solo en vestigio cultural y 
no refleja el entendimiento tecnico actual sobre como funcionan los sistemas
complejos, simplemente nos dejamos llevar de nuestra naturaleza humana cuando
buscamos un culpable humano y un error sucedido, cuando en realidad deberiamos
tener un analisis de todos los puntos del sistema y ambiguedades que nos
llevaron al punto donde nos encontramos. Esto de nuevo lo vemos asociado a la
adjudicacion de falta de habilidad de parte de los operarios cuando no han
"podido ver lo evidente", esto se debe a que olvidamos que lo evidente es solo
evidente luego de que el incidente ha sucedido y ha sido analizado.


### El resultante nuevo entendimiento de la seguridad del "paciente"
> 7  8  10  11  12  13  15  16  17  18

Debemos tratar los sistemas complejos como lo que son, sistemas con miles de
partes que los componen y que se encuentras siempre funcionando en capacidad
parcial o al menos funcionando parcialmente averiados y bajo instrucciones
ambiguas para el operario, esto es fundamental si queremos poder hacer el
sistema cada vez mas resistente a fallos. Para poder lograr esto es nevesario
que se tomen en cuenta los puntos expuestos al hacer un analisis luego de cada
catastrofe que ocurra en el sistema.

En la parte humana tambien debemos tener muy al pendiente no recurir a lo 
mencionado anteriormente al juzgar la actuacion de los operarios, pues en
momentos en los que buscamos tratar un incidente es normal que nuestra vision
del problema sea radicalmente diferente a la vision del problema que se tendra
una vez analizado el panorama general cuando estemos haciendo nuestro analisis,
por favor ten en cuenta las peticiones ambiguas del sistema con el operario, 
el nivel de visibilidad de estos problemas y que por supuesto es muy posible
que el operario _al escuchar galopes estuviese pensando en caballos_ y no en la
zebra que tienes evidentemente en frente en estos momentos.

> "Todas las acciones del operario son apuestas, y cuando juzgamos el mal
> resultado de una de esas apuestas olvidamos que las decisiones que llevaron a
> buenos resultados ttambien en la misma medida son apuestas."
> _Richard I. Cook, MD_

Gran parte de la importancia de tener analisis _post mortem_ es que necesitamos
tener expertos en nuestro sistema, pero ese conocimiento que tenemos irrigado
se mantiene siempre cambiando con el tiempo debido a la personas que llegan o
se van del sistema. Es necesario tener una forma de crear mas conocimiento del
sistema y posibles modos de fallos del mismo mediante el analisis y estudio de
las catastrofes del sistema, esto ayudara tanto con la proliferacion del 
conocimiento como para tener futuras referencias y como guia para el
mejoramiento del sistema.

Otro aspecto que debemos tener en cuenta aqui es que la remediacion de fallos
humanos puramente mediante la limitacion de que actividades puede ejercer ese
humano muy posiblemente nos lleven a que el operario tenga mas dificultad de
remediar problemas en el futuro sin ningun beneficio real o una solucion para
el problema que se encontro debajo. Esto quiere decir que limitar el rango de
accion de el operario rara vez lleva a un menor numeros de incidentes, mas 
bien llevaria a un mayor tiempo para la resolucion de problemas futuros, asi
que debemos tratar de que sea el sistema el que se haga mas robusto y no las
reglas en el accionar del operario.

La seguridad es una caracteristica de los sistemas, no de las partes que lo
componen. No hay un departamento, persona, producto o entidad individual a 
cargo de la confiabilidad y seguridad de un sistema, todo el conjunto toma 
parte en el comportamiento del sistema y por ende todo el sistema debe ser
tomado en cuenta desde su diseno para poder mantener la fiabilidad de cualquier
sistema complejo.

Debemos tener en cuenta que para poder tener un sistema libre de fallos es 
necesario que los operarios tengan experiencia y cercania con los fallos, que
conozcan el limite dode el sistema empieza a ser inestable o irrecuperable, asi
como cuales de sus acciones pueden mover el sistema a fallar.  Los operarios 
deben tener el conocimiento de como falla el sistema o hasta donde puede ser
empujado para poder ser efectivos en el mantenimiento del mismo. No hay una 
manera de tener confiabilidad sin operarios con conocimientos de los limites de
nuestro sistema o formas en las que podrian hacerlo fallar.

Una ultima idea que podrian encontrar interesante los lectores a la hora de 
hacer analisis de fallos de un sistema es la de _los 5 por que_, una medida
basica que implementar cuando buscamos la raiz de un problema, que es preguntar
"y esto por que sucede?" al menos 5 veces, asi como si de un pequenin de kinder
se tratase, para poder obtener mas perspectiva de los modos de fallo y no
sucumbir ante los instintos humanos de culpar una sola "causa".

Espero que tengan buen dia
Mmucha visibilidad en sus sistemas
Y que el monitoreo les acompane

@Black_Cloud08