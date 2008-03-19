# **********************************************************************
#
# Copyright (c) 2003-2008 ZeroC, Inc. All rights reserved.
#
# This copy of Ice is licensed to you under the terms described in the
# ICE_LICENSE file included in this distribution.
#
# **********************************************************************

top_srcdir	= ..\..

PKG		= IcePatch2
LIBNAME		= $(PKG).dll
TARGETS		= $(bindir)\$(LIBNAME)

SRCS		= AssemblyInfo.cs

GEN_SRCS	= $(GDIR)\FileInfo.cs \
		  $(GDIR)\FileServer.cs

SDIR		= $(slicedir)\IcePatch2
GDIR		= generated

!include $(top_srcdir)\config\Make.rules.mak.cs

MCSFLAGS	= $(MCSFLAGS) -target:library -out:$(TARGETS)
MCSFLAGS	= $(MCSFLAGS) -keyfile:$(KEYFILE)

SLICE2CSFLAGS	= $(SLICE2CSFLAGS) -I$(slicedir) --ice

$(TARGETS):: $(SRCS) $(GEN_SRCS)
	$(MCS) $(MCSFLAGS) -r:$(refdir)\Ice.dll $(SRCS) $(GEN_SRCS)

install:: all
	copy $(bindir)\$(LIBNAME) $(install_bindir)

!include .depend
