# STEP 0

``` gem install hunting_season ```

# STEP 1 

Head to Product Hunt, search for whatever topic you'd like scrape for.

# STEP 2

Now, scroll to the bottom a bunch of times so that the page shows all of the posts associated with your topic.

# STEP 3

Open up your developer console in the browser on the page you've just gotten to show all of the posts available 
on and copy/paste <code>JSON.stringify($$('[data-test^=post-item]').map(el => el.getAttribute('data-test')).map(x=>x.split('-')).map(x=>x[2]).map(x=>parseInt(x, 10)))</code> into it and hit enter

# STEP 4

You should have something like this show up in your console: 
```
"[80811,80347,80801,80651,80725,80629,80745,80423,80521,80774,80373,80648,80756,80402,80658,80719,80698,80666,80690,80660,80657,80680,80640,80678,80616,80600,80534,80484,80620,80519,80610,80563,80571,45981,80469,80387,80383,80478,80262,80463,80440,80388,80398,80243,80289,80313,80277,80213,78450,80234,80184,80227]"
```

# STEP 5

Now take the Array of ID's and create your 'posts' variable like the one below:

```posts = [73241,80288,79288,72793,72208,75551,77118,74531,73038, ...probably a whole bunch more ID's]```

# STEP 6

Fill out your [dev token](https://www.producthunt.com/v1/oauth/applications) field in the code

# STEP 7

Run script ```$ ruby scraper.rb```

# NOTES

You're going to hit their rate limits, but they refresh every 15 minutes.. 
So, in your terminal, once it chokes, you'll see something like this --> 

```Processing post 63153: Firebase
Current votes for 63153 is 1675 / 1675
Done```

Grab the '63153' bit and find it in your list of ID's in the Array called 'posts'.. 
Remove it and also remove every ID on the left up to that one, so that when you run it 
again you aren't getting the voters through the same posts again.


After you've created your __all_voters.csv__ file, here's a script to grab yourself a list of the 50 heaviest upvoters in your list: 

```cat all_voters.csv | sort | uniq -c | sort | tail -50```

