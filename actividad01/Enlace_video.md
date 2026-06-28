## Guion del video

## DIAPOSITIVA 1: Portada

muy buenos días, tardes o noches (hora que estoy haciendo el video)

¿Qué pasaría si la mente del mejor especialista del mundo  pudiera duplicarse y estar disponible al instante, en miles de lugares a la vez, las 24 horas del día?

Históricamente, la humanidad ha tenido un límite: el conocimiento especializado es escaso, se cansa, envejece y, eventualmente, se retira. Pero la Inteligencia Artificial encontró una solución a esto hace décadas mediante los Sistemas Expertos.

Hoy no vamos a hablar de la IA de moda que genera imágenes o chistes. si no que se va hablar desde un enfoque lógico y riguroso.

## DIAPOSITIVA 2: ¿Qué es un Sistema Experto? (Introducción)

"Si buscamos una definición formal, un Sistema Experto es un software de computación diseñado para emular —ojo, digo emular, no imitar biológicamente— el proceso de razonamiento de un especialista humano para resolver problemas complejos en un dominio extremadamente específico.

Quiero que nos detengamos en tres palabras clave que ven en pantalla:
Primero, Emulación. A diferencia del Machine Learning moderno, que analiza millones de datos y patrones estadísticos para 'adivinar' una respuesta, un Sistema Experto no adivina. Aplica reglas de lógica deductiva estructuradas por un ser humano. No recrea las neuronas del experto, recrea su lógica.

Segundo, Dominio específico. Un sistema experto no te va a escribir un poema ni te va a decir el clima de mañana. Está ultraespecializado.

Y tercero, una joya de estos sistemas: la Explicabilidad. Si una red neuronal moderna te da un diagnóstico médico, rara vez puede explicarte la matemática interna detrás de su decisión. Un Sistema Experto, en cambio, tiene la capacidad de decirte: 'Llegué a esta conclusión porque aplicaste la regla A, luego la B y finalmente la C'.

## DIAPOSITIVA 3: El Primer Pilar: El Conocimiento

"El primer pilar indispensable es la Base de Conocimientos. Piensen en esto como el disco duro de la sabiduría del sistema. Pero no contiene datos crudos o textos de enciclopedia; contiene hechos lógicos, relaciones conceptuales y, sobre todo, reglas heurísticas. Las heurísticas son esos 'atajos mentales' o reglas prácticas que un experto aprende tras 30 años de experiencia laboral.

Aquí ocurrir algo. ¿Cómo pasa esa sabiduría que está en la cabeza de un médico anciano a un trozo de código de computadora? No lo hace el programador tradicional. Lo hace una figura clave: el Ingeniero del Conocimiento.

Este profesional se sienta durante semanas con el experto, lo entrevista, observa cómo toma decisiones, desmenuza su razonamiento informal —muchas veces intuitivo— y lo traduce a un lenguaje formalizable para la máquina.

Un detalle de diseño crucial que deben recordar: en la informática tradicional, el conocimiento y las instrucciones de programación están mezclados en el código.

En un Sistema Experto, la Base de Conocimientos está totalmente separada del motor de procesamiento. Esto permite que si la ciencia médica avanza y se descubre un nuevo síntoma, simplemente añadimos una regla a la base sin necesidad de reprogramar todo el software desde cero."

## DIAPOSITIVA 4: ¿Cómo se Representa el Conocimiento?

"La forma más célebre y elegante de estructurar el saber humano es a través de las Reglas de Producción, basadas en la lógica condicional clásica.
Matemáticamente, esto lo podemos expresar de forma muy sencilla. Si representamos los hechos o premisas como variables, una regla clásica sigue la forma de una implicación lógica:

En el lenguaje del sistema, esto se traduce en una regla condicional: SI se cumple la premisa A  Y se cumple la premisa B , ENTONCES deducimos la consecuencia A  .

Miren el ejemplo en pantalla: SI el motor no arranca (Hecho A) Y las luces del tablero no encienden (Hecho B), ENTONCES el fallo es la batería con un 95% de certeza (Consecuencia C).

## Ejemplo

SI el motor no arranca (Hecho A) Y las luces del tablero no encienden (Hecho B), ENTONCES el fallo es la batería con un 95% de certeza (Consecuencia C).

##

Pero los seres humanos no siempre pensamos con verdades absolutas de blanco o negro. A veces el experto dice: 'Si el paciente tiene la piel templada, podría ser fiebre'. ¿Qué significa 'templada' o 'podría'? Para resolver esta vaguedad del lenguaje humano, los sistemas expertos utilizan herramientas formales como la Lógica Difusa e incorporan factores de certeza probabilísticos. Así, el sistema no solo dice 'sí' o 'no', sino que puede decir: 'Hay un 85% de probabilidad de que el diagnóstico sea gripe'."

## DIAPOSITIVA 5: El Segundo Pilar: El Motor de Inferencia

"El Motor de Inferencia es, literalmente, el motor del pensamiento del sistema. Si la base de conocimientos es el 'saber', el motor de inferencia es el 'razonar'.

Este componente es completamente agnóstico al problema. Es decir, no sabe de medicina, ni de finanzas, ni de geología. Lo único que sabe es lógica pura. Contiene los algoritmos y las leyes lógicas necesarios para procesar la información.

¿Cómo funciona? Cuando el usuario abre el sistema e introduce los datos específicos de su caso actual (por ejemplo: 'el paciente tiene 38 grados de fiebre y tos seca'), el Motor de Inferencia toma esos datos nuevos, va a la Base de Conocimientos, busca qué reglas coinciden con esos datos, las evalúa y deduce una solución.

Además, este motor actúa como un policía de tránsito. Si hay 500 reglas que podrían aplicarse a la vez, el motor decide cuáles tienen prioridad, en qué orden ejecutarlas y cómo evitar bucles infinitos de razonamiento."

## Métodos de Inferencia (Estrategias).

"Estas dos estrategias son el alma del motor de inferencia: el encadenamiento hacia adelante y hacia atrás.

El Encadenamiento hacia Adelante está guiado por los datos. Partimos de los hechos que conocemos al principio y avanzamos aplicando reglas para ver qué nuevas conclusiones podemos descubrir.

Imaginen a un médico en urgencias. Llega un paciente y el médico empieza a recolectar datos objetivos: temperatura, presión, dolor localizado. Con esos datos en mano, avanza aplicando reglas lógicas hasta que llega a una conclusión: 'El diagnóstico es apendicitis'.

Es un proceso reactivo, ideal para el diagnóstico de fallas o el monitoreo en tiempo real.

El Encadenamiento hacia Atrás, por el contrario, está guiado por metas u objetivos. Aquí empezamos al revés: planteamos una hipótesis final y trabajamos en reversa para ver si los hechos la respaldan.

Imaginen ahora a un detective de homicidios. No empieza juntando pistas al azar a ver qué pasa. El detective tiene una hipótesis inicial: 'El sospechoso X es el culpable'. A partir de esa meta, empieza a retroceder en el tiempo buscando evidencias: ¿Tiene coartada? ¿Estaba en la escena? Si los hechos demuestran los pasos previos, la hipótesis es verdadera. Es el método ideal para la planificación estratégica y la resolución de misterios complejos."

## DIAPOSITIVA 7: Tipos de Sistemas Expertos (Clasificación)

"A lo largo de la historia de la informática, los Sistemas Expertos han evolucionado en tres grandes familias según su arquitectura lógica:

El primer tipo son los Basados en Reglas. Son los más clásicos y tradicionales. Operan de forma estrictamente determinista bajo el formato de condiciones lógicas que acabamos de ver. Son ideales cuando las leyes de un negocio o sector son fijas y no cambian, como las regulaciones de impuestos o la validación de un crédito bancario.

El segundo tipo es sumamente interesante: Sistemas Basados en Casos, conocidos por sus siglas en inglés como CBR (Case-Based Reasoning). Estos sistemas imitan una de las cualidades más humanas de la experiencia: la memoria de situaciones pasadas. En lugar de procesar reglas lógicas desde cero, cuando se les presenta un problema nuevo, buscan en su base de datos históricos un caso muy similar que ya se haya resuelto con éxito en el pasado y adaptan esa solución antigua al problema actual. Es el razonamiento típico que usa un abogado al buscar jurisprudencia previa para ganar un juicio.

El tercer tipo son los Sistemas Probabilísticos o Bayesianos. La realidad suele estar llena de incertidumbres y datos ruidosos. Estos sistemas utilizan la estadística y el teorema de Bayes para calcular la probabilidad matemática de que una hipótesis sea cierta, permitiendo tomar decisiones óptimas bajo escenarios de alto riesgo."

## DIAPOSITIVA 8: Ventajas y Desafíos de los SE

"ventajas. El mayor valor de un Sistema Experto es la permanencia y la preservación del conocimiento. Si el ingeniero estrella de una central nuclear se jubila o se va a otra empresa, su sabiduría se va con él. Pero si construimos un Sistema Experto con su conocimiento, ese activo intelectual se queda en la organización para siempre. Además, el sistema está disponible 24/7, es veloz y es totalmente transparente al explicar sus conclusiones.

Sin embargo, debemos hablar de sus limitaciones, porque son importantes.

La primera limitación es que carecen por completo de sentido común. Un sistema experto médico puede ser brillante diagnosticando una infección pulmonar, pero si le dices que el paciente se tragó un destornillador de 20 centímetros, el sistema no sabrá qué hacer porque esa regla física elemental no está en su base de datos. Los humanos usamos el sentido común para descartar absurdos al instante; las máquinas no pueden hacerlo solas.

La segunda limitación es el mantenimiento. A medida que un sistema acumula miles de reglas, estas pueden empezar a contradecirse entre sí, haciendo que el mantenimiento de la base de conocimientos sea una tarea sumamente compleja y costosa. Y, finalmente, recuerden esto: no aprenden por sí mismos. Si las condiciones cambian, un humano tiene que ir a programar las nuevas reglas manualmente."

## DIAPOSITIVA 9: Conclusiones

Primero, el futuro no pertenece únicamente a un tipo de IA. Aunque hoy el aprendizaje automático y los modelos de lenguaje acaparan la atención, la tendencia actual son los Sistemas Híbridos (o IA neuro-simbólica). 

Esto consiste en unir la flexibilidad y la capacidad de aprendizaje de las redes neuronales con el control riguroso, la ética y la explicabilidad que ofrecen los Sistemas Expertos.

Segundo, la vigencia de estos sistemas es absoluta en sectores regulados. En medicina legal, auditorías financieras o control de tráfico aéreo, donde un error puede costar millones de dólares o vidas humanas, no podemos depender de una IA de 'caja negra' que no explique sus decisiones. Los Sistemas Expertos siguen siendo reyes indiscutibles donde la trazabilidad y la justificación paso a paso son indispensables.

Y finalmente, mi conclusión favorita: automatizar la experiencia humana no significa reemplazarla, sino multiplicar su alcance. Un sistema experto no compite con el especialista; lo empodera, lo libera de tareas repetitivas y pone su sabiduría al alcance de quienes más la necesitan en cualquier rincón del planeta.


## enlace del video

https://youtu.be/mUcujRWWRvQ?si=RvG_3QlMrsgUH9lG