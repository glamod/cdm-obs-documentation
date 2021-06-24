.. _conceptual:

Conceptual data model
=====================
The figure below shows the conceptual data model used by the common data model, largely building on the ODB v1 data model developed by ECMWF.
Only the primary data tables are shown, there are additional data and code tables but this have been omitted for brevity.
Within this data model each weather report (or record) is split across two main tables.
The first, the header table, provides information common to all observations contained in the report.
Examples include, inter alia, the location and time of the report, the identity of the station, events at the time of the report etc.
The second table contains the observations, with one observation per row, and including metadata related to how the observation was made and sensor height.
These two tables are then linked to further configuration tables providing more in depth information on the sensors, stations and sources.
For those observations from profiles, e.g. radiosonde or ocean profile measurements, further information can be provided via the profile configuraiton table.
Additional quality control, homogenisation and uncertinty estimates can be provided through the respective tables linked to the observations table.
Finally, optional information can be provided through the optional tables.

These tables are described further on the data tables and code tables pages.


.. graphviz:: dot_files/conceptual.dot