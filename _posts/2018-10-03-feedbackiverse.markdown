---
layout: post
title:  Feedbackiverse
date:   2018-10-03 09:48:00 +0200
author: Stefan
---

Sorry, the following post reporting a barcamp session on feedback mechanisms is in German, but
we are aiming for content on this topic in English soon.

# Protokoll der F(e)ed(back)iverse Session

Ganzohr 2018, Samstag 29. September, Wien, Akademie der Wissenschaften

Ich (Stefan Haslinger) hatte zum Barcamp Track der Ganzohr 2018 eine Session mit dem Titel
F(e)ed(back)iverse eingereicht und die Gelegenheit bekommen, diese auch zu leiten.

Hintergrund ist meine Unzufriedenheit mit dem Zustand des Feedbackprozesses für Podcasts.
Hörer:innnen müssen immer, um Feedback zu geben, einen Medienbruch aus dem Podcatcher machen.
Beim Hören mit einem Webplayer ist spätestens mit dem Absenden des Feedbacks der Hörvorgang
unterbrochen. Auch die anderen in der deutschsprachigen Podcastszene üblichen Feedback Kanäle
E-Mail, Twitter erzwingen den Medienbruch vom Ton zum Text, der Aufwand eine eigene Telefonleitung
für Feedback schalten zu lassen, ist unverhältnismäßig hoch und für Hobbypodcasts kaum zu stemmen.
Er sorgt nur für eine weitere Fragmentierung der Feedbackkanäle.

Ich sehe im Protokoll ActivityPub eine Chance, alle Anforderungen, die an das Kommentieren
gestellt werden, erfüllen zu können, da dieses Protokoll ähnlich RSS erweiterbar ist. Dazu muss
allerdings eine Standard geschaffen werden. Als erster Schritt für den Prozess zu solch einem
Standard sollte die Feedback Session dienen, die möglichst viele Anforderungen (Specs) benennen
sollte.

Im Laufe der Zeit haben etwa 10 Personen an der Session teilgenommen, die von ihnen genannten
Anforderungen werden nun hier aufgezählt.


## Anforderungen an Feedback bzw. Activitypub

Die Reihenfolge entspricht der Reihenfolge der Nennung in der Barcamp Session und nicht einer
Gewichtung.

* Hörer:in soll Feedback in Text und Audioform geben können (vgl. E-Mail Attachment)
* Hörer:in soll Kommentare in einer Historie behalten können (vgl. E-Mail Postausgang)
* Hörer:in soll die Empfänger:innen des Kommentars bestimmen können. Mögliche Empfänger:innen:
  * Podcaster:innen
  * alle Hörer:innen
  * die Allgemeinheit
  * die Webseite des Podcasts
  * andere Podcastplattformen (Itunes, Fyyd, Soundcloud, Panoptikum, ...)
* Hörer:in sollen Kommentare zurückziehen (löschen) können
* Podcaster:in soll die Kommentare ähnlich E-Mail konfigurierbar verwalten können, etwa Trennung
  * nach Podcast
  * nach Episode
  * nach Hörer:in
* Audiokommenatare
  * so klein wie möglich / Qualität ausreichend -> Audiocodec
  * Qualität soll konfigurierbar sein
* Kommentare sollen für Livepodcasts in Echtzeit übertragen werden
* Es sollen nur offene Protokolle verwendet werden (nicht proprietär)
* Die nötigen Services dürfen nicht an einer einzigen oder wenigen Firmen gekoppelt sein
  (Zensur, Marktdominanz)
* Hörer:in soll Podcast liken können
* Hörer:in soll Episode liken können
* Hörer:in soll öffentliche Kommentare liken können
* Hörer:in soll öffentliche Kommentare zu einem Podcast abonieren können
* Hörer:in soll öffentliche Kommentare zu einer Episode abonieren können
* Hörer:in soll auf öffentlichen Kommentar antworten können (also Diskussion zwischen Hörer:innen)
* Hörer:in soll Speicher für eigene Kommentare selbst betreiben können (Server)
* Hörer:in soll Speicher für eigene Kommentare selbst betreiben lassen können (Hosting, Housing)
* Hörer:in soll Dienstleister für eigene Kommentare wechseln können
* Hörer:in soll Kommentare verschlüsselt zur Podcaster:in übertragen können
* Audiokommentare sollen einfach abgespielt werden können
* Kommentare sollen den Podcast, die Episode und den Zeitpunkt innerhalb der Episode kennen,
  um entsprechend von den Podcatchern bzw. Webplayern eingebettet werden zu können
* Die Accounterstellung im Fediverse soll so einfach wie möglich sein
* Podcatcher sollen Accounts on the fly anlegen können
* Anonyme Accounts für Hörer:in sollen möglich sein
* Accounts sollen im Hintergrund aus dem Podcatcher erstellt werden können
* Es ist grundsätzlich nicht unmöglich, für jeden Kommentar einen eigenen Account zu erstellen
  (Wegwerfaccount)
* Kommentare sollen zitierfähig sein mit den Quellen:
  * public Feed der Hörer:in
  * public Feed der Podcaster:in
  * public Feed des Podcasts
* Podcaster:in soll die Länge eines Kommentars begrenzen können
* Podcaster:in soll Hörer:innen blocken können
* Podcaster:in soll Kommentare freischalten / moderieren können
* Audiokommentare sollen in die nächste Episode eingebaut werden können
* Podcaster:in soll Umfragen machen können (Quizfrage, Abstimmung zu nächster Episode)
* Die Grenzen zwischen Podcaster:innen und Hörer:innen sollen aufbrechen
* Hörer:innen sollen Live Streams kommentieren können (timestamp)
* Kommentare sollen in existierende (mobile und Web) Apps integriert werden können
* Kommentare sollen von Facebook Seiten (Strava, Youtube, Twitter, WhatsApp, o.ä.) abgegriffen
  werden können (Bot-Accounts)
* Als Fallback ist statt Kommentar in der App ein Redirect auf die Webseite denkbar, um dort den
  Kommentar abzusetzen (aber wozu eigentlich?)
* Schnittprogramme sollen Zugriff auf die Audiokommentare erhalten
* Ähnlich Like: "Habe Dich gehört" - Ping
* Durch abonieren / Deabonieren sieht Podcaster:in, ob sie/er Hörer:innen gewinnt / verliert.
* Freischaltstrategien (wer einmal ordentlich kommentiert hat, darf ohne Moderation durch)
* Podcaster:in soll über neuen Kommentar benachrichtigt werden können
* Spamkommentare sollen gefiltert werden können

Vielen Dank an die Teilnehmer:innen, ich bin begeistert über die Menge der Anforderungen, die
aus der einstündigen Session entstanden ist.

Eine nette Anekdote: Nach der Session meinte ein Mitdiskutant
sinngemäß: "Ist halt wenig rausgekommen."


### Links

* ActivityPub
  * auf Wikipedia: https://en.wikipedia.org/wiki/ActivityPub
  * Spezifikation: https://www.w3.org/TR/activitypub/

* Fediverse auf Wikipedia: https://en.wikipedia.org/wiki/Fediverse
* Mastodon https://joinmastodon.org/
  * auf Wikipedia: https://en.wikipedia.org/wiki/Mastodon_(software)
* Pleroma https://pleroma.social/
* Gnu Social https://gnu.io/social/