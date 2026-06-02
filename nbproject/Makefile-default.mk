#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=SH1101A.c RGBLeds.c TouchSense.c main.c storage.c menu.c mla_usb/src/usb_host.c mla_usb/src/usb_hal_pic24f.c mla_usb/src/usb_host_hid.c mla_usb/src/usb_host_hid_parser.c mla_usb/src/usb_host_msd.c mla_usb/src/usb_host_msd_scsi.c mla_fileio/src/fileio.c usb_config.c usb_app.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/SH1101A.o ${OBJECTDIR}/RGBLeds.o ${OBJECTDIR}/TouchSense.o ${OBJECTDIR}/main.o ${OBJECTDIR}/storage.o ${OBJECTDIR}/menu.o ${OBJECTDIR}/mla_usb/src/usb_host.o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o ${OBJECTDIR}/mla_fileio/src/fileio.o ${OBJECTDIR}/usb_config.o ${OBJECTDIR}/usb_app.o
POSSIBLE_DEPFILES=${OBJECTDIR}/SH1101A.o.d ${OBJECTDIR}/RGBLeds.o.d ${OBJECTDIR}/TouchSense.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/storage.o.d ${OBJECTDIR}/menu.o.d ${OBJECTDIR}/mla_usb/src/usb_host.o.d ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d ${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d ${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d ${OBJECTDIR}/mla_fileio/src/fileio.o.d ${OBJECTDIR}/usb_config.o.d ${OBJECTDIR}/usb_app.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/SH1101A.o ${OBJECTDIR}/RGBLeds.o ${OBJECTDIR}/TouchSense.o ${OBJECTDIR}/main.o ${OBJECTDIR}/storage.o ${OBJECTDIR}/menu.o ${OBJECTDIR}/mla_usb/src/usb_host.o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o ${OBJECTDIR}/mla_fileio/src/fileio.o ${OBJECTDIR}/usb_config.o ${OBJECTDIR}/usb_app.o

# Source Files
SOURCEFILES=SH1101A.c RGBLeds.c TouchSense.c main.c storage.c menu.c mla_usb/src/usb_host.c mla_usb/src/usb_hal_pic24f.c mla_usb/src/usb_host_hid.c mla_usb/src/usb_host_hid_parser.c mla_usb/src/usb_host_msd.c mla_usb/src/usb_host_msd_scsi.c mla_fileio/src/fileio.c usb_config.c usb_app.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GB106
MP_LINKER_FILE_OPTION=,--script=p24FJ256GB106.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/SH1101A.o: SH1101A.c  .generated_files/flags/default/efe4bceb10d27d63ab7d070af11f1cfa357bfaa3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SH1101A.o.d 
	@${RM} ${OBJECTDIR}/SH1101A.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  SH1101A.c  -o ${OBJECTDIR}/SH1101A.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/SH1101A.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/RGBLeds.o: RGBLeds.c  .generated_files/flags/default/f2deaa1affcf89ad402ba6445fa59d35061329b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RGBLeds.o.d 
	@${RM} ${OBJECTDIR}/RGBLeds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  RGBLeds.c  -o ${OBJECTDIR}/RGBLeds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/RGBLeds.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TouchSense.o: TouchSense.c  .generated_files/flags/default/4cc40ee123dacc4175c53adf74553f9e3ca41087 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchSense.o.d 
	@${RM} ${OBJECTDIR}/TouchSense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  TouchSense.c  -o ${OBJECTDIR}/TouchSense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TouchSense.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/1ef1122e4bb4abdc98be04f7d101c46c73b58175 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/storage.o: storage.c  .generated_files/flags/default/32f78fb2f9c68aaa2136679ee3c5c03b0f7fc185 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/storage.o.d 
	@${RM} ${OBJECTDIR}/storage.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  storage.c  -o ${OBJECTDIR}/storage.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/storage.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/menu.o: menu.c  .generated_files/flags/default/62dc63f1bb3f0e52990a56b13cf42efeaed486a8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/menu.o.d 
	@${RM} ${OBJECTDIR}/menu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  menu.c  -o ${OBJECTDIR}/menu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/menu.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host.o: mla_usb/src/usb_host.c  .generated_files/flags/default/bee0373c4171c39c168fd824dea9b7cb5e38b372 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host.c  -o ${OBJECTDIR}/mla_usb/src/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o: mla_usb/src/usb_hal_pic24f.c  .generated_files/flags/default/ac06182292b2f7dd4b87f60f724a15c42f4a5d86 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_hal_pic24f.c  -o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid.o: mla_usb/src/usb_host_hid.c  .generated_files/flags/default/eecb20fa9258cb9de2a288dc191421cf07465a90 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o: mla_usb/src/usb_host_hid_parser.c  .generated_files/flags/default/5b4cdb8bc4925b98a38ac1dcffac097d7a45e315 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid_parser.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd.o: mla_usb/src/usb_host_msd.c  .generated_files/flags/default/688258c7f4c18a8083e907eee454a28cab6e17cb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o: mla_usb/src/usb_host_msd_scsi.c  .generated_files/flags/default/f80bdf35d4964958906610ae846c9fb0d05b03b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd_scsi.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_fileio/src/fileio.o: mla_fileio/src/fileio.c  .generated_files/flags/default/8c55a6e8b465dfd99a73079d4e63007585e1c484 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_fileio/src" 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o.d 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_fileio/src/fileio.c  -o ${OBJECTDIR}/mla_fileio/src/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_fileio/src/fileio.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_config.o: usb_config.c  .generated_files/flags/default/970153ea250de656e88fb85291cd7cdd887d7548 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_config.c  -o ${OBJECTDIR}/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_config.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_app.o: usb_app.c  .generated_files/flags/default/843379c6ae2e3d542a2be1a8f0eb501ef10736fd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_app.o.d 
	@${RM} ${OBJECTDIR}/usb_app.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_app.c  -o ${OBJECTDIR}/usb_app.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_app.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/SH1101A.o: SH1101A.c  .generated_files/flags/default/8db20ada4bea59d3d47d417cd650baba10621c0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SH1101A.o.d 
	@${RM} ${OBJECTDIR}/SH1101A.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  SH1101A.c  -o ${OBJECTDIR}/SH1101A.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/SH1101A.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/RGBLeds.o: RGBLeds.c  .generated_files/flags/default/e04146cdcbfbfbec86b332747110d2cfadcd731 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RGBLeds.o.d 
	@${RM} ${OBJECTDIR}/RGBLeds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  RGBLeds.c  -o ${OBJECTDIR}/RGBLeds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/RGBLeds.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TouchSense.o: TouchSense.c  .generated_files/flags/default/d1339061801b9a826e3fb41ec1982bf6d4ffcec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchSense.o.d 
	@${RM} ${OBJECTDIR}/TouchSense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  TouchSense.c  -o ${OBJECTDIR}/TouchSense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TouchSense.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/3e53b7af05d323e8ec6ddc47a6b197cfcdea76f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/storage.o: storage.c  .generated_files/flags/default/b732d118ac6980e11d6e5a4010c75fce36aef3b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/storage.o.d 
	@${RM} ${OBJECTDIR}/storage.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  storage.c  -o ${OBJECTDIR}/storage.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/storage.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/menu.o: menu.c  .generated_files/flags/default/7e1bd0a712000e087f6bd57c92dc38362050b2ec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/menu.o.d 
	@${RM} ${OBJECTDIR}/menu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  menu.c  -o ${OBJECTDIR}/menu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/menu.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host.o: mla_usb/src/usb_host.c  .generated_files/flags/default/783aa6c7c4445cc960e4a3dd29f7df207f082e61 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host.c  -o ${OBJECTDIR}/mla_usb/src/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o: mla_usb/src/usb_hal_pic24f.c  .generated_files/flags/default/437ecefcb97b1989815dd0c8184b78f709254a25 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_hal_pic24f.c  -o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid.o: mla_usb/src/usb_host_hid.c  .generated_files/flags/default/55db019bbb81540dc6160b10d3f60c617ded9b5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o: mla_usb/src/usb_host_hid_parser.c  .generated_files/flags/default/9533885f77ae560b8b7250c491c91c4874a4ae48 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid_parser.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd.o: mla_usb/src/usb_host_msd.c  .generated_files/flags/default/bba3b5b90a7a40801ea9f0927a39846912832bfb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o: mla_usb/src/usb_host_msd_scsi.c  .generated_files/flags/default/99b915e782ead7f9c4168ae82e7e7643b65decee .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd_scsi.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_fileio/src/fileio.o: mla_fileio/src/fileio.c  .generated_files/flags/default/e18f250453cea09a927104bfb2be62b13fcc4502 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_fileio/src" 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o.d 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_fileio/src/fileio.c  -o ${OBJECTDIR}/mla_fileio/src/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_fileio/src/fileio.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_config.o: usb_config.c  .generated_files/flags/default/d96d88eb8a337f1e23714d2b20d4efe5cd024360 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_config.c  -o ${OBJECTDIR}/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_config.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_app.o: usb_app.c  .generated_files/flags/default/b989a79367c4f6d4836b3f72d943a1d704ff8c5a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_app.o.d 
	@${RM} ${OBJECTDIR}/usb_app.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_app.c  -o ${OBJECTDIR}/usb_app.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_app.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex ${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
