# dhis2-ac

This repository is designed to stand up a test [DHIS2 Instance](https://github.com/dhis2/dhis2-core#run-dhis2-in-docker) using Docker on an EC2 VM instance in AWS. It stands it up using the [Sierra Leone] demo data set.

*IT IS NOT PRODUCTION-READY AND SHOULD BE TREATED AS POTENTIALLY VULNERABLE*

## Instructions

* Clone this repo locally.

* Copy `.envrc.template` to `.envrc`, populate. Source using [direnv](https://direnv.net/)

* Run `make terraform`.

* Run `make ansible`.

* Apply [this workaround](https://community.dhis2.org/t/how-do-i-solve-this-issue-error-on-log-in/54071/3) (eventually we may automate this away using playwright).
