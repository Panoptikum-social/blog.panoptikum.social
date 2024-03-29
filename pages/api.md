---
title: API
layout: without_sidebar
permalink: api/
---

# API

The API responses adheres to [json:api](http://jsonapi.org) standards. All endpoints are available
without throttling.

## Get public data

Prepend all requests with `https://panoptikum.social/jsonapi`.

All instances in "relationships" can be found with a link and a minimal set of attributes in "included".
You can basically explore the whole API world of Panoptikum by starting at /categories and following
links from there recursively.

path | method | purpose | included
--- | --- | ---
`/categories` | GET | tree of categories | children = subcategories
`/categories/:id` | GET | single category | children, (paginated) podcasts, parent ; podcasts ordered by last episode publishing date descending nulls last
`/podcasts` | GET | list of podcast, paginated, ordered by insertion date descending | categories, languages, engagements & contributors (= personas)
`/podcasts/:id` | GET | single podcast | (paginated) episodes + enclosures, subscription_count, engagements, recommendations, categories, contributors (= personas, follower_count, likes_count, languages, feeds ; ETag
`/podcasts/most_liked` | GET | 10 most liked podcasts ordered by like count descending | -
`/podcasts/most_subscribed` | GET | 10 most subscribed podcasts ordered by subscription count descending | -
`/podcasts/last_updated` | GET | last updated podcasts | paginated
`/languages` | GET | list of languages | -
`/languages/:id` | GET | single language | -
`/engagements/:id` | GET | engagement | persona, podcast
`/personas/` | GET | list of personas | redirect
`/personas/:id` | GET | single persona | redirect, engagements & podcasts, (paginated) gigs & episodes, delegates
`/users/` | GET | list of users | -
`/users/:id` | GET | single user | users_i_like, categories_i_like, depending on preferences: podcasts_i_subscribed, podcasts_i_follow
`/recommendations` | GET | list of recommendations, paginated, order by insertion date descending | episode, podcast, chapter, user
`/recommendations/:id` | GET | single recommendation | user-name, one of: podcast, episode, chapter |
`/recommendations/random` | GET | random recommendation | episode, podcast, category;<br> the episode belongs to that podcast, the podcast belongs to that category
`/feeds/:id` | GET | single feed | podcast, alternate_feed
`/alternate_feeds/:id` | GET | single alternate feed | feed
`/episodes` | GET | list of episodes, paginated, ordered by publishing_date descending | podcast, gigs & contributors (= personas)
`/episodes/:id` | GET | single episode | podcast, chapters, enclosures, recommendations, gigs & contributors (= personas), like_count
`/chapters/:id` | GET | single chapter | episode, recommendations, like_count
`/enclosure/:id` | GET | single enclosure | episode
`/gigs/:id` | GET | single gig | persona, episode
`/subscription/:id` | GET | single subscription;<br/> only shown, when user shares | user, podcast
`/follow/:id` | GET | single follow;<br/> only shown, when user shares | category, follower, user, podcast, persona
`/like/:id` | GET | single like | category, enjoyer, user, podcast, chapter, persona, episode
{: .table .table-bordered}

The ETag is is response header, containing the MD5 hash of the JSON to be sent. You can make
a HEAD request, compare the ETag response header to the last one you have stored and know, that there isn't anything
new, if the ETag has not changed. If there are changes, go on with the GET request and get the full
JSON.

### Pagination

Podcasts within a category, gigs for a persona and episodes for a podcast are paginated:

* Example request: `https://panoptikum.social/jsonapi/personas/1?page[number]=1&page[size]=10`
* page[number] ... page number; starts counting at 1, defaults to 1
* page[size] ... number of items per page, defaults to 10, maximum 1000
* Links contain self, prev, next, last and first link (if appropriate).

### Full Text Search

path | method | purpose | included
--- | --- | ---
<nobr><code class="highlighter-rouge">/search?filter[:type]=:term</code></nobr> | GET | redirects to the appropriate route below | type can be either `persona`,`category`,`podcast` or `episode`
`/categories/search?filter=:term` | GET | searches for categories with `:term` | children = subcategories
`/podcasts/search?filter=:term` | GET | searches for podcasts with `:term` | categories, languages, engagements & contributors (= personas)
`/episodes/search?filter=:term` | GET | searches for episodes with `:term` | podcast, gigs & contributors (= personas)
`/personas/search?filter=:term` | GET | searches for personas with `:term` | redirect (= persona) , delegates (= personas), podcasts
{: .table .table-bordered}

### User generation

You can use any user generated in the web interface for full API access, but you can also create users
via the API itself.

path | method | params (* ... required)
--- |--- | ---
`/users` | POST | `username`\* (>3), `password`\* (>6), `password_confirmation`\* , `email`\* (>5, unique), `name`* (>3), <br/>`podcaster` (boolean), `share_subscriptions` (boolean), `share_follows` (boolean)
{: .table .table-bordered}

## Login

To be able to post data and receive your own private data, it's necessary to post a token along
side. To get a token, post username and password to recieve a token back, that's valid for one hour.
The token will also be provided in the header `token`.

Typically, you would call something a login, though it's only getting you a new token,
we provide both routes as endpoints, take the one with the name you prefer.
There is no session or cookie connected to that, so there is also no logout.

path | method | params (\* ... required) | purpose | included
`/login` or `/get_token` | POST | `username`\* , `password`* | get a token | token including validity data and user id
{: .table .table-bordered}

One user can access the application via the api from different devices simuntaneously. They are not
device specific.

Only users with confirmed email address can aquire tokens. Please make sure, that you click the email
confirmation link in the email that is sent to you after login via the web interface. There will
be an approriate error message telling you to do so, if you request a token and your email is not
confirmed yet.

### *Example:* Get a token

If working with tokens is something new for you, an example might help to set the expectations right.

Request:

`curl --data "username=janedoe&password=secret" https://panoptikum.social/jsonapi/login`

Response:

```json
{"jsonapi":
  {"version":"1.0"},
  "data":{"type":"session-api",
          "id":"6",
          "attributes":{"valid-until":"2017-09-08T16:46:08.393642Z",
                        "valid-for":"1 hour",
                        "token":"SFMyNTY.g3QAAAACdwRk....yNXj3wvSs9a9Ps5wO6yrY",
                        "created-at":"2017-09-08T15:46:08.393630Z"}}}
```

### *A note on security*

You get the token in a transport encrypted response via https. If you disclose the token, you
basically disclose your password. This is the case because the token owner can change the password
within the next hour, no matter if you recreated another token. So don't store it unencrypted.

## Post data and get private data

For all these end points it is necessary to provide a valid token. Unless you do so,
you will receive appropriate feedback, if the token is invalid, out of date or has not been
provided at all.

The token has to be provided as "Authorization: Bearer :token" header, where you exchange the
variable :token with the token, that you aquired before as described above.

Why didn'd we choose to support a token provided as a parameter, you might ask? We don't want to log
tokens, which we would have done for get requests.

Requests are done with or for the user identified by the token.

Post, patch and put requests have all params on top level, as we don't have nested resources
available here, see documentation for the idividual requests below. E.g., instead of json:api style

```bash
PATCH /pan/personas/42

data: {type: "personas",
       id: "42",
       attributes: {name: "My new name",
                    uri: "https://uri/to/me"}}

```

you would simply post in a more REST style:

```bash
PATCH /pan/personas/42

name: "My new name",
uri: "https://uri/to/me"
```

path | method | params (\* ... required) | purpose | included
`/pan/likes/toggle` | POST | `category_id` or `podcast_id`<br/> or `episode_id` or `chapter_id` <br/> or `user_id` or `persona_id` | like or unlike a category, podcast, episode, chapter, user or persona | <nobr><code class="highlighter-rouge">deleted</code>: true / false</nobr> <br/> `created`: true / false
`/pan/follows/toggle` | POST | `category_id` or `podcast_id` or `user_id` or `persona_id` | follow or unfollow a category, podcast, user or persona | `deleted`: true / false <br/> `created`: true / false
`/pan/subscriptions/toggle` | POST | `podcast_id`\* | follow or unfollow a podcast | `deleted`: true / false <br/> `created`: true / false
`/pan/gigs/toggle` | POST | `episode_id`\* , `persona_id`\* | proclaim a gig (= episode contribution) or retract it;<br/> only possible for owned personas | `deleted`: true / false <br/> `created`: true / false
`/pan/recommedations/my` | GET | - | list of my recommendations | podcast
`/pan/podcasts/:id/trigger_update` | GET | - | triggers immediate metadata update for a single podcast, available once per hour | (paginated) episodes, subscription_count, engagements, recommendations, categories, contributors (= personas, follower_count, likes_count, languages, feeds
`/pan/podcasts/:id/trigger_episode_update` | GET | - | triggers immediate check for new episodes, available every 30 minutes | (paginated) episodes, subscription_count, engagements, recommendations, categories, contributors (= personas, follower_count, likes_count, languages, feeds
`/pan/podcasts/i_follow` | GET | - | list of podcasts i follow | categories, engagements, contributors and languages
`/pan/podcasts/i_like` | GET | - | list of podcasts i like | categories, engagements, contributors and languages
`/pan/podcasts/i_subscribed` | GET | - | list of podcasts i subscribed to | categories, engagements, contributors and languages
`/pan/podcasts/also_listened_to` | GET | - | list of 10 podcasts that listeners of the podcasts you listen to, also listen to | categories, engagements, contributors and languages
`/pan/podcasts/also_liked` | GET | - | list of 10 podcasts that listeners of the podcasts you like,  also like | categories, engagements, contributors and languages
`/pan/categories/my` | GET | - | list of 10 categories, the podcasts i subscribed to are assigned to | children, parent
`/pan/recommendations` | POST | (`podcast_id` or `episode_id` or `chapter_id`), `comment`\* | creates a recommendation for a podcast, an episode or a chapter and returns it | podcast or episode or chapter ; user
`/pan/like_all_subscribed_podcasts` | POST | - | creates likes for all subscribed podcasts not liked yet, returns all likes for podcasts | podcast, user
`/pan/follow_all_subscribed_podcasts` | POST | - | creates follows for all subscribed podcasts not followed yet, returns all follows for podcasts | podcast, user
`/pan/opmls/` | GET | - | list of OPML files you uploaded | user
`/pan/opmls/:id` | GET | - | single OPML file | user
`/pan/opmls` | POST | `upload`\* (file) | upload an OPML file, see curl example below | user
`/pan/opmls/:id/import` | GET | - | imports feeds from OPML file into feed backlog | user
`/pan/opmls/:id` | DELETE | - | delete single OPML file; users can only delete OPML files they uploaded | user, deleted
`/pan/feed_backlogs/:id` | GET | - | single feed in backlog | user
`/pan/feed_backlogs` | POST | `url`\* | post a feed_url to the feed backlog a.k.a. suggest a podcast | user
`/pan/users/my` | GET | - | my user profile | personas
`/pan/update_password` | PATCH or PUT | `password`\* , `password_confirmation`\* | update password; server validates identicality and length > 5 | personas
`/pan/update_user` | PATCH or PUT | `email`* (>5 unique), `name`* (>3) , `username`* (>3 unique), `podcaster` (boolean), `share_follows` (boolean), `paper_bill` (boolean), `share_subscriptions` (boolean), `billing_address`(preformatted) | updates account data| personas
`/pan/update_persona` | PATCH or PUT | `name`* , `uri`* | update persona with user account | redirect, engagements & podcasts, (paginated) gigs & episodes, delegates
`/pro/update_persona` | PATCH or PUT | `pid`* (unique), `name`* , `uri`* , `email`, `image_url`, `image_title`, `description` (gets used as header), `long_description` (markdown) | update persona (pro user account) | redirect, engagements & podcasts, (paginated) gigs & episodes, delegates
`/pan/delegations/:id` | GET | - | single delegation, only returned, if persona and delegate manfestate in user | persona, delegate
`/pro/delegations/toggle` | POST | `persona_id`* , `delegate_id`* | toggles and returns delegation; persona and delegate need to manifest in user | persona, delegate
`/pro/personas/:id/redirect` | POST | `target_id`* | redirects persona to persona with id = target_id | redirect, engagements & podcasts, (paginated) gigs & episodes, delegates
`/pro/personas/:id/cancel_redirect` | POST | - | cancels a persona redirect | redirect, engagements & podcasts, (paginated) gigs & episodes, delegates
`/pan/personas/:id/claim` | POST | - | claims a persona | detail: "An Email to the Persona has been sent"
{: .table .table-bordered}

### *Example:* Like a podcast

Here is an example how you would like (or unlike, it you liked it before) a podcast.

Request:

`curl --data "username=informatom&password=secret" https://panoptikum.social/jsonapi/login`

Pick up the token from the response and provide it in the next request as a header.

Request:

`curl --data "podcast_id=104" -H "Authorization: Bearer SFMyNTY.g3QAAAACdwRk....yNXj3wvSs9a9Ps5wO6yrY" https://panoptikum.social/jsonapi/pan/likes/toggle`

### *Example:* Upload a file

To send a file from the local file system with the parameter upload, a curl request like this can be used:

`curl -v -H "Authorization: Bearer :token" -F "upload=@/full/path/to/opml.xml" https://panoptikum.social/jsonapi/pan/opmls`

### *Example:* Delete a file

To delete a file via curl, you have to set the request method via the X flag:

`curl -v -X "DELETE" -H "Authorization: Bearer :token" http://localhost:4000/jsonapi/pan/opmls/:id`
