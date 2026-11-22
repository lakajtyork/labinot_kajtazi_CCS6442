#!/bin/sh

while true; do
  
  pg_isready -q -h postgres -p 5432 -U "$POSTGRES_USER"
  RESPONSE=$?

  case $RESPONSE in
    0)
      echo "Database is ready and accepting connections!"
      exit 0
      ;;
    1)
      echo "Database is not accepting connections!"
      ;;
    2)
      echo "No response from database - not reachable!"
      ;;
    3)
      echo "Configuration error!"
      exit 1
      ;;
    *)
      echo "Unknown status code - ($RESPONSE)!"
      ;;
  esac

  sleep 2
done