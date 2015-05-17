#lang racket
(require net/url)
(require net/url-structs)
(require db)

(define url2 "http://ichart.yahoo.com/table.csv?s=BAS.DE&a=0&b=1&c=2000&d=0&e=31&f=2010&g=w&ignore=.csv")

(call/input-url (string->url url2)
                get-pure-port
                port->string)
  
(define bla (string->url url2)) 
(url-query bla)
(define blup (struct-copy url bla [query '((s . "BLUP")(a . "0"))]))
  
(define pgc
    (postgresql-connect #:user "markus"
                        #:database "stock"
                        #:password "xxxx"))

(define (get-items id)
  (query-rows pgc
            "select * from item where idplayer = $1" id))