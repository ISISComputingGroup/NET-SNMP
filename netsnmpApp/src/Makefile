TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#==================================================
# build a support library

LIBRARY_IOC += netsnmp

# xxxRecord.h will be created from xxxRecord.dbd
#DBDINC += xxxRecord
# install netsnmp.dbd into <top>/dbd
DBD += netsnmp.dbd

# specify all source files to be compiled and added to the library
#netsnmp_SRCS += xxx

netsnmp_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

