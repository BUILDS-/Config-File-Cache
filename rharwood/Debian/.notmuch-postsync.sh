#!/bin/sh
# tag all messages from me
notmuch tag -new +sent -- tag:new and from:rharwood@andrew.cmu.edu
notmuch tag -new +sent -- tag:new and from:rharwood@cmu.edu
notmuch tag -new +sent -- tag:new and from:threeoften@gmail.com
# tag some mailing lists
notmuch tag -new +notmuch -- tag:new and to:notmuch@notmuchmail.org
notmuch tag -new +osssec -- tag:new and to:oss-security@lists.openwall.com
notmuch tag -new +ATS -- tag:new and to:ats-lang-users@lists.sourceforge.net
notmuch tag -new +debian -- tag:new and to:debian-security-announce@lists.debian.org
notmuch tag -new +PPP -- tag:new and to:plaid-parliament-pwning@lists.andrew.cmu.edu
notmuch tag -new +15150disc -- tag:new and to:academic.cs.15-150.discuss@andrew.cmu.edu
notmuch tag -new +15150disc -- tag:new and to:academic.cs.15-150.announce.discuss@andrew.cmu.edu
notmuch tag -new +15150ann -- tag:new and to:academic.cs.15-150.announce@andrew.cmu.edu
notmuch tag -new +15150ann -- tag:new and from:ivoysey@cmu.edu
notmuch tag -new +15150ann -- tag:new and from:drl@cs.cmu.edu
notmuch tag -new +15150ann -- tag:new and from:15-150tas@lists.andrew.cmu.edu
notmuch tag -new +15150ann -- tag:new and to:15-150tas@lists.andrew.cmu.edu
notmuch tag -new +cclub -- tag:new and to:operations@club.cc.cmu.edu
notmuch tag -new +cclub -- tag:new and to:members@club.cc.cmu.edu
notmuch tag -new +cclub -- tag:new and to:announcef11@club.cc.cmu.edu
notmuch tag -new +cclub -- tag:new and to:cmu.student.computer-club@andrew.cmu.edu
notmuch tag -new +builds -- tag:new and to:builds-list@bu.edu
notmuch tag -new +builds -- tag:new and to:sipb-office@mit.edu
notmuch tag -new +buildspolitical -- tag:new and to:buildspolitical-list@bu.edu
notmuch tag -new +gutenbach -- tag:new and to:gutenbach@mit.edu
notmuch tag -new +gutenbach -- tag:new and to:gutenbach-auto@mit.edu
notmuch tag -new +debugs -- tag:new and from:owner@bugs.debian.org
notmuch tag -new +ACM -- tag:new and to:acm-public@lists.andrew.cmu.edu
notmuch tag -new +occupy -- tag:new and from:change@occupypittsburgh.org

# spam
notmuch tag -new -unread +spam -- tag:new and from:plaid@andrew.cmu.edu
notmuch tag -new -unread +spam -- tag:new and to:Residence-On-Fifth@listserv.housing.cmu.edu
notmuch tag -new -unread +spam -- tag:new and from:staff-council@andrew.cmu.edu
notmuch tag -new -unread +spam -- tag:new and from:CITCC@andrew.cmu.edu
notmuch tag -new -unread +spam -- tag:new and to:CITCC@andrew.cmu.edu
notmuch tag -new -unread +spam -- tag:new and from:kbandish@cmu.edu
notmuch tag -new -unread +spam -- tag:new and from:rb3l@andrew.cmu.edu
notmuch tag -new -unread +spam -- tag:new and from:events@andrew.cmu.edu
notmuch tag -new -unread +spam -- tag:new and from:annual-giving@andrew.cmu.edu
notmuch tag -new -unread +spam -- tag:new and to:cit-dlist@lists.andrew.cmu.edu

# cleanup
notmuch tag -new +inbox -- tag:new
