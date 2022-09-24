TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#==================================================
# build a support library

ifneq ($(findstring debug,$(EPICS_HOST_ARCH)),)
VSCONFIG=debug
else
VSCONFIG=release
endif

VENDOR = $(TOP)/vendor

ifeq ($(STATIC_BUILD),YES)
LINKTYPE=static
else
LINKTYPE=dynamic
endif

# this is becasue namke doesn't like make flags 
override MAKEFLAGS=

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE
# --with-ssl  --with-sslincdir=   --with-ssllibdir=
# 
ifdef T_A
install:
	( cd $(VENDOR)/win32 && $(PERL) Configure --config=$(VSCONFIG) --with-sdk --prefix=$(abspath $(TOP))/install --linktype=$(LINKTYPE) --with-ssl --with-sslincdir=$(OPENSSL)/include --with-ssllibdir=$(OPENSSL)/lib/$(EPICS_HOST_ARCH) )
	( cd $(VENDOR)/win32 && nmake apps_clean )
	( cd $(VENDOR)/win32 && nmake libs_clean )
	( cd $(VENDOR)/win32 && nmake libs )
	( cd $(VENDOR)/win32 && nmake apps )
	( cd $(VENDOR)/win32 && nmake install )
	( cd $(VENDOR)/win32 && nmake install_devel )
	-$(MKDIR) $(TOP)/bin/$(EPICS_HOST_ARCH)
	-$(MKDIR) $(TOP)/lib/$(EPICS_HOST_ARCH)
	-$(MKDIR) $(TOP)/include
	$(CP) $(TOP)/install/bin/* $(TOP)/bin/$(EPICS_HOST_ARCH)
	$(CP) $(TOP)/install/lib/* $(TOP)/lib/$(EPICS_HOST_ARCH)

#ifeq ($(OS_CLASS),WIN32)
#ifeq ($(STATIC_BUILD),YES)
#	$(CP) $(TOP)/lib/$(T_A)/libxml2_a.lib $(TOP)/lib/$(T_A)/xml2.lib
#else
#	$(CP) $(TOP)/lib/$(T_A)/libxml2.lib $(TOP)/lib/$(T_A)/xml2.lib
#endif
#endif

endif

ifeq ($(BASE_3_14),YES)
clean:: myclean
else
clean: myclean
endif

myclean:
	( cd $(VENDOR)/win32 && nmake apps_clean )
	( cd $(VENDOR)/win32 && nmake libs_clean )

uninstall:
	$(RMDIR) $(TOP)/install

