(deftemplate cirujano
    (slot puesto)
    (slot estado)
    (slot ubicacion)
    (slot en-posesion)
    (slot en-intervencion)
    (slot intervencion-terminada)
    (slot concentrado-en)
)

(deftemplate anestesiologo
    (slot estado)
    (slot ubicacion)
    (slot aplico-anestesia)
    (slot concentrado-en)
)

(deftemplate enfermera
    (slot puesto)
    (slot estado)
    (slot ubicacion)
    (slot en-posesion)
    (slot concentrado-en)
)

(deftemplate paciente
    (slot estado)
    (slot ubicacion)
    (slot condicion)
)

(deftemplate cirujia
    (slot iniciada)
    (slot terminada)
    (slot estado)
)

(deftemplate acciones
    (slot accion)
)

(deftemplate plan-completo
    (slot plan)
)


(deffacts cirujano-jefe
    (cirujano (puesto jefe) (estado listo) (ubicacion quirofano) (concentrado-en empezar-cirujia))
)

(deffacts cirujano-2
    (cirujano (puesto segundo-cirujano) (estado listo) (ubicacion quirofano) (en-intervencion no) (intervencion-terminada no) (en-posesion nada) (concentrado-en esperar-ordenes))
)

(deffacts anestesiologo
    (anestesiologo (estado listo) (ubicacion quirofano) (aplico-anestesia no) (concentrado-en esperar-ordenes))
)

(deffacts enfermera
    (enfermera (puesto asistente) (estado listo) (ubicacion quirofano) (en-posesion instrumentos) (concentrado-en esperar-ordenes))
)

(deffacts paciente
    (paciente (estado listo) (ubicacion quirofano) (condicion despierto))
)

(deffacts cirujia
    (cirujia (iniciada no) (terminada no) (estado sin-iniciar))
)


(deffunction construir-plan (?template)
    (bind ?contador 1)
    (bind ?plan-completo "")
    (do-for-all-facts ((?fct ?template)) TRUE
        (bind ?plan-completo (str-cat ?plan-completo ?contador"- " ?fct:accion ". "))
        (bind ?contador (+ ?contador 1))
    )
    ;(printout t ?plan-completo crlf)
    (bind ?f (assert (plan-completo (plan ?plan-completo))))
    (printout t (fact-slot-value (fact-index ?f) plan) crlf)
)


;14. Fin
(defrule fin
    (paciente (ubicacion sala-de-recuperacion))
    (cirujia (estado cirujia-finalizada))
    =>
    ;(printout t "FIN" crlf)
    (assert (acciones (accion "FIN")))
    (construir-plan acciones)
)

;9. La intervencion ya casi termina
(defrule intervencion-casi-terminada
    (cirujia (iniciada si) (estado en-intervencion))
    (paciente (condicion sedado))
    ?cirujano <- (cirujano (puesto segundo-cirujano) (estado listo) (ubicacion quirofano) (en-intervencion si) (intervencion-terminada no) (en-posesion instrumentos) (concentrado-en continuar-intervencion))
    ?enfermera <- (enfermera (puesto asistente) (estado listo) (ubicacion quirofano) (en-posesion nada) (concentrado-en dar-instrumentos))
    =>
    (modify ?enfermera (concentrado-en esperar-ordenes))
    (modify ?cirujano (concentrado-en terminar-intervencion))
    ;(printout t "El cirujano está a punto de terminar la intervencion" crlf)
    (assert (acciones (accion "El cirujano está a punto de terminar la intervencion")))
)

;11. Cirujano avisa a jefe la finalización de la intervencion
(defrule aviso-intervencion-finalizada
    (cirujia (estado intervencion-finalizada))
    ?cirujano <- (cirujano (puesto segundo-cirujano) (estado listo) (ubicacion quirofano) (en-intervencion no) (intervencion-terminada si) (en-posesion instrumentos) (concentrado-en terminar-intervencion))
    (cirujano (puesto jefe) (concentrado-en esperar-resultados))
    =>
    (modify ?cirujano (concentrado-en confirmar-intervencion))
    ;(printout t "El cirujano da aviso al jefe que la intervencion ha sido finalizada" crlf)
    (assert (acciones (accion "El cirujano da aviso al jefe que la intervencion ha sido finalizada")))
)

;5. Jefe ordena al cirujano comenzar intervencion
(defrule orden-comenzar-intervencion
    ?cirujia <- (cirujia (iniciada si) (estado paciente-sedado))
    ?anestesiologo <- (anestesiologo (aplico-anestesia si) (concentrado-en confirmar-sedamiento))
    (paciente (condicion sedado))
    ?jefe <- (cirujano (puesto jefe) (concentrado-en esperar-resultados))
    =>
    (modify ?cirujia (estado iniciando-intervencion))
    (modify ?anestesiologo (concentrado-en esperar-ordenes))
    (modify ?jefe (concentrado-en ordenar-iniciar-intervencion))
    ;(printout t "Jefe ordena al cirujano comenzar intervencion" crlf)
    (assert (acciones (accion "Jefe ordena al cirujano comenzar intervencion")))
)

;8. Enfermera provee el material
(defrule provee-instrumentos
    (cirujia (iniciada si) (estado en-intervencion))
    ?cirujano <- (cirujano (puesto segundo-cirujano) (estado listo) (ubicacion quirofano) (en-intervencion si) (intervencion-terminada no) (en-posesion nada) (concentrado-en solicitar-instrumentos))
    (paciente (condicion sedado))
    ?enfermera <- (enfermera (puesto asistente) (estado listo) (ubicacion quirofano) (en-posesion instrumentos) (concentrado-en esperar-ordenes))
    =>
    (modify ?enfermera (en-posesion nada) (concentrado-en dar-instrumentos))
    (modify ?cirujano (en-posesion instrumentos) (concentrado-en continuar-intervencion))
    ;(printout t "La enfermera asistente provee el material e instrumentos al cirujano" crlf)
    (assert (acciones (accion "La enfermera asistente provee el material e instrumentos al cirujano")))
)

;1. Al estar todos listos y en quirofano se puede iniciar la cirujia
(defrule inicio-cirujia
    (cirujano (puesto jefe) (estado listo) (ubicacion quirofano))
    (cirujano (puesto segundo-cirujano) (estado listo) (ubicacion quirofano))
    (anestesiologo (estado listo) (ubicacion quirofano))
    (enfermera (estado listo) (ubicacion quirofano))
    (paciente (estado listo) (ubicacion quirofano))
    ?cirujia <- (cirujia (iniciada no) (terminada no))
    =>
    (modify ?cirujia (iniciada si) (estado iniciando))
    ;(printout t "Todos están en el quirofano y listos para iniciar la cirujía" crlf)
    (assert (acciones (accion "Todos están en el quirofano y listos para iniciar la cirujía")))
)

;12. Jefe ordena a enfermera llevar al paciente a la sala de recuperacion
(defrule orden-llevar-paciente
    (cirujia (estado intervencion-finalizada))
    ?cirujano <- (cirujano (puesto segundo-cirujano) (estado listo) (ubicacion quirofano) (en-intervencion no) (intervencion-terminada si) (en-posesion instrumentos) (concentrado-en confirmar-intervencion))
    ?jefe <- (cirujano (puesto jefe) (concentrado-en esperar-resultados))
    =>
    (modify ?jefe (concentrado-en ordenar-llevar-paciente))
    (modify ?cirujano (concentrado-en esperar-resultados))
    ;(printout t "Jefe ordena a la enfermera asistente llevar al paciente a la sala de recuperacion" crlf)
    (assert (acciones (accion "Jefe ordena a la enfermera asistente llevar al paciente a la sala de recuperacion")))
)

;2. Jefe ordena sedar
(defrule orden-sedar
    ?cirujia <- (cirujia (iniciada si) (estado iniciando))
    ?jefe <- (cirujano (puesto jefe) (concentrado-en empezar-cirujia))
    =>
    (modify ?cirujia (estado sedando-paciente))
    (modify ?jefe (concentrado-en ordenar-sedar))
    ;(printout t "Jefe ordena a anestesiologo confirmar el cálculo del anestésico y aplicarlo al paciente" crlf)
    (assert (acciones (accion "Jefe ordena a anestesiologo confirmar el cálculo del anestésico y aplicarlo al paciente")))
)

;13. Enfermera lleva al paciente a la sala de recuperacion
(defrule llevar-paciente-sala-recuperacion
    ?cirujia <- (cirujia (estado intervencion-finalizada))
    ?jefe <- (cirujano (puesto jefe) (concentrado-en ordenar-llevar-paciente))
    ?paciente <- (paciente (ubicacion quirofano) (condicion sedado))
    ?enfermera <- (enfermera (puesto asistente) (estado listo) (ubicacion quirofano) (concentrado-en esperar-ordenes))
    =>
    (modify ?jefe (concentrado-en esperar-resultados))
    (modify ?cirujia (estado cirujia-finalizada))
    (modify ?paciente (ubicacion sala-de-recuperacion))
    (modify ?enfermera (ubicacion sala-de-recuperacion) (concentrado-en llevar-paciente))
    ;(printout t "Enfermera lleva al paciente a la sala de recuperacion" crlf)
    (assert (acciones (accion "Enfermera lleva al paciente a la sala de recuperacion")))
)

;10. Intervencion terminada
(defrule intervencion-finalizada
    ?cirujia <- (cirujia (iniciada si) (estado en-intervencion))
    (paciente (condicion sedado))
    ?cirujano <- (cirujano (puesto segundo-cirujano) (estado listo) (ubicacion quirofano) (en-intervencion si) (intervencion-terminada no) (en-posesion instrumentos) (concentrado-en terminar-intervencion))
    =>
    (modify ?cirujano (en-intervencion no) (intervencion-terminada si))
    (modify ?cirujia (estado intervencion-finalizada))
    ;(printout t "El cirujano termina la intervencion" crlf)
    (assert (acciones (accion "El cirujano termina la intervencion")))
)

;7. Cirujano solicita instrumentos a enfermera
(defrule solicita-instrumentos
    (cirujia (iniciada si) (estado en-intervencion))
    ?cirujano <- (cirujano (puesto segundo-cirujano) (estado listo) (ubicacion quirofano) (en-intervencion si) (intervencion-terminada no) (en-posesion nada) (concentrado-en iniciar-intervencion))
    (paciente (condicion sedado))
    ?enfermera <- (enfermera (puesto asistente) (estado listo) (ubicacion quirofano) (en-posesion instrumentos) (concentrado-en esperar-ordenes))
    =>
    (modify ?cirujano (en-intervencion si) (concentrado-en solicitar-instrumentos))
    ;(printout t "Cirujano solicita material e instrumentos a la enfermera asistente" crlf)
    (assert (acciones (accion "Cirujano solicita material e instrumentos a la enfermera asistente")))
)

;6. Se inicia intervencion
(defrule inicio-intervencion
    ?cirujia <- (cirujia (iniciada si) (estado iniciando-intervencion))
    (anestesiologo (aplico-anestesia si))
    (paciente (condicion sedado))
    ?jefe <- (cirujano (puesto jefe) (concentrado-en ordenar-iniciar-intervencion))
    ?cirujano <- (cirujano (puesto segundo-cirujano) (estado listo) (ubicacion quirofano) (en-intervencion no) (intervencion-terminada no) (concentrado-en esperar-ordenes))
    =>
    (modify ?cirujano (en-intervencion si) (concentrado-en iniciar-intervencion))
    (modify ?cirujia (estado en-intervencion))
    (modify ?jefe (concentrado-en esperar-resultados))
    ;(printout t "Cirujano inicia la intervencion al paciente" crlf)
    (assert (acciones (accion "Cirujano inicia la intervencion al paciente")))
)

;3. Se seda al paciente
(defrule paciente-sedado
    ?cirujia <- (cirujia (iniciada si) (estado sedando-paciente))
    ?paciente <- (paciente (condicion despierto))
    ?anestesiologo <- (anestesiologo (aplico-anestesia no) (concentrado-en esperar-ordenes))
    ?jefe <- (cirujano (puesto jefe) (concentrado-en ordenar-sedar))
    =>
    (modify ?paciente (condicion sedado))
    (modify ?anestesiologo (concentrado-en sedar-paciente))
    (modify ?cirujia (estado paciente-sedado))
    (modify ?jefe (concentrado-en esperar-resultados))
    ;(printout t "Anestesiologo seda al paciente" crlf)
    (assert (acciones (accion "Anestesiologo seda al paciente")))
)

;4. Se avisa que el paciente ya está sedado
(defrule aviso-paciente-sedado
    (paciente (condicion sedado))
    ?anestesiologo <- (anestesiologo (aplico-anestesia no) (concentrado-en sedar-paciente))
    (cirujia (iniciada si) (estado paciente-sedado))
    (cirujano (puesto jefe) (concentrado-en esperar-resultados))
    =>
    (modify ?anestesiologo (aplico-anestesia si) (concentrado-en confirmar-sedamiento))
    ;(printout t "Anestesiologo confirma que el paciente ya se encuentra sedado" crlf)
    (assert (acciones (accion "Anestesiologo confirma que el paciente ya se encuentra sedado")))
)
