---
title: "Los Errores Vienen De Todas Partes"
date: 2023-09-01T05:59:48Z
draft: false
toc: false
images:
tags:
  - untagged
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

De la lista de (propuestas? articulos?) mostrados en esa pagina basicamente se
podrian clasificar todos en unas cuantas categorias de las cuales hablare 
y tratare de ejemplificar:
+ La naturaleza de los fallos
+ Como se evaluan los fallos
+ Como los fallos se atribuyen a una causa proxima (5 whys)
+ El resultante nuevo entendimiento de la seguridad del "paciente" 

## Como fallan los sistemas complejos
### La naturaleza de los fallos
.1 .2 .4 .5 14 
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

### Como se evaluan los fallos
.3 .6 8 9 11
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

### Como los fallos se atribuyen a una causa proxima (5 whys)
.3 .5 7 8 15 18

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
no refleja el entendimiento tecnico actual sobre como funcionan......

### El resultante nuevo entendimiento de la seguridad del "paciente"
7 8 10 11 12 13 16 17 18







----------------------------------
a reference so I do not need to hop back and forth between the two


How Complex Systems Fail
(Being a Short Treatise on the Nature of Failure; How Failure is Evaluated; How Failure is Attributed to Proximate Cause; and the Resulting New Understanding of Patient Safety)

Richard I. Cook, MD
Cognitive Technologies Labratory
University of Chicago
Complex systems are intrinsically hazardous systems.
All of the interesting systems (e.g. transportation, healthcare, power generation) are inherently and unavoidably hazardous by the own nature. The frequency of hazard exposure can sometimes be changed but the processes involved in the system are themselves intrinsically and irreducibly hazardous. It is the presence of these hazards that drives the creation of defenses against hazard that characterize these systems.

Complex systems are heavily and successfully defended against failure
The high consequences of failure lead over time to the construction of multiple layers of defense against failure. These defenses include obvious technical components (e.g. backup systems, ‘safety’ features of equipment) and human components (e.g. training, knowledge) but also a variety of organizational, institutional, and regulatory defenses (e.g. policies and procedures, certification, work rules, team training). The effect of these measures is to provide a series of shields that normally divert operations away from accidents.

Catastrophe requires multiple failures – single point failures are not enough.
The array of defenses works. System operations are generally successful. Overt catastrophic failure occurs when small, apparently innocuous failures join to create opportunity for a systemic accident. Each of these small failures is necessary to cause catastrophe but only the combination is sufficient to permit failure. Put another way, there are many more failure opportunities than overt system accidents. Most initial failure trajectories are blocked by designed system safety components. Trajectories that reach the operational level are mostly blocked, usually by practitioners.

Complex systems contain changing mixtures of failures latent within them.
The complexity of these systems makes it impossible for them to run without multiple flaws being present. Because these are individually insufficient to cause failure they are regarded as minor factors during operations. Eradication of all latent failures is limited primarily by economic cost but also because it is difficult before the fact to see how such failures might contribute to an accident. The failures change constantly because of changing technology, work organization, and efforts to eradicate failures.

Complex systems run in degraded mode.
A corollary to the preceding point is that complex systems run as broken systems. The system continues to function because it contains so many redundancies and because people can make it function, despite the presence of many flaws. After accident reviews nearly always note that the system has a history of prior ‘proto-accidents’ that nearly generated catastrophe. Arguments that these degraded conditions should have been recognized before the overt accident are usually predicated on naïve notions of system performance. System operations are dynamic, with components (organizational, human, technical) failing and being replaced continuously.

Catastrophe is always just around the corner.
Complex systems possess potential for catastrophic failure. Human practitioners are nearly always in close physical and temporal proximity to these potential failures – disaster can occur at any time and in nearly any place. The potential for catastrophic outcome is a hallmark of complex systems. It is impossible to eliminate the potential for such catastrophic failure; the potential for such failure is always present by the system’s own nature.

Post-accident attribution to a ‘root cause’ is fundamentally wrong.
Because overt failure requires multiple faults, there is no isolated ‘cause’ of an accident. There are multiple contributors to accidents. Each of these is necessarily insufficient in itself to create an accident. Only jointly are these causes sufficient to create an accident. Indeed, it is the linking of these causes together that creates the circumstances required for the accident. Thus, no isolation of the ‘root cause’ of an accident is possible. The evaluations based on such reasoning as ‘root cause’ do not reflect a technical understanding of the nature of failure but rather the social, cultural need to blame specific, localized forces or events for outcomes. 1

1 Anthropological field research provides the clearest demonstration of the social construction of the notion of ‘cause’ (cf. Goldman L (1993), The Culture of Coincidence: accident and absolute liability in Huli, New York: Clarendon Press; and also Tasca L (1990), The Social Construction of Human Error, Unpublished doctoral dissertation, Department of Sociology, State University of New York at Stonybrook)

Hindsight biases post-accident assessments of human performance.
Knowledge of the outcome makes it seem that events leading to the outcome should have appeared more salient to practitioners at the time than was actually the case. This means that ex post facto accident analysis of human performance is inaccurate. The outcome knowledge poisons the ability of after-accident observers to recreate the view of practitioners before the accident of those same factors. It seems that practitioners “should have known” that the factors would “inevitably” lead to an accident. 2 Hindsight bias remains the primary obstacle to accident investigation, especially when expert human performance is involved.

2 This is not a feature of medical judgements or technical ones, but rather of all human cognition about past events and their causes.

Human operators have dual roles: as producers & as defenders against failure.
The system practitioners operate the system in order to produce its desired product and also work to forestall accidents. This dynamic quality of system operation, the balancing of demands for production against the possibility of incipient failure is unavoidable. Outsiders rarely acknowledge the duality of this role. In non-accident filled times, the production role is emphasized. After accidents, the defense against failure role is emphasized. At either time, the outsider’s view misapprehends the operator’s constant, simultaneous engagement with both roles.

All practitioner actions are gambles.
After accidents, the overt failure often appears to have been inevitable and the practitioner’s actions as blunders or deliberate willful disregard of certain impending failure. But all practitioner actions are actually gambles, that is, acts that take place in the face of uncertain outcomes. The degree of uncertainty may change from moment to moment. That practitioner actions are gambles appears clear after accidents; in general, post hoc analysis regards these gambles as poor ones. But the converse: that successful outcomes are also the result of gambles; is not widely appreciated.

Actions at the sharp end resolve all ambiguity.
Organizations are ambiguous, often intentionally, about the relationship between production targets, efficient use of resources, economy and costs of operations, and acceptable risks of low and high consequence accidents. All ambiguity is resolved by actions of practitioners at the sharp end of the system. After an accident, practitioner actions may be regarded as ‘errors’ or ‘violations’ but these evaluations are heavily biased by hindsight and ignore the other driving forces, especially production pressure.

Human practitioners are the adaptable element of complex systems.
Practitioners and first line management actively adapt the system to maximize production and minimize accidents. These adaptations often occur on a moment by moment basis. Some of these adaptations include: (1) Restructuring the system in order to reduce exposure of vulnerable parts to failure. (2) Concentrating critical resources in areas of expected high demand. (3) Providing pathways for retreat or recovery from expected and unexpected faults. (4) Establishing means for early detection of changed system performance in order to allow graceful cutbacks in production or other means of increasing resiliency.

Human expertise in complex systems is constantly changing
Complex systems require substantial human expertise in their operation and management. This expertise changes in character as technology changes but it also changes because of the need to replace experts who leave. In every case, training and refinement of skill and expertise is one part of the function of the system itself. At any moment, therefore, a given complex system will contain practitioners and trainees with varying degrees of expertise. Critical issues related to expertise arise from (1) the need to use scarce expertise as a resource for the most difficult or demanding production needs and (2) the need to develop expertise for future use.

Change introduces new forms of failure.
The low rate of overt accidents in reliable systems may encourage changes, especially the use of new technology, to decrease the number of low consequence but high frequency failures. These changes maybe actually create opportunities for new, low frequency but high consequence failures. When new technologies are used to eliminate well understood system failures or to gain high precision performance they often introduce new pathways to large scale, catastrophic failures. Not uncommonly, these new, rare catastrophes have even greater impact than those eliminated by the new technology. These new forms of failure are difficult to see before the fact; attention is paid mostly to the putative beneficial characteristics of the changes. Because these new, high consequence accidents occur at a low rate, multiple system changes may occur before an accident, making it hard to see the contribution of technology to the failure.

Views of ‘cause’ limit the effectiveness of defenses against future events.
Post-accident remedies for “human error” are usually predicated on obstructing activities that can “cause” accidents. These end-of-the-chain measures do little to reduce the likelihood of further accidents. In fact that likelihood of an identical accident is already extraordinarily low because the pattern of latent failures changes constantly. Instead of increasing safety, post-accident remedies usually increase the coupling and complexity of the system. This increases the potential number of latent failures and also makes the detection and blocking of accident trajectories more difficult.

Safety is a characteristic of systems and not of their components
Safety is an emergent property of systems; it does not reside in a person, device or department of an organization or system. Safety cannot be purchased or manufactured; it is not a feature that is separate from the other components of the system. This means that safety cannot be manipulated like a feedstock or raw material. The state of safety in any system is always dynamic; continuous systemic change insures that hazard and its management are constantly changing.

People continuously create safety.
Failure free operations are the result of activities of people who work to keep the system within the boundaries of tolerable performance. These activities are, for the most part, part of normal operations and superficially straightforward. But because system operations are never trouble free, human practitioner adaptations to changing conditions actually create safety from moment to moment. These adaptations often amount to just the selection of a well-rehearsed routine from a store of available responses; sometimes, however, the adaptations are novel combinations or de novo creations of new approaches.

Failure free operations require experience with failure.
Recognizing hazard and successfully manipulating system operations to remain inside the tolerable performance boundaries requires intimate contact with failure. More robust system performance is likely to arise in systems where operators can discern the “edge of the envelope”. This is where system performance begins to deteriorate, becomes difficult to predict, or cannot be readily recovered. In intrinsically hazardous systems, operators are expected to encounter and appreciate hazards in ways that lead to overall performance that is desirable. Improved safety depends on providing operators with calibrated views of the hazards. It also depends on providing calibration about how their actions move system performance towards or away from the edge of the envelope.