#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Si no hay argumento, salir
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

# Buscar el elemento
ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number::text = '$1' OR symbol = '$1' OR name = '$1'")
