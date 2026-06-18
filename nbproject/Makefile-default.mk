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
SOURCEFILES_QUOTED_IF_SPACED=SH1101A.c RGBLeds.c TouchSense.c main.c storage.c menu.c mla_usb/src/usb_host.c mla_usb/src/usb_hal_pic24f.c mla_usb/src/usb_host_hid.c mla_usb/src/usb_host_hid_parser.c mla_usb/src/usb_host_msd.c mla_usb/src/usb_host_msd_scsi.c mla_fileio/src/fileio.c usb_config.c usb_app.c keyboard.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/SH1101A.o ${OBJECTDIR}/RGBLeds.o ${OBJECTDIR}/TouchSense.o ${OBJECTDIR}/main.o ${OBJECTDIR}/storage.o ${OBJECTDIR}/menu.o ${OBJECTDIR}/mla_usb/src/usb_host.o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o ${OBJECTDIR}/mla_fileio/src/fileio.o ${OBJECTDIR}/usb_config.o ${OBJECTDIR}/usb_app.o ${OBJECTDIR}/keyboard.o
POSSIBLE_DEPFILES=${OBJECTDIR}/SH1101A.o.d ${OBJECTDIR}/RGBLeds.o.d ${OBJECTDIR}/TouchSense.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/storage.o.d ${OBJECTDIR}/menu.o.d ${OBJECTDIR}/mla_usb/src/usb_host.o.d ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d ${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d ${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d ${OBJECTDIR}/mla_fileio/src/fileio.o.d ${OBJECTDIR}/usb_config.o.d ${OBJECTDIR}/usb_app.o.d ${OBJECTDIR}/keyboard.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/SH1101A.o ${OBJECTDIR}/RGBLeds.o ${OBJECTDIR}/TouchSense.o ${OBJECTDIR}/main.o ${OBJECTDIR}/storage.o ${OBJECTDIR}/menu.o ${OBJECTDIR}/mla_usb/src/usb_host.o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o ${OBJECTDIR}/mla_fileio/src/fileio.o ${OBJECTDIR}/usb_config.o ${OBJECTDIR}/usb_app.o ${OBJECTDIR}/keyboard.o

# Source Files
SOURCEFILES=SH1101A.c RGBLeds.c TouchSense.c main.c storage.c menu.c mla_usb/src/usb_host.c mla_usb/src/usb_hal_pic24f.c mla_usb/src/usb_host_hid.c mla_usb/src/usb_host_hid_parser.c mla_usb/src/usb_host_msd.c mla_usb/src/usb_host_msd_scsi.c mla_fileio/src/fileio.c usb_config.c usb_app.c keyboard.c



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
${OBJECTDIR}/SH1101A.o: SH1101A.c  .generated_files/flags/default/2f3f9e5dcf78357c54d1e6c1f1756a16b1a44875 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SH1101A.o.d 
	@${RM} ${OBJECTDIR}/SH1101A.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  SH1101A.c  -o ${OBJECTDIR}/SH1101A.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/SH1101A.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/RGBLeds.o: RGBLeds.c  .generated_files/flags/default/9028f5f8bc533ce610df3c5c5317ae9d67fab76 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RGBLeds.o.d 
	@${RM} ${OBJECTDIR}/RGBLeds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  RGBLeds.c  -o ${OBJECTDIR}/RGBLeds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/RGBLeds.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TouchSense.o: TouchSense.c  .generated_files/flags/default/c329c1e35968db6a5a31d3bf6db1522955df3959 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchSense.o.d 
	@${RM} ${OBJECTDIR}/TouchSense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  TouchSense.c  -o ${OBJECTDIR}/TouchSense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TouchSense.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/ad3eff07d35f34b673a09bea9a384614ae325d55 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/storage.o: storage.c  .generated_files/flags/default/e8e2647aba5f18d42e64e07a50c7bd680146503 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/storage.o.d 
	@${RM} ${OBJECTDIR}/storage.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  storage.c  -o ${OBJECTDIR}/storage.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/storage.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/menu.o: menu.c  .generated_files/flags/default/17450adfb2694ef8d8e6b8a71ead2c3483093baf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/menu.o.d 
	@${RM} ${OBJECTDIR}/menu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  menu.c  -o ${OBJECTDIR}/menu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/menu.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host.o: mla_usb/src/usb_host.c  .generated_files/flags/default/2a312b103f3c7aafff522c15d7e07165d80c2b44 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host.c  -o ${OBJECTDIR}/mla_usb/src/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o: mla_usb/src/usb_hal_pic24f.c  .generated_files/flags/default/cba2a429c03b68223240fb1aaee08b2b033c7f07 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_hal_pic24f.c  -o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid.o: mla_usb/src/usb_host_hid.c  .generated_files/flags/default/60f1f17948b5e0376c0d777aac4b9a83771410b3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o: mla_usb/src/usb_host_hid_parser.c  .generated_files/flags/default/647913582c8477465507f1b626577a300b8a841e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid_parser.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd.o: mla_usb/src/usb_host_msd.c  .generated_files/flags/default/5d1a4ae612c4936891b6c44b667ebb69ca5dadd8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o: mla_usb/src/usb_host_msd_scsi.c  .generated_files/flags/default/7618f47130dd297102f808034c0e32af735a5877 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd_scsi.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_fileio/src/fileio.o: mla_fileio/src/fileio.c  .generated_files/flags/default/6886d6498649cf64ab0b0261504560c986b6baa7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_fileio/src" 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o.d 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_fileio/src/fileio.c  -o ${OBJECTDIR}/mla_fileio/src/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_fileio/src/fileio.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_config.o: usb_config.c  .generated_files/flags/default/f2f743e10f048e608f1ad4c764b16bc89b1c9006 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_config.c  -o ${OBJECTDIR}/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_config.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_app.o: usb_app.c  .generated_files/flags/default/add80af35ef2b8975fffbcc7c57741297eead1bd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_app.o.d 
	@${RM} ${OBJECTDIR}/usb_app.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_app.c  -o ${OBJECTDIR}/usb_app.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_app.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"

${OBJECTDIR}/keyboard.o: keyboard.c  .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keyboard.o.d 
	@${RM} ${OBJECTDIR}/keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  keyboard.c  -o ${OBJECTDIR}/keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/keyboard.o.d"      -g -D__DEBUG     -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/SH1101A.o: SH1101A.c  .generated_files/flags/default/ad8c0ab8eb59c01f38d7a64c831e1e6157e2e2ce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SH1101A.o.d 
	@${RM} ${OBJECTDIR}/SH1101A.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  SH1101A.c  -o ${OBJECTDIR}/SH1101A.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/SH1101A.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/RGBLeds.o: RGBLeds.c  .generated_files/flags/default/3507d5ee97f07a0d70fb84772587c06ba011bd0e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RGBLeds.o.d 
	@${RM} ${OBJECTDIR}/RGBLeds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  RGBLeds.c  -o ${OBJECTDIR}/RGBLeds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/RGBLeds.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TouchSense.o: TouchSense.c  .generated_files/flags/default/2814f750f58561665ee9ef23d87aad83e515f292 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchSense.o.d 
	@${RM} ${OBJECTDIR}/TouchSense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  TouchSense.c  -o ${OBJECTDIR}/TouchSense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TouchSense.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/eb1b6294ca5928888bac704e669786c88b6d2b2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/storage.o: storage.c  .generated_files/flags/default/561406fbbddb00617776057351f0c3cff579888c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/storage.o.d 
	@${RM} ${OBJECTDIR}/storage.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  storage.c  -o ${OBJECTDIR}/storage.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/storage.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/menu.o: menu.c  .generated_files/flags/default/641416bfcb2c954729df8a200ae8d977feef4bb7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/menu.o.d 
	@${RM} ${OBJECTDIR}/menu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  menu.c  -o ${OBJECTDIR}/menu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/menu.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host.o: mla_usb/src/usb_host.c  .generated_files/flags/default/e6bfdb3891f6e347079be490614c630004573c43 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host.c  -o ${OBJECTDIR}/mla_usb/src/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o: mla_usb/src/usb_hal_pic24f.c  .generated_files/flags/default/aaa338918f7088feae29759f4368befa433a6de8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_hal_pic24f.c  -o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid.o: mla_usb/src/usb_host_hid.c  .generated_files/flags/default/db922132a328c56adf2fc8554e7bb9a6e6e558ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o: mla_usb/src/usb_host_hid_parser.c  .generated_files/flags/default/1d2d562be6eb7934d08b2ccf4203c6210f79e420 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid_parser.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd.o: mla_usb/src/usb_host_msd.c  .generated_files/flags/default/bd2bc2e89a25307518c80331f824cc3c811c73d5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o: mla_usb/src/usb_host_msd_scsi.c  .generated_files/flags/default/d5b61da129f0ac93e330538cff1cc218b73acf7f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd_scsi.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_fileio/src/fileio.o: mla_fileio/src/fileio.c  .generated_files/flags/default/67ed1807786464073f3554d9b3e9711e554fe4ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_fileio/src" 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o.d 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_fileio/src/fileio.c  -o ${OBJECTDIR}/mla_fileio/src/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_fileio/src/fileio.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_config.o: usb_config.c  .generated_files/flags/default/5f1826f1f9a3d1e89a4f157799755c7faa398620 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_config.c  -o ${OBJECTDIR}/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_config.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_app.o: usb_app.c  .generated_files/flags/default/d9c8aa7a43faa1233bc3fd7f3823568e75f34181 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_app.o.d 
	@${RM} ${OBJECTDIR}/usb_app.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_app.c  -o ${OBJECTDIR}/usb_app.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_app.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"

${OBJECTDIR}/keyboard.o: keyboard.c  .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keyboard.o.d 
	@${RM} ${OBJECTDIR}/keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  keyboard.c  -o ${OBJECTDIR}/keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/keyboard.o.d"        -g -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)   -mreserve=data@0x800:0x84F   -Wl,,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}/xc16-bin2hex ${DISTDIR}/UbiComp-Pic24-EncryptionMachine.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a    -mdfp="${DFP_DIR}/xc16" 
	
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
