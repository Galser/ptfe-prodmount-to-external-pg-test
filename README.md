# ptfe-prodmount-to-external-pg-test
Repository to test  ticket 29768 , ptfe migrate from mounted disk with PG 9.5.19 to an external services with PG 9.6.

This is heavily based on repo : https://github.com/Galser/ptfe-prodmount-vc-cloud 

No detailed instruction in the top-level readme as they had been moved to [ notes here](notes.md)


# TODO

# DONE
- [x] Import/clone old `ptfe-prodmount` repo
- [x] Deploy
- [X] Make backup from internal PostGres
- [X] Flush everything on instance
- [X] Create new RDS PGSQL with version 9.6
    - psql --version
      psql (PostgreSQL) 9.5.22
- [X] Reinstall TFE with THAT PGSQL 
- [X] Test TFE
    
