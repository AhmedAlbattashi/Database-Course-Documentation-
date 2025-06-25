CREATE DATABASE MonitoringSystemDatabase;

use MonitoringSystemDatabase

CREATE TABLE Servers ( 
server_id INT PRIMARY KEY, 
server_name VARCHAR(50), 
region VARCHAR(50) 
); 

INSERT INTO Servers VALUES 
(1, 'web-server-01', 'us-east'), 
(2, 'db-server-01', 'us-east'), 
(3, 'api-server-01', 'eu-west'), 
(4, 'cache-server-01', 'us-west'); 

CREATE TABLE Alerts ( 
alert_id INT PRIMARY KEY, 
server_id INT, 
alert_type VARCHAR(50), 
severity VARCHAR(20) 
);
INSERT INTO Alerts VALUES 
(101, 1, 'CPU Spike', 'High'), 
(102, 2, 'Disk Failure', 'Critical'), 
(103, 2, 'Memory Leak', 'Medium'), 
(104, 5, 'Network Latency', 'Low'); -- Invalid server_id (edge case) 

CREATE TABLE AI_Models ( 
model_id INT PRIMARY KEY, 
model_name VARCHAR(50), 
use_case VARCHAR(50) 
);

INSERT INTO AI_Models VALUES 
(201, 'AnomalyDetector-v2', 'Alert Prediction'), 
(202, 'ResourceForecaster', 'Capacity Planning'), 
(203, 'LogParser-NLP', 'Log Analysis'); 

CREATE TABLE ModelDeployments ( 
deployment_id INT PRIMARY KEY, 
server_id INT, 
model_id INT, 
deployed_on DATE 
);

INSERT INTO ModelDeployments VALUES 
(301, 1, 201, '2025-06-01'), 
(302, 2, 201, '2025-06-03'), 
(303, 2, 202, '2025-06-10'), 
(304, 3, 203, '2025-06-12'); 

select * from Alerts
select * from Servers
select * from AI_Models
select * from ModelDeployments

--Task 1: 
select alert_type , server_name
from Alerts A , servers S
where A.server_id = S.server_id

-- Task 2: 
select server_name , alert_type
from Servers S
left join Alerts A on A.server_id = S.server_id



--Task 3 : 
select server_name , alert_type
from Servers S
right join Alerts A on A.server_id = S.server_id

-- task 4 :

select alert_type , server_name
from Servers S 
FULL OUTER JOIN Alerts A on S.server_id = A.server_id

-- task 5 :

select model_name , server_name
from AI_Models AI
CROSS JOIN Servers 

-- task 6 :

select alert_type , severity , server_name
from Alerts A
INNER JOIN Servers S on A.server_id = S.server_id
where a.severity = 'Critical'; 

--task 7 :

select server_name
from Servers S
LEFT JOIN ModelDeployments M on S.server_id = M.server_id
where M.model_id  is null


-- task 8 :
select server_name , region , model_name
from Servers S
cross join AI_Models M
where S.region = 'eu-west';