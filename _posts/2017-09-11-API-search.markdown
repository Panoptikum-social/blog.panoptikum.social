---
layout: post
title:  "API Full Text Search"
date:   2017-09-11 06:00:00 +0200
author: Sonja
---

Now available: full text search via the Panoptikum [API](https://blog.panoptikum.social/api/).

Last week we proudly presented the basic implementation of the API and promised that search and top 10 lists will follow.

With the full text search your program can search in the categories, podcasts, episodes and personas.
* Let's say you want to search for all personas with the name Sonja, then your request would be [https://panoptikum.social/jsonapi/search?filter[persona]=Sonja](https://panoptikum.social/jsonapi/search?filter[persona]=Sonja).
* If you want to find episodes including the term coding the request would look like this [https://panoptikum.social/jsonapi/search?filter[episode]=coding](https://panoptikum.social/jsonapi/search?filter[episode]=coding).

Three top 10 lists are available via the API
* 10 most liked podcasts ordered by like count descending  [https://panoptikum.social/jsonapi/podcasts/most_liked](https://panoptikum.social/jsonapi/podcasts/most_liked)
* 10 most subscribed podcasts ordered by subscription count descending  [https://panoptikum.social/jsonapi/podcasts/most_subscribed](https://panoptikum.social/jsonapi/podcasts/most_subscribed)
* last updated podcasts (paginated - you define the number, default is 10)  [https://panoptikum.social/jsonapi/podcasts/last_updated](https://panoptikum.social/jsonapi/podcasts/last_updated)"

The API adheres to [json:api](https://jsonapi.org/) standards. Please check out the [documentation](https://blog.panoptikum.social/api/) for details. As always your feedback is welcome! Send it to <stefan@panoptikum.social>.

Latest news for the Phoenix friends among us: Stefan updated to Phoenix 1.3 this week.
