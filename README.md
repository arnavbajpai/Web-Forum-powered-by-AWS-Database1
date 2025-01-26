# Web Forum Powered by AWS: Database

This repository contains database schema and test data for the [Web Forum Powered by AWS](https://github.com/arnavbajpai/Common-Repository-for-Web-Forum-Project) Project. It uses MySQL databse that can be deployed locally or as RDS service on AWS. 

## Related Repositories
- [Common Repository](https://github.com/arnavbajpai/Common-Repository-for-Web-Forum-Project): Parent repository containing overview and architecture for the overall project.  
- [Backend Repository](https://github.com/arnavbajpai/Web-Forum-powered-by-AWS-Backend-REST-API): Go based REST API deployed as Lambda function and exposed via AWS API Gateway.  
- [Frontend Repository](https://github.com/arnavbajpai/Web-Forum-powered-by-AWS-Frontend): Built with React.js and hosted on AWS S3.

## Deployment

### Local Setup
Follow the instructions for MySQL installation for your OS given [here](https://dev.mysql.com/downloads/installer/).

### AWS specific steps 
- Step 1: Navigate to the RDS Console in your AWS account.
- Step 2: Click Create database and select: Standard create.  Under Engine options, select MySQL.  Choose the version (e.g., 8.0).
- Step 3: Configure the database instance: Set the DB instance class to db.t3.micro. Multi-AZ is optional for testing.
- Step 4: Configure the storage: Use General Purpose (SSD) for the storage type.  Allocate sufficient storage, such as 20 GB.
- Step 5: Set up the connectivity: Please ensure the following: 
  1. The RDS instance is in a private subnet. 
  2. It should be in the same subnet as the lambda function for REST API (see instructions [here](https://github.com/arnavbajpai/Web-Forum-powered-by-AWS-Backend-REST-API)) 
  3. The security group attached to the RDS instance should have an allow inbound rule for lambda function security group
- Step 6: Set the database authentication: Provide a Master username and password for the database.
- Step 7: Click Create database and wait for the RDS instance to become available.

### Adding Schema and Test Data
- Step 1:  Clone this repository to your local machine.
- Step 2:  Navigate to the `./script` directory.
- Step 3:  Run the configuration script  available [here](https://github.com/arnavbajpai/Web-Forum-powered-by-AWS-Database1/script/DbConfig.sql) to create and initialize the database schema.
- Step 4:  Use the test script available [here](https://github.com/arnavbajpai/Web-Forum-powered-by-AWS-Database1/Test/test-data.sql) to configure test data into database.
