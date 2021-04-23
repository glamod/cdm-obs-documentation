Conceptual data model
=====================
- Conceptual data model largely based on the ODB v1 data model
- Weather reports split into two tables
	- a header table providing information common to all observations in the report, e.g. station identity and location, report time etc.
	- an observations table containing the information unique to the observations, e.g. observed value, method of observing, height etc.