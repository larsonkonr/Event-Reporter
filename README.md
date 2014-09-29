Event Reporter
Made by Viki & Konr


Notes:

things that people get wrong in event reporter
1. evaluations will actually do all of the things in base exectations.
2. the base requirements, including phrasing, must be precisely met
3. strongly encouraged to do extensions
4. BUT also strongly encouraged not to shoot for them off the bat. Base expectations FIRST.
5. Try to be done with one feature at a time. (ex: be able to start program. be able to quit program.)
6. Be willing to throw away code.
7. TEST.

Possible division of responsibilities
(Discuss with Konr)

-Has a queue
-Reads data from CSV
-Can take load or load <filename> command
-Load command defaults to event_attendees.csv
-Can take help command
-Outputs a listing of available individual commands
-Can take help <command> command
-Outputs a description of how to use specific command

Queue
  -Can take a queue count command
    -Outputs how many records are in current queue
  -Can take queue clear command
    -Empties current queue
  -Can take queue print command
    -Prints tab-delimited data table with header row following specified format
  -Can take queue print by <attribute> command
    -Prints data table sorted by specified attribute like zipcode
  -Can take queue save to <filename.csv> command
    -Exports current queue to specfied filename as a CSV with headers.
  -Can take find <attribute> <criteria> command
    -Loads queue with all records matching criteria for given attribute
