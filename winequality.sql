/*sub queries in sql*/
select * from winered;
/*changing column names due to spaces*/
ALTER TABLE winered
MODIFY COLUMN sugarresidue float;
alter table winered change `free sulfur dioxide` freesulfur int;
alter table winered change `total sulfur dioxide` totalsulfur int;
alter table winered change `citric acid` citricacid int;
alter table winered change `volatile acidity` volatileacidity float;
alter table winered change `fixed acidity` fixedacidity int;


/* 1.Find the wine with the maximum alcohol content, and display all its details.*/
select *from winered where alcohol =(select max(alcohol) from winered );
/*2. Retrieve the wines where residual sugar is greater than the average residual sugar of all wines.*/
select sugarresidue from winered where sugarresidue>(select avg(sugarresidue)from winered );

/*3. List the wines with a quality equal to the highest quality in the dataset.*/
select * from winered where quality=(select max(quality) from winered );

/* Display the details of wines whose total sulfur dioxide is lower than the average total sulfur dioxide 
for wines with a quality of 6.*/
select * from winered where totalsulfur <(select avg(totalsulfur) from winered );

/*end */

/* Calculate the total free sulfur dioxide for each quality, but display
only those with a total greater than 50.*/

select quality,sum(freesulfur) as sumofsulpur from winered group by quality 
having sum(freesulfur) > 50;



/*Find the average density for each wine quality, but only display results 
where the average density is above 0.997.*/
select quality,avg(density) from winered group by quality having avg(density)>0.997;


