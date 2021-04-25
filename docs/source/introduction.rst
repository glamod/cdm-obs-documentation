Introduction
============

This site documents a common data model for in situ climate observations (CDM-Obs) developed as part of the C3S 311a and C3S 311c services.
Whilst hosted by the GLAMOD organisation on GitHub the site has been developed outside of the C3S services and is an unofficial resource.
The main repository for the common data model, including the pdf documentation can be found at: https://github.com/glamod/common_data_model.

The data model developed is intended to provide a single harmonised model and vocabulary for in situ meteorological observations provided through the C3S services.
This includes both meteorological observations made at the surface and observations made throughout the atmosphere.
The model is intended to be flexible enough to also include oceanographic observations.
Throughout this site, and the original documentation, the following terms have been used:

- *weather report*: a collection of observations made at (or close to) the same point in time and included in a single message.
- *observation*: an observed or measured value of a single parameter or measurand.

The starting point for the data model was the ODBv1 data model developed by ECMWF.
However, this has been significantly modified and expanded to include comprehensive provenance, discovery and instrumental metadata.
Within the data model the weather reports are split across two different record types following the ODBv1 approach.
Header records provide information common to all observations within a weather report.
Linked records contain the observations, with a single measurand or observed variable per record.
Additional linked records contain the metadata, an overview is provided on the conceptual model page and the full model is described on the physical data model page.