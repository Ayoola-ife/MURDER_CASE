# MURDER_CASE
THE MYSTERY MURDER CASE
A crime has taken place and the detective needs your help. The detective gave you the crime scene report, but you somehow lost it. You vaguely remember that the crime was a murder that occurred sometime on Jan.15, 2018 and that it took place in SQL City.
We are given 3 important pieces of information: What? A murder. When? January 15, 2018. Where? SQL City. However, before we can start querying our way to the killer, we need to know a little more about the structure of the SQLite database.
The Investigation
We are now ready to start our official investigation. Our first step: let’s take a look at the crime scene report
Crime Scene Report
Based on the structure of the crime_scene_report table, we are interested in the description of the crime. Thankfully, we know the date, type, and city of the crime so we should be able to filter in order to get only useful data.
We found the crime scene report! We now know that we should be looking for 2 witnesses. One living at the last house on Northwestern Dr, and Annabel living on Franklin Avenue. Our next step: looking at those witnesses’ interviews to learn what they saw.
Witness Interview
Based on the interview table structure, we will need to know our witnesses’ person_id in order to find their transcript. According to the schema, the person_id can also be found as id in the person table. Since the person table also includes information about names and addresses, we should be able filter the data to find our witnesses. Let’s start by finding Annabel’s id.
This query taught us that Annabel’s id is 16371.
Let’s look for our second witness, living at the last house on Northwestern Dr. This query taught us that our second witness is Morty Schapiro, whose id is 14887.
Now that we have the ids, we can look for the interview transcripts.This query taught us that Annabel saw the murder happen. And that the killer is a gym member who came in on January 9, 2018. This query confirms that the killer is a gym member, a gold member. Morty also gives us a murder weapon: a gun, a partial membership number: ‘48Z’, and license plate: ‘H42W’. Finally, we now know that the killer is male. Our investigation is leading us to the gym!
By combining Annabel’s gym check-in date and Morty’s partial gym membership id and membership status, we should be able to obtain the killer’s full membership id. We can then match this membership id to a name!
Two members with ids starting with ‘48Z’ checked-in on January 9th. We can use information from the get_fit_now_member table to narrow down our list of suspects.
It seems like both of our suspects are gold members so we cannot find out who did it based on membership status. However we now have names: Joe Germuska and Jeremy Bowers. We can use those to find their license plates and see if any of them match Morty’s description.
We can use the person table to match our names to a license id number. The license id number can then be used as id in the drivers_license table to look up the license plate number.
It seems like only Jeremy Bowers has a car registered, and his license plate matches Morty’s description. We found our killer, Jeremy Bowers!

Congrats, you found the murderer! But wait, there’s more… If you think you’re up for a challenge, try querying the interview transcript of the murderer to find the real villain behind this crime. If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries.

The Man Behind the Killer
It seems like our killer may have been taking orders from someone. Let’s see what he has to say. Based on the result from our gym membership query, we know Jeremy Bowers’ person_id: 67318. This should be all we need to pull up his interview transcript.
Jeremy just gave us a lot of information about his boss. We know she is a female, between 65" and 67", with red hair and a Tesla Model S. We also know she attended the SQL Symphony Concert 3 times in December 2017.
YES! The culprit behind the assignation is  Miranda Priestly. Our investigation is now complete.
	
