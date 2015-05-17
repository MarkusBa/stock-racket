#lang racket
(require net/url)

(define url2 "http://ichart.yahoo.com/table.csv?s=BAS.DE&a=0&b=1&c=2000&d=0&e=31&f=2010&g=w&ignore=.csv")

(call/input-url (string->url url2)
                get-pure-port
                port->string)