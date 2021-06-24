Introduction
============

This site documents a common data model for in situ climate observations (CDM-Obs) developed as part of the C3S 311a and C3S 311c services.
Whilst hosted by the GLAMOD organisation on GitHub the site has been developed outside of the C3S services and is an unofficial resource.
The main repository for the common data model can be found at: https://github.com/glamod/common_data_model.
The pdf documentation is also provided as part of this repository https://github.com/glamod/common_data_model/blob/master/cdm_latest.pdf.

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
Additional linked records contain the metadata.
Where possible, we have tried to keep the vocabulary used in existing standards.
For example, at the time of initial development the code tables included in this data model were directly linked to those from the WIGOS Metadata Standard (WMDS) and BUFR but it should be noted that some of these may have since changed (particularly the WMDS).
We have also tried to account for the need to extract both the observations and metadata into different standards, for example it should be possible to map the data contained in the data model to the ISO19135 and ISO19139 standards.

An overview is provided on the conceptual data model page, the full data model is given on the data tables and code tables pages.

Jump to:
--------
* :ref:`conceptual`
* :ref:`data-tables`
* :ref:`code-tables`