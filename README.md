# ptfe-prodmount-to-external-pg-test
Repository to test  ticket 29768 , ptfe migrate from mounted disk with PG 9.5.19 to an external services with PG 9.6.


# TODO

 - [ ] Flush everything on instance
 - [ ] Create new RDS PGSQL with version 9.6
 - [ ] Reinstall TFE with THAT PGSQL 
 - [ ] Test TFE


# DONE
- [x] Import/clone old `ptfe-prodmount` repo
- [x] Deploy
- [X] Make backup from internal PostGres
  
