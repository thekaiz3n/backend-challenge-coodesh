# Backend Challenge  2022 - Covid Daily cases
> This is a challenge by Coodesh   

This project provide a API that return data referent a covid cases in several countrys.

This is the data available:

- **[GET] /** : Return a status 200. With the message: Backend Challenge  2022 - Covid Daily cases
- **[GET] /cases/:date/count** : Return a list of all cases based in the selected day, grouped by country and separated by variant. 
- **[GET] /cases/:date/cumulative** : Return a list of all cases based in the selected day, returning the sum of cases in the selected day, grouped by country and separated by variant. 
- **[GET] /:date** : Return all dates in the database.

## Database
The data used is found in this link: https://challenges.coode.sh/covid/data/covid-variants.csv

## Technologies
- ruby v.3.1.1
- rails v.7.0.3
- MongoDB Atlas

## Instructions

### Docker
This project use the MongoDB Atlas.
```bash
docker run -p 3001:3000 -e "MONGODB_URI=mongodb+srv://<username>:<password>@<yourcluster>.mongodb.net/covidcases?retryWrites=true&w=majority" rails_app .
```
### Local
To run local, is necessary edit the file **config/mongoid.yml** and add the local database.