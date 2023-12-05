(deftemplate smartphone
    (slot smartphone-id)
    (slot marca)
    (slot modelo)
    (slot precio)
)

(deftemplate computadora
    (slot computadora-id)
    (slot marca)
    (slot modelo)
    (slot precio)
)

(deftemplate accesorio
    (slot accesorio-id)
    (slot descripcion)
    (slot precio)
)

(deftemplate cliente
    (slot cliente-id)
    (slot nombre)
    (slot nacimiento)
    (slot telefono)
    (slot tarjeta-id)
    (slot ingreso)
    (slot cliente-nuevo (default 1))
    (slot compras-realizadas (default 0))
    (slot articulos-comprados (default 0))
)

(deftemplate tarjeta
    (slot tarjeta-id)
    (slot banco)
    (slot grupo)
    (slot fecha-vencimiento)
)

(deftemplate vale
    (slot vale-id)
    (slot descuento)
)

(deftemplate orden
    (slot orden-id)
    (slot cliente-id)
    (slot metodo-pago)
    (slot tipo-compra)
    (slot total (default 0))
)

(deftemplate line-item
    (slot orden-id)
    (slot smartphone-id)
    (slot computadora-id)
    (slot accesorio-id)
    (slot cliente-id)
    (slot cantidad (default 1))
    (slot total (default 0))
)

(deffacts smartphones
    (smartphone (smartphone-id 1) (marca Apple) (modelo "iPhone 15") (precio 20000))
    (smartphone (smartphone-id 2) (marca Samsung) (modelo "Galaxy S21") (precio 8500))
    (smartphone (smartphone-id 3) (marca Google) (modelo "Pixel 5") (precio 6500))
    (smartphone (smartphone-id 4) (marca OnePlus) (modelo "8T") (precio 5500))
    (smartphone (smartphone-id 5) (marca Xiaomi) (modelo "Mi 11") (precio 8000))
    (smartphone (smartphone-id 6) (marca Samsung) (modelo "Note 12") (precio 10000))
)

(deffacts computadoras
    (computadora (computadora-id 1) (marca Apple) (modelo "MacBook Air") (precio 17000))
    (computadora (computadora-id 2) (marca Dell) (modelo "XPS 13") (precio 30000))
    (computadora (computadora-id 3) (marca HP) (modelo "Spectre x360") (precio 35000))
    (computadora (computadora-id 4) (marca Lenovo) (modelo "ThinkPad X1 Carbon") (precio 33000))
    (computadora (computadora-id 5) (marca Asus) (modelo "ZenBook 14") (precio 15000))
    (computadora (computadora-id 6) (marca Acer) (modelo "Aspire 5") (precio 9000))
    (computadora (computadora-id 7) (marca Lenovo) (modelo "IdeaPad 3") (precio 8000))
    (computadora (computadora-id 9) (marca Dell) (modelo "Inspiron 14") (precio 14000))
)

(deffacts accesorios
    (accesorio (accesorio-id 1) (descripcion "Funda para celular") (precio 50))
    (accesorio (accesorio-id 2) (descripcion "Auriculares inalámbricos") (precio 300))
    (accesorio (accesorio-id 3) (descripcion "Ratón ergonómico") (precio 200))
    (accesorio (accesorio-id 4) (descripcion "Cargador rápido") (precio 200))
    (accesorio (accesorio-id 5) (descripcion "Mochila para portátil") (precio 500))
    (accesorio (accesorio-id 6) (descripcion "Teclado inalámbrico") (precio 1200))
    (accesorio (accesorio-id 7) (descripcion "Cargador de coche") (precio 400))
    (accesorio (accesorio-id 8) (descripcion "Base de refrigeración") (precio 800))
    (accesorio (accesorio-id 9) (descripcion "Funda para portátil") (precio 400))
    (accesorio (accesorio-id 10) (descripcion "Mochila antirrobo") (precio 2000))
    (accesorio (accesorio-id 11) (descripcion "Auriculares con cancelación de ruido") (precio 3000))
    (accesorio (accesorio-id 12) (descripcion "Cable USB-C") (precio 150))
)

(deffacts clientes
    (cliente (cliente-id 1) (nombre "Juan Valdez") (nacimiento "2001-05-14") (telefono 3331055819) (tarjeta-id 1) (ingreso "2019-09-25") (compras-realizadas 18) (articulos-comprados 29))
    (cliente (cliente-id 2) (nombre "César Madero") (nacimiento "1993-09-21") (telefono 3359876543) (tarjeta-id 2) (ingreso "2022-03-04") (compras-realizadas 9) (articulos-comprados 66))
    (cliente (cliente-id 3) (nombre "Felipe Gutierrez")  (nacimiento "1999-09-17") (telefono 3311542602) (tarjeta-id 3) (ingreso "2021-01-21") (compras-realizadas 12) (articulos-comprados 58))
    (cliente (cliente-id 4) (nombre "Laura Torres") (telefono 3357778888) (nacimiento "1995-02-14") (tarjeta-id 4) (ingreso "2017-05-28") (compras-realizadas 14) (articulos-comprados 24))
    (cliente (cliente-id 5) (nombre "Luis Mendoza") (telefono 3354443333) (nacimiento "2004-11-06") (tarjeta-id 5) (ingreso "2023-01-05") (compras-realizadas 7) (articulos-comprados 7))
    (cliente (cliente-id 6) (nombre "Alejandro Ceja") (nacimiento "2001-09-03") (telefono 3312650289) (ingreso "2023-10-18") (compras-realizadas 0) (articulos-comprados 0))
)

(deffacts tarjetas
    (tarjeta (tarjeta-id 1) (banco BBVA) (grupo Visa) (fecha-vencimiento 24-12-01))
    (tarjeta (tarjeta-id 2) (banco Liverpool) (grupo Visa) (fecha-vencimiento 24-05-24))
    (tarjeta (tarjeta-id 3) (banco Santander) (grupo MasterCard) (fecha-vencimiento 24-09-23))
    (tarjeta (tarjeta-id 4) (banco HSBC) (grupo MasterCard) (fecha-vencimiento 24-06-24))
    (tarjeta (tarjeta-id 5) (banco Scotiabank) (grupo Visa) (fecha-vencimiento 24-10-23))
)

(deffacts vales
    (vale (vale-id 1) (descuento 50))
    (vale (vale-id 2) (descuento 20))
    (vale (vale-id 3) (descuento 100))
    (vale (vale-id 4) (descuento 75))
    (vale (vale-id 5) (descuento 25))
)

(deffacts ordenes
    (orden (orden-id 1) (cliente-id 1) (metodo-pago Efectivo) (tipo-compra Contado) (total 71900))
    (orden (orden-id 2) (cliente-id 2) (metodo-pago "Tarjeta de crédito") (tipo-compra Crédito) (total 207600))
    (orden (orden-id 3) (cliente-id 3) (metodo-pago "Tarjeta de crédito") (tipo-compra Crédito) (total 203900))
    (orden (orden-id 4) (cliente-id 4) (metodo-pago Efectivo) (tipo-compra Contado) (total 75500))
    (orden (orden-id 5) (cliente-id 5) (metodo-pago Efectivo) (tipo-compra Contado) (total 36200))
    (orden (orden-id 6) (cliente-id 1) (metodo-pago "Tarjeta de crédito") (tipo-compra Crédito) (total 90900))
    (orden (orden-id 7) (cliente-id 4) (metodo-pago "Tarjeta de débito") (tipo-compra Contado) (total 6700))
    (orden (orden-id 8) (cliente-id 3) (metodo-pago Efectivo) (tipo-compra Contado) (total 234000))
    (orden (orden-id 9) (cliente-id 2) (metodo-pago "Tarjeta de crédito") (tipo-compra Crédito) (total 190400))
    (orden (orden-id 10) (cliente-id 4) (metodo-pago "Tarjeta de débito") (tipo-compra Contado) (total 16200))
    (orden (orden-id 11) (cliente-id 5) (metodo-pago Efectivo) (tipo-compra Contado) (total 37000))
    (orden (orden-id 12) (cliente-id 1) (metodo-pago "Tarjeta de crédito") (tipo-compra Crédito) (total 27400))
    (orden (orden-id 13) (cliente-id 3) (metodo-pago Efectivo) (tipo-compra Contado) (total 318400))
    (orden (orden-id 14) (cliente-id 4) (metodo-pago "Tarjeta de crédito") (tipo-compra Crédito) (total 15400))
    (orden (orden-id 15) (cliente-id 2) (metodo-pago "Tarjeta de débito") (tipo-compra Crédito) (total 250500))
    (orden (orden-id 16) (cliente-id 1) (metodo-pago Efectivo) (tipo-compra Contado) (total 56000))


    (orden (orden-id 99) (cliente-id 4) (metodo-pago Efectivo) (tipo-compra Contado) (total 24200))
    (orden (orden-id 991) (cliente-id 1) (metodo-pago Efectivo) (tipo-compra Contado) (total 35000))
    (orden (orden-id 9915) (cliente-id 4) (metodo-pago Efectivo) (tipo-compra Contado) (total 20400))
    (orden (orden-id 99157) (cliente-id 3) (metodo-pago "Tarjeta de crédito") (tipo-compra Crédito) (total 35050))
    (orden (orden-id 991572) (cliente-id 5) (metodo-pago Efectivo) (tipo-compra Contado) (total 37000))
)

(deffacts items-list
    (line-item (orden-id 1) (accesorio-id 2) (cliente-id 1) (cantidad 3) (total 900))
    (line-item (orden-id 1) (smartphone-id 2) (cliente-id 1) (cantidad 2) (total 17000))
    (line-item (orden-id 1) (smartphone-id 1) (cliente-id 1) (cantidad 1) (total 20000))
    (line-item (orden-id 1) (computadora-id 1) (cliente-id 1) (cantidad 2) (total 34000))
    (line-item (orden-id 2) (computadora-id 2) (cliente-id 2) (cantidad 6) (total 180000))
    (line-item (orden-id 2) (accesorio-id 3) (cliente-id 2) (cantidad 8) (total 1600))
    (line-item (orden-id 2) (smartphone-id 3) (cliente-id 2) (cantidad 4) (total 26000))
    (line-item (orden-id 3) (computadora-id 3) (cliente-id 3) (cantidad 5) (total 175000))
    (line-item (orden-id 3) (accesorio-id 4) (cliente-id 3) (cantidad 7) (total 1400))
    (line-item (orden-id 3) (smartphone-id 4) (cliente-id 3) (cantidad 5) (total 27500))
    (line-item (orden-id 4) (computadora-id 4) (cliente-id 4) (cantidad 2) (total 66000))
    (line-item (orden-id 4) (accesorio-id 5) (cliente-id 4) (cantidad 3) (total 1500))
    (line-item (orden-id 4) (smartphone-id 5) (cliente-id 4) (cantidad 1) (total 8000))
    (line-item (orden-id 5) (computadora-id 5) (cliente-id 5) (cantidad 1) (total 15000))
    (line-item (orden-id 5) (accesorio-id 6) (cliente-id 5) (cantidad 1) (total 1200))
    (line-item (orden-id 5) (smartphone-id 1) (cliente-id 5) (cantidad 1) (total 20000))
    (line-item (orden-id 6) (computadora-id 1) (cliente-id 1) (cantidad 3) (total 51000))
    (line-item (orden-id 6) (accesorio-id 2) (cliente-id 1) (cantidad 2) (total 600))
    (line-item (orden-id 6) (computadora-id 2) (cliente-id 1) (cantidad 1) (total 30000))
    (line-item (orden-id 6) (accesorio-id 3) (cliente-id 1) (cantidad 4) (total 800))
    (line-item (orden-id 6) (smartphone-id 2) (cliente-id 1) (cantidad 1) (total 8500))
    (line-item (orden-id 7) (smartphone-id 4) (cliente-id 4) (cantidad 1) (total 5500))
    (line-item (orden-id 7) (accesorio-id 7) (cliente-id 4) (cantidad 3) (total 1200))
    (line-item (orden-id 8) (accesorio-id 8) (cliente-id 3) (cantidad 3) (total 2400))
    (line-item (orden-id 8) (computadora-id 4) (cliente-id 3) (cantidad 7) (total 231000))
    (line-item (orden-id 8) (smartphone-id 2) (cliente-id 3) (cantidad 10) (total 85000))
    (line-item (orden-id 9) (computadora-id 2) (cliente-id 2) (cantidad 5) (total 150000))
    (line-item (orden-id 9) (accesorio-id 3) (cliente-id 2) (cantidad 7) (total 1400))
    (line-item (orden-id 9) (smartphone-id 3) (cliente-id 2) (cantidad 6) (total 39000))
    (line-item (orden-id 10) (accesorio-id 7) (cliente-id 4) (cantidad 3) (total 1200))
    (line-item (orden-id 10) (computadora-id 5) (cliente-id 4) (cantidad 1) (total 15000))
    (line-item (orden-id 11) (computadora-id 3) (cliente-id 5) (cantidad 1) (total 35000))
    (line-item (orden-id 11) (accesorio-id 10) (cliente-id 5) (cantidad 1) (total 2000))
    (line-item (orden-id 12) (smartphone-id 5) (cliente-id 1) (cantidad 1) (total 8000))
    (line-item (orden-id 12) (computadora-id 1) (cliente-id 1) (cantidad 1) (total 17000))
    (line-item (orden-id 12) (accesorio-id 6) (cliente-id 1) (cantidad 2) (total 2400))
    (line-item (orden-id 13) (accesorio-id 5) (cliente-id 3) (cantidad 6) (total 3000))
    (line-item (orden-id 13) (computadora-id 2) (cliente-id 3) (cantidad 6) (total 180000))
    (line-item (orden-id 13) (smartphone-id 2) (cliente-id 3) (cantidad 6) (total 51000))
    (line-item (orden-id 14) (computadora-id 5) (cliente-id 4) (cantidad 1) (total 15000))
    (line-item (orden-id 14) (accesorio-id 3) (cliente-id 4) (cantidad 2) (total 400))
    (line-item (orden-id 15) (accesorio-id 4) (cliente-id 2) (cantidad 15) (total 3000))
    (line-item (orden-id 15) (smartphone-id 4) (cliente-id 2) (cantidad 9) (total 49500))
    (line-item (orden-id 15) (computadora-id 4) (cliente-id 2) (cantidad 6) (total 198000))
    (line-item (orden-id 16) (computadora-id 1) (cliente-id 1) (cantidad 1) (total 17000))
    (line-item (orden-id 16) (accesorio-id 2) (cliente-id 1) (cantidad 1) (total 300))
    (line-item (orden-id 16) (smartphone-id 2) (cliente-id 1) (cantidad 1) (total 8500))
    (line-item (orden-id 16) (computadora-id 2) (cliente-id 1) (cantidad 1) (total 30000))
    (line-item (orden-id 16) (accesorio-id 3) (cliente-id 1) (cantidad 1) (total 200))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    (line-item (orden-id 99) (smartphone-id 5) (cliente-id 4) (cantidad 1) (total 8000))
    (line-item (orden-id 99) (computadora-id 5) (cliente-id 4) (cantidad 1) (total 15000))
    (line-item (orden-id 99) (accesorio-id 6) (cliente-id 4) (cantidad 1) (total 1200))
    (line-item (orden-id 991) (computadora-id 3) (cliente-id 1) (cantidad 1) (total 35000))
    (line-item (orden-id 9915) (computadora-id 6) (cliente-id 4) (cantidad 2) (total 18000))
    (line-item (orden-id 9915) (accesorio-id 6) (cliente-id 4) (cantidad 2) (total 2400))

    (line-item (orden-id 99157) (smartphone-id 1) (cliente-id 3) (cantidad 1) (total 20000))
    (line-item (orden-id 99157) (computadora-id 5) (cliente-id 3) (cantidad 1) (total 15000))
    (line-item (orden-id 99157) (accesorio-id 1) (cliente-id 3) (cantidad 1) (total 50))

    (line-item (orden-id 991572) (smartphone-id 1) (cliente-id 5) (cantidad 1) (total 20000))
    (line-item (orden-id 991572) (computadora-id 1) (cliente-id 5) (cantidad 1) (total 17000))
)



;REGLAS
;1. Por compras de contado, osea que pagaron todo de golpe, mayores de una cantidad
(defrule r1
    (orden (orden-id ?orden) (cliente-id ?cliente) (metodo-pago Efectivo) (tipo-compra Contado) (total ?total))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (cliente-nuevo 0))
    =>
    (if (> ?total 300000) then
        (printout t "Ese gasto tuvo que doler " ?nombre "! te ofrecemos un 15% de descuento correspondiente a tu orden " ?orden " en tu próxima compra de contado mayor a $200,000" crlf)
    )
)


;2. Si es cliente nuevo agradecer y algun descuento, además indicar que ya ha comprado y no es cliente nuevo
(defrule r2
    (orden (orden-id ?orden) (cliente-id ?cliente))
    ?p <- (cliente (cliente-id ?cliente) (nombre ?nombre) (cliente-nuevo 1))
    =>
    (modify ?p (cliente-nuevo 0))
    (printout t "Gracias por tu primera compra " ?nombre ", como agradecimiento 20% de descuento en los siguientes 3 artículos que compres" crlf)
)


;3. Definir si un cliente es mayorista o minorista
(defrule r3
    ?p <- (cliente (cliente-id ?cliente) (nombre ?nombre) (compras-realizadas ?compras) (articulos-comprados ?articulos) (cliente-nuevo 0))
    (test (> ?compras 0))
    =>
    (bind ?promedio (/ ?articulos ?compras))
    (if (> ?promedio 3) then
        (printout t "El cliente " ?nombre " es mayorista" crlf)
    else
        (printout t "El cliente " ?nombre " es minorista" crlf)
    )
)


;4. En la compra de un Samsung Galaxy S21 con tarjeta BBVA, ofrece 12 meses sin intereses.
(defrule r4
    (orden (orden-id ?orden) (cliente-id ?cliente) (tipo-compra Crédito))
    (line-item (orden-id ?orden) (smartphone-id ?smartphone))
    (smartphone (smartphone-id ?smartphone) (marca Samsung) (modelo "Galaxy S21"))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (tarjeta-id ?tarjeta) (cliente-nuevo 0))
    (tarjeta (tarjeta-id ?tarjeta) (banco BBVA))
    =>
    (printout t ?nombre " te ofrecemos 12 meses sin intereses al haber comprado Samsung Galaxy S21 correspondiente a la orden " ?orden crlf)
)


;5. Al comprar celular, computadora y artículo específico regalar otro artículo
(defrule r5
    (orden (orden-id ?orden) (cliente-id ?cliente))
    (line-item (orden-id ?orden) (smartphone-id ?smartphone))
    (line-item (orden-id ?orden) (computadora-id ?computadora))
    (line-item (orden-id ?orden) (accesorio-id ?accesorio))
    (smartphone (smartphone-id ?smartphone) (marca Xiaomi) (modelo "Mi 11"))
    (computadora (computadora-id ?computadora) (marca Asus) (modelo "ZenBook 14"))
    (accesorio (accesorio-id ?accesorio) (descripcion "Teclado inalámbrico"))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (cliente-nuevo 0))
    =>
    (printout t ?nombre " andas con todo!! por tu compra llévate unos Auriculares inalámbricos de regalo" crlf)
)


;6. Al tener más de 17 compras ofrecer descuento
(defrule r6
    ?p <- (cliente(cliente-id ?cliente) (nombre ?nombre) (compras-realizadas ?compras))
    =>
    (if (> ?compras 17) then
        (printout t ?nombre " gracias por confiar en nosotros, como agradecimiento 10% de descuento en tu próximo smartphone" crlf)   
    )
)


;7. Cliente, Por nuestro convenio con X banco
(defrule r7
    (cliente (cliente-id ?cliente) (nombre ?nombre) (tarjeta-id ?tarjeta) (cliente-nuevo 0))
    (tarjeta (tarjeta-id ?tarjeta) (banco HSBC))
    =>
    (printout t "Esos son aliados " ?nombre ", nuestro negocio mantiene un convenio con HSBC por lo que en tus próximas compras con tarjeta de crédito tendrás 8% de descuento" crlf)
)


;8. Compra de cualquier cosa, con tarjeta de crédito del banco con convenio
(defrule r8
    (orden (orden-id ?orden) (cliente-id ?cliente) (metodo-pago "Tarjeta de crédito") (tipo-compra Crédito))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (tarjeta-id ?tarjeta) (cliente-nuevo 0))
    (tarjeta (tarjeta-id ?tarjeta) (banco HSBC))
    =>
    (printout t ?nombre " tu órden " ?orden " recibe un 8% de descuento por haber utilizado la tarjeta de crédito proporcionada por nuestros socios de HSBC" crlf)
)


;9. No cuentas con tarjeta te ofrecemos tramites la del banco con la que tenemos convenio y unos descuentos
(defrule r9
    (cliente (cliente-id ?cliente) (nombre ?nombre) (tarjeta-id ?tarjeta))
    (test (eq ?tarjeta nil))
    ;(not (cliente (cliente-id ?cliente) (nombre ?nombre) (tarjeta-id ?tarjeta) (cliente-nuevo 0)))
    =>
    (printout t ?nombre " te invitamos a que crees una cuenta con nuestros colaboradores de HSBC y puedas sacar la tarjeta que más desees para que recibas beneficios como descuentos" crlf)
)


;10. Más de 10 accesorios 
(defrule r10
    (orden (orden-id ?orden) (cliente-id ?cliente))
    (line-item (orden-id ?orden) (accesorio-id ?accesorio) (cantidad ?cantidad))
    (accesorio (accesorio-id ?accesorio) (descripcion ?descripcion))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (cliente-nuevo 0))
    =>
    (if (> ?cantidad 10) then
        (printout t "Eso tiene que pesar! " ?nombre ", en tu próxima compra 50% de descuento en el envío" crlf)
    )
)


;11. No tienes compras e incentivar para que empiece a comprar
(defrule r11
    (cliente (cliente-id ?cliente) (nombre ?nombre) (compras-realizadas ?compras))
    (not (orden (orden-id ?orden) (cliente-id ?cliente)))
    =>
    (printout t "No tienes compras realizadas " ?nombre ", te ofrecemos 5% de descuento en tu primera compra" crlf)
)


;12. Si fue compra superior a 250,000 envio gratis
(defrule r12
    (orden (orden-id ?orden) (cliente-id ?cliente) (total ?total))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (cliente-nuevo 0))
    =>
    (if (> ?total 250000) then
        (printout t ?nombre ", tu compra supera los $250,000 correspondiente a la orden " ?orden ", para mayor seguridad y comodidad te ofrecemos envío gratis" crlf)
    )
)


;13. Ofrecer vales por incluir en su compra una computadora específica
(defrule r13
    (orden (orden-id ?orden) (cliente-id ?cliente) (total ?total))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (cliente-nuevo 0))
    (line-item (orden-id ?orden) (computadora-id ?computadora) (total ?totalL) (cantidad ?cantidad))
    (computadora (computadora-id ?computadora) (marca Acer) (modelo "Aspire 5"))
    =>
    (bind ?vales (integer (/ ?total 3000)))
    (bind ?vales (* ?vales 100))
    (printout t ?nombre ", por haber comprado computadora Acer Aspire 5 te ofrecemos " ?vales " pesos en vales correspondientes a 100 pesos en vales por cada 3000 pesos en tu orden " ?orden crlf)
)


;14. Al comprar una computadora habrá una probabilidad de 5% de que le ofrezcan descuento en una funda, descuento ofrecido de manera aleatoria
(defrule r14
    (orden (orden-id ?orden) (cliente-id ?cliente))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (cliente-nuevo 0))
    (line-item (orden-id ?orden) (computadora-id ?computadora))
    (computadora (computadora-id ?computadora) (marca ?marca) (modelo ?modelo)) 
    =>
    (bind ?random (random 1 20))
    (if (< ?random 2) then
        (printout t ?nombre", es tu día de suerte, la tienda te ofrece un 15% de descuento en la compra de una Funda para portátil por comprar " ?marca " " ?modelo " en tu orden " ?orden crlf)
    )
)


;15. Si tiene más de 5 años de antigüedad
(defrule r15 
    (cliente (cliente-id ?cliente) (nombre ?nombre) (ingreso ?ingreso) (cliente-nuevo 0))
    =>
    (bind ?anio-cliente (string-to-field (sub-string 1 4 ?ingreso)))
    (bind ?anio-actual (nth$ 1 (local-time)))
    (bind ?anios (- ?anio-actual ?anio-cliente))
    (if (>= ?anios 5) then
        (printout t "Muchas gracias " ?nombre " por estar con nosotros más de 5 años, como agradecimiento llévate unos auriculares de regalo" crlf)
    )
)


;16. Si hoy es su cumpleaños
(defrule r16
    (cliente (cliente-id ?cliente) (nombre ?nombre) (nacimiento ?nacimiento) (cliente-nuevo 0))
    =>
    (bind ?mes-cliente (string-to-field (sub-string 6 7 ?nacimiento)))
    (bind ?dia-cliente (string-to-field (sub-string 9 10 ?nacimiento)))
    (bind ?mes-actual (nth$ 2 (local-time)))
    (bind ?dia-actual (nth$ 3 (local-time)))
    (if (= ?dia-cliente ?dia-actual) then
        (if (= ?mes-cliente ?mes-actual) then
            (printout t "Feliz cumpleaños " ?nombre ", como regalo 40% de descuento en la primera compra que realices hoy" crlf)
        )
    )
)


;17. 24 meses sin intereses, iPhone 15 a crédito con tarjeta Santander
(defrule r17
    (orden (orden-id ?orden) (cliente-id ?cliente) (tipo-compra Crédito))
    (line-item (orden-id ?orden) (smartphone-id ?smartphone))
    (smartphone (smartphone-id ?smartphone) (marca Apple) (modelo "iPhone 15"))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (tarjeta-id ?tarjeta) (cliente-nuevo 0))
    (tarjeta (tarjeta-id ?tarjeta) (banco Santander))
    =>
    (printout t ?nombre", la tienda te ofrece 24 meses sin intereses por comprar iPhone 15 correspondiente a la orden " ?orden crlf)
)


;18. Oferta 2x1 a cliente más activo
(defrule r18
    (cliente (cliente-id ?cliente) (nombre ?nombre) (compras-realizadas ?compras) (articulos-comprados ?max-articulos) (cliente-nuevo 0))
    (not (cliente (articulos-comprados ?articulos&:(> ?articulos ?max-articulos))))
    =>
    (printout t "Wow " ?nombre " eres nuestro cliente más activo, como agradecimiento 2x1 en la compra de cualquier accesorio" crlf)
)


;19. Ofrecer 5x4 a mayoristas cabrones
(defrule r19
    (cliente (cliente-id ?cliente) (nombre ?nombre) (compras-realizadas ?compras) (articulos-comprados ?articulos) (cliente-nuevo 0))
    =>
    (bind ?promedio (/ ?articulos ?compras))
    (if (> ?promedio 6) then
        (printout t "Vemos que te encanta comprar por montones " ?nombre ", te ofertamos 5x4 en la compra de cualquier producto del mismo tipo" crlf)
    )
)


;20. Si compra iphone y mac decirle mamador y regalarle un cargador usb tipo c
(defrule r20
    (orden (orden-id ?orden) (cliente-id ?cliente))
    (line-item (orden-id ?orden) (smartphone-id ?smartphone))
    (line-item (orden-id ?orden) (computadora-id ?computadora))
    (smartphone (smartphone-id ?smartphone) (marca Apple) (modelo "iPhone 15"))
    (computadora (computadora-id ?computadora) (marca Apple) (modelo "MacBook Air"))
    (cliente (cliente-id ?cliente) (nombre ?nombre) (cliente-nuevo 0))
    =>
    (printout t "No cualquiera puede darse esos lujos " ?nombre ", en tu compra de productos marca Apple correspondientes a la orden " ?orden " llévate de regalo un cargador USB tipo C" crlf)
)
