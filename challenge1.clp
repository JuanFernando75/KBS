(deftemplate mono
    (slot estado-animo)
    (slot esta-sobre)
    (slot tiene-en-manos)
)

(deftemplate bananas
    (slot esta-sobre)
)

(deftemplate mesa
    (slot esta-sobre)
)

(deftemplate silla
    (slot esta-sobre)
)

(deftemplate piso
    (slot esta-sobre)
)

(deftemplate acciones
    (slot accion)
)

(deftemplate plan-completo
    (slot plan)
)


(deffacts mono
    (mono (estado-animo hambriento) (esta-sobre piso) (tiene-en-manos nada))
)

(deffacts bananas
    (bananas (esta-sobre techo))
)

(deffacts mesa
    (mesa (esta-sobre piso))
)

(deffacts silla
    (silla (esta-sobre piso))
)

(deffacts piso
    (piso (esta-sobre piso))
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


(defrule fin
    (mono (estado-animo feliz))
    =>
    ;(printout t "FIN" crlf)
    (assert (acciones (accion "FIN")))
    (construir-plan acciones)
)


(defrule acomodar-silla
    ?mono <- (mono (estado-animo hambriento) (esta-sobre piso) (tiene-en-manos silla))
    ?silla <- (silla (esta-sobre "manos del mono"))
    (mesa (esta-sobre piso))
    =>
    (modify ?mono (tiene-en-manos nada))
    (modify ?silla (esta-sobre mesa))
    ;(printout t "Mono coloca silla sobre la mesa" crlf)
    (assert (acciones (accion "Mono coloca silla sobre la mesa")))
)


(defrule agarrar-bananas
    ?mono <- (mono (estado-animo hambriento) (esta-sobre silla) (tiene-en-manos nada))
    (silla (esta-sobre mesa))
    (mesa (esta-sobre piso))
    ?bananas <- (bananas (esta-sobre techo))
    =>
    ;(printout t "Mono salta" crlf)
    (assert (acciones (accion "Mono salta")))
    (modify ?mono (tiene-en-manos bananas))
    (modify ?bananas (esta-sobre "manos del mono"))
    ;(printout t "Mono tiene en manos bananas" crlf)
    (assert (acciones (accion "Mono tiene en manos bananas")))
)


(defrule subir-a-silla
    ?mono <- (mono (estado-animo hambriento) (esta-sobre mesa) (tiene-en-manos nada))
    (silla (esta-sobre mesa))
    (mesa (esta-sobre piso))
    =>
    (modify ?mono (esta-sobre silla))
    ;(printout t "Mono se sube a la silla que también está sobre la mesa" crlf)
    (assert (acciones (accion "Mono se sube a la silla que también está sobre la mesa")))
)


(defrule subir-a-mesa
    ?mono <- (mono (estado-animo hambriento) (esta-sobre piso) (tiene-en-manos nada))
    (silla (esta-sobre mesa))
    (mesa (esta-sobre piso))
    =>
    (modify ?mono (esta-sobre mesa))
    ;(printout t "Mono se sube a la mesa" crlf)
    (assert (acciones (accion "Mono se sube a la mesa")))
)


(defrule agarrar-silla
    ?mono <- (mono (estado-animo hambriento) (esta-sobre piso) (tiene-en-manos nada))
    ?silla <- (silla (esta-sobre piso))
    (mesa (esta-sobre piso))
    =>
    (modify ?mono (tiene-en-manos silla))
    (modify ?silla (esta-sobre "manos del mono"))
    ;(printout t "Mono agarra la silla" crlf)
    (assert (acciones (accion "Mono agarra la silla")))
)


(defrule comer-bananas
    ?mono <- (mono (estado-animo hambriento) (tiene-en-manos bananas))
    (bananas (esta-sobre "manos del mono"))
    =>
    (modify ?mono (estado-animo feliz))
    ;(printout t "Mono está comiendo bananas y se pone feliz" crlf)
    (assert (acciones (accion "Mono está comiendo bananas y se pone feliz")))
)


