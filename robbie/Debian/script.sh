#!/bin/bash

echo "gathering mail..."
getmail -r ~/.getmail/bu
getmail -r ~/.getmail/earthlink
getmail -r ~/.getmail/gmail
getmail -r ~/.getmail/hotmail
echo "...done gathering!"
