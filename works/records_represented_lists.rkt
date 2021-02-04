#lang eopl
;;;; CONSTRUCTORES

;; REGISTRO
(define r-vacio
  (lambda ()
    '(r-vacio))
  )

(define r-novacio
  (lambda (item reg)
    (list 'r-novacio item reg))
  )


;;ITEM
(define itemElm
  (lambda (key dato)
    (list 'itemElm key dato))
  )


;;DATO
(define datoElm
  (lambda (elemento)
    (list 'datoElm elemento))
  )



;;lnumero
(define lnumvacia
  (lambda ()
    (list 'lnumvacia )) )
(define lnumnovacia
  (lambda (num lst)
    (list 'lnumnovacia num lst ))
  )



;;lsimbolo
(define lsymvacia
  (lambda ()
    (list 'lsymvacia )))

(define lsymnovacia
  (lambda (sym lst)
    (list 'lsymvacia sym lst )))




;;; OBSERVADOR

;Registro
(define r-vacio?
  (lambda (lst)
    (cond
      [(null? lst) #f]
      [else (eqv?(car lst) 'r-vacio) ])))

(define r-novacio?
  (lambda (lst)
    (cond
      [(null? lst) #f]
      [else (eqv?(car lst) 'r-novacio) ])))

;item
(define itemElm?
  (lambda (lst)
    (cond
      [(null? lst) #f ]
      [else (eqv? (car lst) 'itemElm)])))

;dato
(define datoElm?
  (lambda (lst)
    (cond
      [(null? lst) #f ]
      [else (eqv? (car lst) 'datoElm)])))

;lnum
(define lnumvacia?
  (lambda (lst)
    (cond
      [(not (list? lst)) #f]
      [(null? lst) #f ]
      [else(eqv? (car lst) 'lnumvacia)])))

(define lnumnovacia?
  (lambda (lst)
    (cond
      [(not (list? lst)) #f]
      [(null? lst) #f ]
      [else (eqv? (car lst) 'lnumnovacia)])))

;lsym
(define lsymvacia?
  (lambda (lst)
    (cond
      [(not (list? lst)) #f]
      [(null? lst) #f ]
      [else (eqv? (car lst) 'lsymvacia)])))

(define lsymnovacia?
  (lambda (lst)
    (cond
      [(not (list? lst)) #f]
      [(null? lst) #f ]
      [else (eqv? (car lst) 'lsymnovacia)])))


;;; EXTRACTORES

;; resgistro
(define r-novacio->item
  (lambda (lst)
    (cadr lst)))

(define r-novacio->reg
  (lambda (lst)
    (caddr lst)))

;; item

(define itemElm->key
  (lambda (lst)
    (cadr lst)))

(define itemElm->dato
  (lambda (lst)
    (caddr lst)))

;; dato

(define datoElm->elemento
  (lambda (lst)
    (cadr lst))
  )

;; lnumero

(define lnumnovacia->num
  (lambda (lst)
    (cadr lst)))

(define lnumnovacia->lst
  (lambda (lst)
    (caddr lst)))

;; lsimbolo

(define lsymnovacia->sym
  (lambda (lst)
    (cadr lst)))

(define lsymnovacia->lst
  (lambda (lst)
    (caddr lst)))


;;;;;;;;;;;;;;; FUNCIONES

;; Buscar llave
;; buscar-llave: resgistro * symbol -> dato
;; retorna el valor asociado a una llave buscado

(define buscar-llave
  (lambda (registro key)
    (cond
      [(r-vacio? registro ) (eopl:error "Key don't exist")]
      [(eqv? (itemElm->key(r-novacio->item registro)) key )
       (itemElm->dato(r-novacio->item registro))]
      [else (buscar-llave (r-novacio->reg registro) key) ]
      ))
  )

;;  Buscar Lista
;; buscar-listas: registo -> listas de listas
;; retorna una lista de listas que contienen todos los elementos que son listas 

(define buscar-listas
  (lambda (registro )
    (cond
      [(r-vacio? registro ) '()]
      [(or(or (lnumvacia? (datoElm->elemento (itemElm->dato(r-novacio->item registro))) )
              (lnumnovacia? (datoElm->elemento (itemElm->dato(r-novacio->item registro))) )
              )
          (or (lsymvacia? (datoElm->elemento (itemElm->dato(r-novacio->item registro))) )
              (lsymnovacia? (datoElm->elemento (itemElm->dato(r-novacio->item registro))) )
              ))
       
       (append (list (datoElm->elemento (itemElm->dato(r-novacio->item registro))))
               (buscar-listas (r-novacio->reg registro)))]
      [else (buscar-listas (r-novacio->reg registro)) ]
      )
    ))


;;  Buscar noLista
;; no registo -> listas de elementos
;; retorna una lista de elementos que nos son listas

(define buscar-nolistas
  (lambda (registro )
    (cond
      [(r-vacio? registro ) '()]
      [(or(or (lnumvacia? (datoElm->elemento (itemElm->dato(r-novacio->item registro))) )
              (lnumnovacia? (datoElm->elemento (itemElm->dato(r-novacio->item registro))) )
              )
          (or (lsymvacia? (datoElm->elemento (itemElm->dato(r-novacio->item registro))) )
              (lsymnovacia? (datoElm->elemento (itemElm->dato(r-novacio->item registro))) )
              ))
       (buscar-nolistas (r-novacio->reg registro))
       ]
      [else (append (list (datoElm->elemento (itemElm->dato(r-novacio->item registro))))
               (buscar-nolistas (r-novacio->reg registro))) ]
      )
    ))

;;;;;;;;;;;;;; VARIABLES


(define registro1
  (r-novacio
   (itemElm 'asdf (datoElm 2))
   (r-novacio
    (itemElm 'cop (datoElm (lnumnovacia 2 (lnumvacia))))
    (r-vacio))))


(define registro2
  (r-novacio
   (itemElm 'a (datoElm 2))
   
   (r-novacio
    (itemElm 'b (datoElm 's))

    (r-novacio
     (itemElm 'c (datoElm (lnumvacia)))

     (r-novacio
      (itemElm 'd (datoElm (lnumnovacia 2 (lnumnovacia 3 ( lnumnovacia 4  (lnumvacia))))))
      
      (r-novacio
       (itemElm 'e (datoElm (lsymvacia)))
       
       (r-novacio
        (itemElm 'f (datoElm (lsymnovacia 'k (lsymnovacia 's (lsymnovacia 'r (lsymvacia ) ) ))))

        (r-vacio)
        )
       )
      )
     )
    )
   )
  )
