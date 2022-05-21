Scrape predictions of next passes of the given satellite from amsat.org website

1. Get available satellites at www.amsat.org/track/api/v1/passes.php?objects or view the options for the satellite selection on https://www.amsat.org/track/

2. Run **track.sh**
```sh
chmod +x track.sh
./track.sh <grid square> <satellite>
```

Output can be redirected to a file to import into an application
```sh
./track.sh <grid square> <satellite> >prediction.csv
```

After importing into Calc, set date format:
- select column 1 by clicking on 'A'
- go to menu Data -> Text to Columns...
- click on 'Standard' and then from 'Column Type' drop-down list select 'Date (DMY)' and click 'OK'
