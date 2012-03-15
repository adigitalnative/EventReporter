DONE (ish):
  load <filename>
  load
  queue count
  queue clear
  help
  help <command>
  queue print

IN PROG
  queue print by <attribute>
  queue save to <filename.csv>
  find <attribute> <criteria>

Generic Form
[load|help|queue|find] (filename|command|count|clear|print|safe|"attribute")

Imagined Uses (Starters):

load event_attendees.csv
help
help load
help queue'


FIX/TO DO LIST
  • Can't load a file after 'queue count' is called. Likely a problem in what count returns.
  • Queue print is in progress. Will currently return the full array, but not in table form yet.
  • Started playing/futzing with search. Not there yet.