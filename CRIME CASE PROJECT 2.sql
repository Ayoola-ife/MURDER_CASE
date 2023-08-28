A crime has taken place and the detective needs your help. The detective gave you the crime scene report, but you somehow lost it. You vaguely remember that the crime was a murder that occurred sometime on Jan.15, 2018 and that it took place in SQL City. Start by retrieving the corresponding crime scene report from the police department’s database.
-- first, let's take a look at what the crime full description of the crime having in mind the type of case, date of occurence and the city.
select description
from crime_scene_report
where date = '20180115' and city = 'SQL City' and type = 'murder';

--After looking at the description of murder, we saw that 2 witnesses gave report on the case. Now, we need to get the full details of these 2 witnesses
SELECT *
FROM person
WHERE name like 'Annabel%' and address_street_name = 'Franklin Ave'
--lets look for the details of the other witness that stays on  the last house at Northern Dr
select *
from person
where address_street_name = 'Northwestern Dr'
order by address_number desc
limit 1
-- Lets check the report of these witnesses we just found their details
select transcript
from interview
where person_id like '16371' or person_id like '14887'

--The query above gave us hint on the interview that was carried out on Annabel and Morty. Annabel recognized the killer as a man from her gym during her workout on the 9th of January. While Morty saw a man run out of the victim's apartment holding a gym bag that usually belong to gold members with membership id starting with '48Z' and his car plate number included'h42w'
-- lets  query the leads we got from the interview query. So we will check the gym details of the gold members who worked out on the 9th of January and also with membership id as stated in the interview with the witness
select *
from get_fit_now_check_in
where membership_id like '48Z%' and check_in_date = '20180109'
-- from the query, we can see that there were 2 members that worked out on that date. we need to see their membership status to know whether they are gold members of the gym
select *
from get_fit_now_member
where id = '48Z55' or id = '48Z7A' and membership_status = 'gold'
-- Now we have the names of the gold members that worked out in the get fit gym on that stated date. so, we have to join these names to the license id table to get the plate_number hinted from the interview with morty. I believe this last query with lead us to who the killer is.
select p.name, d.plate_number
from person as p
join drivers_license as d
on p.license_id = d.id
where p.name = 'Joe Germuska' or p.name = 'Jeremy Bowers'
-- WE HAVE THE KILLER;
