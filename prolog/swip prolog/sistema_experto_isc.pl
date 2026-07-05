:- use_module(library(http/http_server)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/html_write)). % Librería para generar HTML desde Prolog

% =========================================================================
% 1. BASE DE CONOCIMIENTOS (Hechos de ISC)
% =========================================================================

:- dynamic historial/4.

materia(mat1, 'Matematicas 1', 1, ciencias_basicas).
materia(mat2, 'Matematicas 2', 2, ciencias_basicas).
materia(prog1, 'Programacion 1', 1, programacion).
materia(prog2, 'Programacion 2', 2, programacion).
materia(bd1, 'Base de Datos 1', 3, base_de_datos).

seriacion(mat1, mat2).
seriacion(prog1, prog2).
seriacion(prog2, bd1).

alumno(1, 'Juan Perez').
alumno(2, 'Maria Lopez').
alumno(3, 'Carlos Gomez').

% Historial: Juan Pérez (Excelente)
historial(1, mat1, 1, 95).
historial(1, prog1, 1, 92).

% Historial: María López (Regular / Materia reprobada)
historial(2, mat1, 1, 50).
historial(2, mat1, 2, 75).
historial(2, prog1, 1, 65). 

% Historial: Carlos Gómez (Caso de Baja por 3 reprobadas)
historial(3, prog1, 1, 45).
historial(3, prog1, 2, 50).
historial(3, prog1, 3, 55).
historial(3, mat1, 1, 80).

% =========================================================================
% 2. MOTOR DE INFERENCIA
% =========================================================================

aprobo(IdAlumno, IdMateria) :-
    historial(IdAlumno, IdMateria, _, Cal),
    Cal >= 70, !.

veces_cursada(IdAlumno, IdMateria, Veces, Calificaciones) :-
    findall(C, historial(IdAlumno, IdMateria, _, C), Calificaciones),
    length(Calificaciones, Veces),
    Veces > 0.

debe_ser_dado_de_baja(IdAlumno, IdMateria) :-
    historial(IdAlumno, IdMateria, 3, Cal),
    Cal < 70, !.

nota_maxima_materia(IdAlumno, IdMateria, CalMax) :-
    findall(C, historial(IdAlumno, IdMateria, _, C), ListCals),
    ListCals \= [],
    max_list(ListCals, CalMax).

promedio_general(IdAlumno, Promedio) :-
    findall(CalMax, (materia(M, _, _, _), nota_maxima_materia(IdAlumno, M, CalMax)), ListaCalificacionesMax),
    (   ListaCalificacionesMax = []
    ->  Promedio = 0
    ;   sum_list(ListaCalificacionesMax, Suma),
        length(ListaCalificacionesMax, Total),
        Promedio is Suma / Total
    ).

materias_reprobadas_activas(IdAlumno, TotalReprobadas) :-
    findall(Mat, (materia(Mat, _, _, _), historial(IdAlumno, Mat, _, Cal), Cal < 70, \+ aprobo(IdAlumno, Mat)), Lista),
    sort(Lista, ListaUnica),
    length(ListaUnica, TotalReprobadas).

alto_rendimiento(IdAlumno, Nombre, Promedio) :-
    alumno(IdAlumno, Nombre),
    \+ debe_ser_dado_de_baja(IdAlumno, _),
    promedio_general(IdAlumno, Promedio),
    Promedio >= 90.

puede_cargar_materia(IdAlumno, IdMateria) :-
    \+ debe_ser_dado_de_baja(IdAlumno, _),
    \+ aprobo(IdAlumno, IdMateria),
    (   seriacion(PreRequisito, IdMateria)
    ->  aprobo(IdAlumno, PreRequisito)
    ;   true
    ).

limite_carga(IdAlumno, MaxMaterias) :-
    promedio_general(IdAlumno, Promedio),
    materias_reprobadas_activas(IdAlumno, Reprobadas),
    (   (Promedio < 80 ; Reprobadas > 1)
    ->  MaxMaterias = 4
    ;   MaxMaterias = 7
    ).

aspirantes_curso(IdMateria, ListaAspirantes, Total) :-
    findall(IdAlumno, (alumno(IdAlumno, _), puede_cargar_materia(IdAlumno, IdMateria)), ListaAspirantes),
    length(ListaAspirantes, Total).

% =========================================================================
% 3. ENRUTAMIENTO Y ENDPOINTS
% =========================================================================

% Definición de Handlers (Ahora se incluye la raíz '/')
:- http_handler(root(.), handle_raiz, []).
:- http_handler(root(materias), handle_materias, []).
:- http_handler(root(alumno_status), handle_alumno_status, []).
:- http_handler(root(alto_rendimiento), handle_alto_rendimiento, []).
:- http_handler(root(aspirantes), handle_aspirantes, []).

% --- ENDPOINT: / (PÁGINA RAÍZ EN HTML) ---
handle_raiz(_Request) :-
    reply_html_page(
        [title('Panel de Control - Sistema Experto ISC')],
        [
            html([
                head(style('
                    body { font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif; margin: 40px; background-color: #f4f7f6; color: #333; }
                    h1 { color: #0056b3; border-bottom: 2px solid #0056b3; padding-bottom: 10px; }
                    h2 { color: #666; margin-top: 30px; }
                    table { width: 100%; border-collapse: collapse; margin-top: 15px; background: white; box-shadow: 0 2px 5px rgba(0,0,0,0.1); border-radius: 8px; overflow: hidden; }
                    th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
                    th { background-color: #0056b3; color: white; }
                    tr:hover { background-color: #f1f1f1; }
                    .btn-link { display: inline-block; padding: 6px 12px; background-color: #28a745; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 0.9em; }
                    .btn-link:hover { background-color: #218838; }
                    .badge-cmd { background-color: #222; color: #00ff00; padding: 4px 8px; font-family: Consolas, monospace; border-radius: 4px; font-size: 0.9em; }
                ')),
                body([
                    h1('Sistema Experto de Inscripción - ISC'),
                    
                    
                    h2('Comandos del Servidor'),
                    table([
                        tr([th('Acción / Descripción'), th('Comando Consola (Alternativo)'), th('Probar en Navegador')]),
                        tr([
                            td('Ver mapa curricular organizado por semestre y área'),
                            td(span(class('badge-cmd'), 'curl http://localhost:8080/materias')),
                            td(a([class('btn-link'), href('/materias'), target('_blank')], 'Abrir JSON'))
                        ]),
                        tr([
                            td('Estatus Alumno 1 (Juan Pérez - Rendimiento Excelente / Carga de 7 materias)'),
                            td(span(class('badge-cmd'), 'curl http://localhost:8080/alumno_status?id=1')),
                            td(a([class('btn-link'), href('/alumno_status?id=1'), target('_blank')], 'Abrir JSON'))
                        ]),
                        tr([
                            td('Estatus Alumno 2 (María López - Rendimiento Bajo / Carga condicionada a 4 materias)'),
                            td(span(class('badge-cmd'), 'curl http://localhost:8080/alumno_status?id=2')),
                            td(a([class('btn-link'), href('/alumno_status?id=2'), target('_blank')], 'Abrir JSON'))
                        ]),
                        tr([
                            td('Estatus Alumno 3 (Carlos Gómez - Alerta de Baja Reglamentaria por 3 reprobadas)'),
                            td(span(class('badge-cmd'), 'curl http://localhost:8080/alumno_status?id=3')),
                            td(a([class('btn-link'), href('/alumno_status?id=3'), target('_blank')], 'Abrir JSON'))
                        ]),
                        tr([
                            td('Encontrar alumnos de Alto Rendimiento (Promedio >= 90 y sin baja)'),
                            td(span(class('badge-cmd'), 'curl http://localhost:8080/alto_rendimiento')),
                            td(a([class('btn-link'), href('/alto_rendimiento'), target('_blank')], 'Abrir JSON'))
                        ]),
                        tr([
                            td('Planificación del Gestor: Buscar cuántos posibles aspirantes hay para abrir "Matemáticas 2"'),
                            td(span(class('badge-cmd'), 'curl http://localhost:8080/aspirantes?materia=mat2')),
                            td(a([class('btn-link'), href('/aspirantes?materia=mat2'), target('_blank')], 'Abrir JSON'))
                        ])
                    ])
                ])
            ])
        ]
    ).

% --- ENDPOINT: /materias ---
handle_materias(_Request) :-
    findall(json([id=Id, nombre=Nom, semestre=Sem, area=Area]), materia(Id, Nom, Sem, Area), Materias),
    reply_json(Materias).

% --- ENDPOINT: /alumno_status?id=X ---
handle_alumno_status(Request) :-
    catch(
        (
            http_parameters(Request, [id(IdAtom, [integer])]),
            (   alumno(IdAtom, Nombre)
            ->  promedio_general(IdAtom, Promedio),
                limite_carga(IdAtom, MaxCarga),
                findall(M, (materia(M,_,_,_), puede_cargar_materia(IdAtom, M)), PreCarga),
                
                findall(MatC, historial(IdAtom, MatC, _, _), ListaMatsCursadas),
                sort(ListaMatsCursadas, ListaMatsUnicas),
                findall(json([materia=Mat, veces=V, calificaciones=Cals]), 
                        (member(Mat, ListaMatsUnicas), veces_cursada(IdAtom, Mat, V, Cals)), 
                        Historial),
                
                ( debe_ser_dado_de_baja(IdAtom, MatBaja) -> Baja = true, Motivo = MatBaja ; Baja = false, Motivo = none ),
                
                reply_json(json([
                    id = IdAtom,
                    nombre = Nombre,
                    promedio = Promedio,
                    max_materias_permitidas = MaxCarga,
                    materias_sugeridas_disponibles = PreCarga,
                    historial_detallado = Historial,
                    baja_reglamentaria = Baja,
                    motivo_baja = Motivo
                ]))
            ;   reply_json(json([error='Alumno no encontrado']), [status(404)])
            )
        ),
        Error,
        (
            term_string(Error, ErrorTexto),
            reply_json(json([error='Error interno en la inferencia', detalle=ErrorTexto]), [status(500)])
        )
    ).

% --- ENDPOINT: /alto_rendimiento ---
handle_alto_rendimiento(_Request) :-
    findall(json([id=Id, nombre=Nom, promedio=Prom]), alto_rendimiento(Id, Nom, Prom), Alumnos),
    reply_json(Alumnos).

% --- ENDPOINT: /aspirantes?materia=X ---
handle_aspirantes(Request) :-
    http_parameters(Request, [materia(MatId, [atom])]),
    (   materia(MatId, NombreMat, _, _)
    ->  aspirantes_curso(MatId, Lista, Total),
        reply_json(json([materia=NombreMat, total_aspirantes=Total, alumnos_id=Lista]))
    ;   reply_json(json([error='Materia no encontrada']), [status(404)])
    ).

% =========================================================================
% 4. INICIALIZACIÓN AUTOMÁTICA
% =========================================================================

iniciar_servidor_automatico :-
    Puerto = 8080,
    http_server([port(Puerto)]),
    format('~n======================================================~n', []),
    format('  Servidor Experto ISC iniciado en el puerto ~w~n', [Puerto]),
    format('  Accede localmente en: http://localhost:~w/~n', [Puerto]),
    format('======================================================~n~n', []).

:- initialization(iniciar_servidor_automatico).