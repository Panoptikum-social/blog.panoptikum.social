+++
title = "Same title, different podcast"
date = 2026-10-12
authors = ["Stefan"]
redirect_from = ["/2026/10/12/same-title-different-podcast.html"]
+++

There are a lot of podcasts out there called "Deportes". Or "Embedded". Or
"Interface". For almost ten years, Panoptikum quietly assumed that this
couldn't happen: every podcast had to have a title no other podcast had. This
week we finally let go of that assumption. Here is what changed, why, and what
it means for your podcast.

## The rule from 2016

When Panoptikum started, one feed was one podcast, and titles were nearly
always distinct. So the database got a simple rule: no two podcasts may share
a title. The title also became the way Panoptikum recognised a podcast when a
feed was added: "do we already have a podcast with this title? Then this feed
belongs to it."

That rule caused two problems, one visible and one invisible.

## Problem one: your podcast couldn't update its details

Once a month, Panoptikum reads every feed again and updates the title,
description and artwork. If your feed's title had meanwhile become the same
as another podcast's, the database refused the whole update. Your new
description and your new cover were simply not saved. Your episodes still
arrived, because that's a different process, but your podcast page slowly
went out of date.

At the last count this affected 367 podcasts. The language courses of one
publisher, for example, all use titles like "Eating Out" for their Italian,
Chinese and Spanish versions.

## Problem two: different shows got mixed up

This one was worse, because nobody noticed. When someone added a new feed and
its title already existed in Panoptikum, the new feed wasn't added as a new
podcast. Its episodes were added to the existing podcast with that title.

When we went looking for this in the data, we found real cases. A Spanish
sports talk show called "Deportes" contains 100 episodes of a completely
different radio programme with the same title. A podcast about embedded
systems contains 26 episodes of a journalism podcast that is also called
"Embedded". Most of this happened in 2017 and 2018, but the mechanism was
still in place until this week. We're sorry about that.

## What changed

- **Podcasts may share a title now.** This is simply how the world is. If
  your podcast shares its title with another one, it can update its details
  again like any other podcast.
- **Panoptikum recognises a podcast by its feed address, not by its title.**
  When a feed is added, the only question is: do we know this exact feed
  address already? Only then is it the same podcast. A different show with
  the same title gets its own page.
- **Adding a feed we already know now produces a clear message**, naming the
  podcast it belongs to, instead of quietly doing something in the
  background. That way an admin always knows what happened and can decide.

## What this means for you

**If you only have one feed, nothing changes**, except that your podcast's
details will now stay up to date even if another show uses the same title.

**If you publish one feed per format** (MP3, AAC, Ogg, Opus, as many
Podlove users do), Panoptikum used to bundle these into one podcast,
precisely because they share a title. That was useful, and it stays that way
for every format feed we already know. A format feed we haven't seen before
may now show up as a second podcast for a short while. Our approach is "if in
doubt, import twice": two entries for the same show are easy to spot and to
merge by hand. Two shows wrongly merged into one are not. We're working on a
better tool for finding and merging such duplicates, which will put your
format feeds back together as alternatives of one podcast.

**If you move your feed** to a new host, please do it the usual way: a
permanent redirect (HTTP 301) from the old address to the new one, or the
`<itunes:new-feed-url>` tag in your feed. Panoptikum follows both. You can
also rename your podcast at the same time; that's fine.

## The special case: retiring a podcast and starting a new one

Some of you, or your publishers, end a podcast and want its listeners to
follow you to your new project. A common way is to redirect the old feed to
the new one. To Panoptikum, until now, that looked exactly like a move: the
old podcast page simply started showing the new show's episodes. We found one
podcast that has been showing its successor's episodes for seven years.

Here is how we're going to tell a move from a new show. It's a rule a human
would use, too:

- **The title changes, but the episodes stay the same:** that's a rename or a
  move. Panoptikum follows it, as before.
- **The title changes and almost all the episodes are different:** that's a
  new podcast. Your old podcast stays in Panoptikum as it is, with its own
  episodes, and is not marked as dead as long as its feed still works. The
  new feed goes onto our list of feeds to add, and one of us looks at it
  before it goes live.
- **Somewhere in between:** we look at it by hand rather than guess.

Why not add the new podcast automatically? Because a redirect doesn't always
come from you. Domains expire and get bought by someone else, and a feed that
suddenly points to a completely different show could just as well be a
takeover. A quick human check protects your listeners, and your podcast's
history on Panoptikum.

The same goes for the case where a completely different show appears at
your old feed address without any redirect. Panoptikum won't silently swap
your podcast's content for it. Adding it is refused with a message, and an
admin decides: if it's you starting over in good faith, the old entry is
removed and the new one added. If it's not you, the old podcast stays as it
is.

The first part of this is live: a podcast whose feed now points to another
podcast in Panoptikum no longer takes over that podcast's title and artwork.
The full check for new shows is the next thing on our list.

## Cleaning up

The podcasts that were already mixed up, like the "Deportes" and "Embedded"
examples above, still need to be untangled. That will be done with the new
duplicates tool, by hand, case by case.

**If you find episodes of another show on your podcast's page, or your
podcast listed twice, please tell us** at
[mail@panoptikum.social](mailto:mail@panoptikum.social) or on the
[Fediverse](https://fosstodon.org/@panoptikum). It helps us find the cases our
search in the data didn't catch.
