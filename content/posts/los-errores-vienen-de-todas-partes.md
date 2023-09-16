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

El día de hoy, mientras terminaba los últimos *tickets y pendientes* del dia,
me percate de que había recibido un mensaje interesante en uno de los chats.
Se trataba de una muy interesante lectura llamada [How Complex Systems Fail.](https://how.complexsystems.fail/)
> [Version local](/HowComplexSystemsFail.html)

Y leyendo de reojo lo que se hablaba sobre esa lectura pude ver que se trataba
de una especie de conjunto de ideas filosóficas sobre ser un SRE, aunque luego
bajo mas inspección me pude percatar que en realidad se trataba de básicamente
un compendio de ideas a tomar en cuenta por cualquier persona que se dedica a
mantener sistemas de alta complejidad de cualquier tipo, de doctores a hasta
los ingenieros viales y pasando por quienes trabajamos en sistemas informáticos.

De la lista de secciones mostrados en esa pagina básicamente se
podrían clasificar todos en unas cuantas categorías de las cuales hablare 
y tratare de ejemplificar: (podrás ver de que secciones se ha extraído dicho
tema justo debajo de cada subtitulo)
+ La naturaleza de los fallos
+ Como se evalúan los fallos
+ Como los fallos se atribuyen a una causa próxima
+ El resultante nuevo entendimiento de la seguridad del "paciente" 

## Como fallan los sistemas complejos
### La naturaleza de los fallos
> 1  2  4  5  14 

Los sistemas complejos suelen ser por defecto peligrosos, esto es parte de la naturaleza de estos sistemas, esta es la razón por la que creamos defensas en
todos los sistemas de este tipo.

También debemos entender que debido a esto mismo es  que todos los sistemas
complejos que existen tienen defensas contra estas fragilidades, defensas que
son hasta cierta medida exitosas, pues de no ser asi dichos sistemas no podrían
existir por mucho tiempo en primer lugar.

Esta misma complejidad también lleva al hecho de que en todos los sistemas
complejos tengamos puntos débiles presentes, latentes pero ocultos debido a las
protecciones que tenemos puestas en nuestro sistema, esperando a ser posibles
partes en un fallo mayor y siempre cambiando con los cambios de tecnología,
políticas de la empresa u organismo regidor del sistema y esfuerzos para 
erradicar fallos. Es muy importante notar como esto implica que casi todo el 
tiempo los sistemas están funcionando parcialmente rotos, apoyados en los 
sistemas de redundancia, carga operacional humana y bajo una capacidad menor
a la máxima que permitiría el sistema.

Otra parte muy importante de la naturaleza de los fallos que podría ser hasta
obvio para algunos, pero que no debemos perder de vista ni un segundo, es que
los cambios introducen nuevas formas de fallar a un sistema, por lo que los 
sistemas que están cambiando frecuentemente también están diversificando de
forma frecuente sus formas de fallar. Esto es importante porque implica que
todos los cambios hechos para eliminar fallos frecuentes de bajo impacto
empiezan a traer consigo nuevos modos de fallo mucho menos frecuentes pero que
usualmente son de mayor impacto al sistema y llevando con esto al fenómeno de 
que conforme crece un sistema, mas crecen las posibilidades de que cuando
_escuches galopes se trate de una Zebra y no de un Caballo._

### Como se evaluan los fallos
> 3  6  8  9  11

Los problemas en los sistemas complejos, como se puede derivar de la parte
anterior, necesitan de múltiples fallos en distintos puntos para poder suceder,
debido a todas las defensas implementadas en un sistema complejo es casi con 
certeza que podemos afirmar que  detrás de cada catástrofe han habido
múltiples fallos que llevasen a la misma.

También debemos tener en cuenta durante la evaluación de estos fallos que los
sistemas complejos están siempre cerca del punto de quiebre tanto física como
temporalmente y esto es algo que muchos evaluadores no tienen en mente al
momento de analizar una catástrofe en el sistema, los operadores no tienen que
llevar la carga del fallo, pues este casi siempre esta por ocurrir, esto es lo
que lleva a la idea de análisis post mortem que no sean solo tabularios para
contar culpas y "pecados" de los operarios, sino solamente una forma de buscar
que mejorías implementar al sistema.

Es normal ver que en las investigaciones post accidente parezca mas que claro
que el/los operarios del sistema claramente fallaron en ver que había un error
evidente para todos, esto también es parte de nuestra parcialización como
humanos, el poder "predecir el pasado" y creer que las situaciones fueron mas
que evidentes para los operarios pero su falta de diligencia o habilidad no les
permitió ver de manera clara el problema, algo que se aleja de la realidad en
muchos de los casos como veremos mas adelante. Y es que el operario vive en una
dualidad de roles como alguien de quien se pide confiabilidad y también alta
productividad, roles que en muchas ocasiones son antagónicos.

### Como los fallos se atribuyen a una causa proxima
>3  5  7  8  18

Como ya pudimos ver, es lo normal que siempre existan errores compuestos en los
sistemas complejos, pero es muy normal ver que se le adjudiquen las catástrofes
a un _root cause_ o falla principal, esto es, a grandes rasgos un error rotundo
y a mejor inspección, un reflejo de la forma habitual de razonar de los seres
humanos.

Otro punto importante es el hecho de que como se menciono en _la naturaleza_
_de los fallos_ los sistemas suelen correr de manera permanente en un estado
degradado, lo que hace que en muchos momentos se este a punto de fallar pero
sin llegar a ello, y es importante que en nuestros análisis post catástrofe se
puedan tener en cuenta estos encuentros cercanos con la catástrofe y el estado
degradado en el que se encontraba el sistema para poder tener un mejor 
entendimiento de como realmente podríamos evitar esa catástrofe a futuro o
que tantos errores realmente se necesitaron para llegar al punto del 
desequilibrio.

De nuevo, adjudicar a una "raíz" del incidente es solo en vestigio cultural y 
no refleja el entendimiento técnico actual sobre como funcionan los sistemas
complejos, simplemente nos dejamos llevar de nuestra naturaleza humana cuando
buscamos un culpable humano y un error sucedido, cuando en realidad deberíamos
tener un análisis de todos los puntos del sistema y ambigüedades que nos
llevaron al punto donde nos encontramos. Esto de nuevo lo vemos asociado a la
adjudicación de falta de habilidad de parte de los operarios cuando no han
"podido ver lo evidente", esto se debe a que olvidamos que lo evidente es solo
evidente luego de que el incidente ha sucedido y ha sido analizado.


### El resultante nuevo entendimiento de la seguridad del "paciente"
> 7  8  10  11  12  13  15  16  17  18

Debemos tratar los sistemas complejos como lo que son, sistemas con miles de
partes que los componen y que se encuentras siempre funcionando en capacidad
parcial o al menos funcionando parcialmente averiados y bajo instrucciones
ambiguas para el operario, esto es fundamental si queremos poder hacer el
sistema cada vez mas resistente a fallos. Para poder lograr esto es necesario
que se tomen en cuenta los puntos expuestos al hacer un análisis luego de cada
catástrofe que ocurra en el sistema.

En la parte humana también debemos tener muy al pendiente no recurrir a lo 
mencionado anteriormente al juzgar la actuación de los operarios, pues en
momentos en los que buscamos tratar un incidente es normal que nuestra visión
del problema sea radicalmente diferente a la visión del problema que se tendrá
una vez analizado el panorama general cuando estemos haciendo nuestro análisis,
por favor ten en cuenta las peticiones ambiguas del sistema con el operario, 
el nivel de visibilidad de estos problemas y que por supuesto es muy posible
que el operario _al escuchar galopes estuviese pensando en caballos_ y no en la
Zebra que tienes evidentemente en frente en estos momentos.

> "Todas las acciones del operario son apuestas, y cuando juzgamos el mal
> resultado de una de esas apuestas olvidamos que las decisiones que llevaron a
> buenos resultados también en la misma medida son apuestas."
> _Richard I. Cook, MD_

Gran parte de la importancia de tener análisis _post mortem_ es que necesitamos
tener expertos en nuestro sistema, pero ese conocimiento que tenemos irrigado
se mantiene siempre cambiando con el tiempo debido a la personas que llegan o
se van del sistema. Es necesario tener una forma de crear mas conocimiento del
sistema y posibles modos de fallos del mismo mediante el análisis y estudio de
las catástrofes del sistema, esto ayudara tanto con la proliferación del 
conocimiento como para tener futuras referencias y como guía para el
mejoramiento del sistema.

Otro aspecto que debemos tener en cuenta aquí es que la remediación de fallos
humanos puramente mediante la limitación de que actividades puede ejercer ese
humano muy posiblemente nos lleven a que el operario tenga mas dificultad de
remediar problemas en el futuro sin ningún beneficio real o una solución para
el problema que se encontró debajo. Esto quiere decir que limitar el rango de
acción de el operario rara vez lleva a un menor números de incidentes, mas 
bien llevaría a un mayor tiempo para la resolución de problemas futuros, asi
que debemos tratar de que sea el sistema el que se haga mas robusto y no las
reglas en el accionar del operario.

La seguridad es una característica de los sistemas, no de las partes que lo
componen. No hay un departamento, persona, producto o entidad individual a 
cargo de la confiabilidad y seguridad de un sistema, todo el conjunto toma 
parte en el comportamiento del sistema y por ende todo el sistema debe ser
tomado en cuenta desde su diseño para poder mantener la fiabilidad de cualquier
sistema complejo.

Debemos tener en cuenta que para poder tener un sistema libre de fallos es 
necesario que los operarios tengan experiencia y cercanía con los fallos, que
conozcan el limite donde el sistema empieza a ser inestable o irrecuperable, asi
como cuales de sus acciones pueden mover el sistema a fallar.  Los operarios 
deben tener el conocimiento de como falla el sistema o hasta donde puede ser
empujado para poder ser efectivos en el mantenimiento del mismo. No hay una 
manera de tener confiabilidad sin operarios con conocimientos de los limites de
nuestro sistema o formas en las que podrían hacerlo fallar.

Una ultima idea que podrían encontrar interesante los lectores a la hora de 
hacer análisis de fallos de un sistema es la de _los 5 por qués_, una medida
básica que implementar cuando buscamos la raíz de un problema, que es preguntar
"y esto por que sucede?" al menos 5 veces, asi como si de un pequeñín de Kinder
se tratase, para poder obtener mas perspectiva de los modos de fallo y no
sucumbir ante los instintos humanos de culpar una sola "causa".

Espero que tengan buen dia
Mucha visibilidad en sus sistemas
Y que el monitoreo les acompañe

@Black_Cloud08