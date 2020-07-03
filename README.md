# ptfe-prodmount-to-external-pg-test
Repository to test  ticket 29768 , ptfe migrate from mounted disk with PG 9.5.19 to an external services with PG 9.6.


# TODO

 - [ ] Reinstall TFE with THAT PGSQL 
 - [ ] Test TFE


# DONE
- [x] Import/clone old `ptfe-prodmount` repo
- [x] Deploy
- [X] Make backup from internal PostGres
- [X] Flush everything on instance
- [X] Create new RDS PGSQL with version 9.6
    - psql --version
      psql (PostgreSQL) 9.5.22
    
