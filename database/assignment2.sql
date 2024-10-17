
--Insert the following new record to the account table Note: The account_id and account_type fields should handle their own values and do not need to be part of this query.:
-- Tony, Stark, tony@starkent.com, Iam1ronM@n
INSERT INTO public.account (account_firstname, account_lastname, account_email, account_password)
VALUES ('Tony', 'Stark', 'tony@starkent.com', 'Iam1ronM@n');

--Modify the Tony Stark record to change the account_type to "Admin".
UPDATE public.account
SET account_type = 'Admin'
WHERE account_firstname = 'Tony' AND account_lastname = 'Stark';

--Delete the Tony Stark record from the database.
DELETE FROM public.account
WHERE account_firstname = 'Tony' AND account_lastname = 'Stark';

-- Modify the "GM Hummer" record to read "a huge interior" rather than "small interiors" using a single query. Explore the PostgreSQL Replace function Do NOT retype the entire description as part of the query.. It needs to be part of an Update query as shown in the code examples of the SQL Reading - Read Ch. 1, section 3.
UPDATE public.inventory
SET inv_description = REPLACE(inv_description, 'small interiors', 'a huge interior')
WHERE inv_make = 'GM' AND inv_model = 'Hummer';


-- Use an inner join to select the make and model fields from the inventory table and the classification name field from the classification table for inventory items that belong to the "Sport" category. These resources may help you: https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-joins/. Two records should be returned as a result of the query.
SELECT 
    i.inv_make AS make, 
    i.inv_model AS model, 
    c.classification_name AS classification
FROM 
    public.inventory i
INNER JOIN 
    public.classification c ON i.classification_id = c.classification_id
WHERE 
    c.classification_name = 'Sport';


-- Update all records in the inventory table to add "/vehicles" to the middle of the file path in the inv_image and inv_thumbnail columns using a single query. This reference may prove helpful - https://www.postgresqltutorial.com/postgresql-string-functions/postgresql-replace/. When done the path for both inv_image and inv_thumbnail should resemble this example: /images/vehicles/a-car-name.jpg
UPDATE public.inventory
SET 
    inv_image = REPLACE(inv_image, '/images/', '/images/vehicles/'),
    inv_thumbnail = REPLACE(inv_thumbnail, '/images/', '/images/vehicles/');


--When done with the six queries, copy and paste queries 4 and 6 from the assignment 2 file to the database rebuild file, at the bottom of that file (this is the file that you began in the Team Activity that contains the SQL to create your database and the tables in it). Make sure these two queries are the last thing to run when the rebuild file is complete. By the end you should have two files - one with the 6 queries from Task 1, and the second with all the queries to rebuild your database, along with copies of the 4th and 6th queries from Task 1.