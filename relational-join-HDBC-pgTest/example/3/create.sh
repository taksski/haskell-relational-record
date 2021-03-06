#! /bin/sh

create_setA_table='
CREATE TABLE EXAMPLE3.set_a (
 seq  INTEGER NOT NULL,
 name VARCHAR(30) NOT NULL,

 PRIMARY KEY(seq)
)
'

create_setB_table='
CREATE TABLE EXAMPLE3.set_b (
 seq  INTEGER NOT NULL,
 name VARCHAR(30) NOT NULL,

 PRIMARY KEY(seq)
)
'

set -x

psql -c "CREATE SCHEMA EXAMPLE3" testdb
psql -c "$create_setA_table" testdb
psql -c "$create_setB_table" testdb

insert() {
	psql -c "INSERT INTO EXAMPLE3.set_$1 (seq, name) VALUES ($2, '$3')" testdb
}

insert a 1 'Apple'
insert a 2 'Orange'
insert a 5 'Banana'
insert a 6 'Cherry'

insert b 2 'Orange'
insert b 6 'Cherry'
insert b 7 'Melon'
