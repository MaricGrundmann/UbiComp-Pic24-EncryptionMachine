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
SOURCEFILES_QUOTED_IF_SPACED=SH1101A.c RGBLeds.c TouchSense.c main.c storage.c cipher.c menu.c mla_usb/src/usb_host.c mla_usb/src/usb_hal_pic24f.c mla_usb/src/usb_host_hid.c mla_usb/src/usb_host_hid_parser.c mla_usb/src/usb_host_msd.c mla_usb/src/usb_host_msd_scsi.c mla_fileio/src/fileio.c usb_config.c usb_app.c keyboard.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/SH1101A.o ${OBJECTDIR}/RGBLeds.o ${OBJECTDIR}/TouchSense.o ${OBJECTDIR}/main.o ${OBJECTDIR}/storage.o ${OBJECTDIR}/cipher.o ${OBJECTDIR}/menu.o ${OBJECTDIR}/mla_usb/src/usb_host.o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o ${OBJECTDIR}/mla_fileio/src/fileio.o ${OBJECTDIR}/usb_config.o ${OBJECTDIR}/usb_app.o ${OBJECTDIR}/keyboard.o
POSSIBLE_DEPFILES=${OBJECTDIR}/SH1101A.o.d ${OBJECTDIR}/RGBLeds.o.d ${OBJECTDIR}/TouchSense.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/storage.o.d ${OBJECTDIR}/cipher.o.d ${OBJECTDIR}/menu.o.d ${OBJECTDIR}/mla_usb/src/usb_host.o.d ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d ${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d ${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d ${OBJECTDIR}/mla_fileio/src/fileio.o.d ${OBJECTDIR}/usb_config.o.d ${OBJECTDIR}/usb_app.o.d ${OBJECTDIR}/keyboard.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/SH1101A.o ${OBJECTDIR}/RGBLeds.o ${OBJECTDIR}/TouchSense.o ${OBJECTDIR}/main.o ${OBJECTDIR}/storage.o ${OBJECTDIR}/cipher.o ${OBJECTDIR}/menu.o ${OBJECTDIR}/mla_usb/src/usb_host.o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o ${OBJECTDIR}/mla_fileio/src/fileio.o ${OBJECTDIR}/usb_config.o ${OBJECTDIR}/usb_app.o ${OBJECTDIR}/keyboard.o

# Source Files
SOURCEFILES=SH1101A.c RGBLeds.c TouchSense.c main.c storage.c cipher.c menu.c mla_usb/src/usb_host.c mla_usb/src/usb_hal_pic24f.c mla_usb/src/usb_host_hid.c mla_usb/src/usb_host_hid_parser.c mla_usb/src/usb_host_msd.c mla_usb/src/usb_host_msd_scsi.c mla_fileio/src/fileio.c usb_config.c usb_app.c keyboard.c



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
${OBJECTDIR}/SH1101A.o: SH1101A.c  .generated_files/flags/default/61927ce323aa7eccdc89747ea6e9ece08f195688 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SH1101A.o.d 
	@${RM} ${OBJECTDIR}/SH1101A.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  SH1101A.c  -o ${OBJECTDIR}/SH1101A.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/SH1101A.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/RGBLeds.o: RGBLeds.c  .generated_files/flags/default/cd518b1198e2e974dad65555892d1c28ced8131b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RGBLeds.o.d 
	@${RM} ${OBJECTDIR}/RGBLeds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  RGBLeds.c  -o ${OBJECTDIR}/RGBLeds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/RGBLeds.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TouchSense.o: TouchSense.c  .generated_files/flags/default/d4005e899fc193671d5e83386a2de3ba446a5b66 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchSense.o.d 
	@${RM} ${OBJECTDIR}/TouchSense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  TouchSense.c  -o ${OBJECTDIR}/TouchSense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TouchSense.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/1bf2fdcb951cc31a26bd9a394dd6d60b05c260d9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/storage.o: storage.c  .generated_files/flags/default/f8d4d61fbee98fe87d7fee49208228fd2e521775 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/storage.o.d 
	@${RM} ${OBJECTDIR}/storage.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  storage.c  -o ${OBJECTDIR}/storage.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/storage.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/cipher.o: cipher.c  .generated_files/flags/default/68a925389279e1291ede8f8807a049761e200c77 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cipher.o.d 
	@${RM} ${OBJECTDIR}/cipher.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  cipher.c  -o ${OBJECTDIR}/cipher.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/cipher.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/menu.o: menu.c  .generated_files/flags/default/a2ee89155cd0cb47e21627f0df47f9fc0bdd5403 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/menu.o.d 
	@${RM} ${OBJECTDIR}/menu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  menu.c  -o ${OBJECTDIR}/menu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/menu.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host.o: mla_usb/src/usb_host.c  .generated_files/flags/default/ce0236d5491b692a1fdbd3b4c86d71f3fedb3b72 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host.c  -o ${OBJECTDIR}/mla_usb/src/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o: mla_usb/src/usb_hal_pic24f.c  .generated_files/flags/default/96a8bcb0014157ebf9e0eb1dcb1ee03416441638 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_hal_pic24f.c  -o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid.o: mla_usb/src/usb_host_hid.c  .generated_files/flags/default/1aa9a6f81f01b184930a5b3416138e526b4595de .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o: mla_usb/src/usb_host_hid_parser.c  .generated_files/flags/default/412d5635320d94a8b9bc07b733e2f68d689a34ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid_parser.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd.o: mla_usb/src/usb_host_msd.c  .generated_files/flags/default/ad4b7b696cf8bb1533986e044e6693bf43ec8b3c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o: mla_usb/src/usb_host_msd_scsi.c  .generated_files/flags/default/c3777ddc9fe513f0bcf6fe1cbfdc458ef9d6f4dd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd_scsi.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_fileio/src/fileio.o: mla_fileio/src/fileio.c  .generated_files/flags/default/e58e7b55a47da4c6c301c9cca86472033649c2b7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_fileio/src" 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o.d 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_fileio/src/fileio.c  -o ${OBJECTDIR}/mla_fileio/src/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_fileio/src/fileio.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_config.o: usb_config.c  .generated_files/flags/default/dafb3499833da9f23769e486189956cd4f0ab3b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_config.c  -o ${OBJECTDIR}/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_config.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_app.o: usb_app.c  .generated_files/flags/default/b30b1aa25740e2ecb570edb9963155c3529d48ca .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_app.o.d 
	@${RM} ${OBJECTDIR}/usb_app.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_app.c  -o ${OBJECTDIR}/usb_app.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_app.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/keyboard.o: keyboard.c  .generated_files/flags/default/467f773db12cdedf3583eea9d2b3221da6a00eaa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keyboard.o.d 
	@${RM} ${OBJECTDIR}/keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  keyboard.c  -o ${OBJECTDIR}/keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/keyboard.o.d"      -g -D__DEBUG     -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/SH1101A.o: SH1101A.c  .generated_files/flags/default/ee82746f4f26354e1dc3c5943c36f2ebaf97c2ce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/SH1101A.o.d 
	@${RM} ${OBJECTDIR}/SH1101A.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  SH1101A.c  -o ${OBJECTDIR}/SH1101A.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/SH1101A.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/RGBLeds.o: RGBLeds.c  .generated_files/flags/default/b589f843d06948a12273466c8f68619db0574e3b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RGBLeds.o.d 
	@${RM} ${OBJECTDIR}/RGBLeds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  RGBLeds.c  -o ${OBJECTDIR}/RGBLeds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/RGBLeds.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TouchSense.o: TouchSense.c  .generated_files/flags/default/641cbad2a77cbde47c20191a75d2daee6bcef783 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TouchSense.o.d 
	@${RM} ${OBJECTDIR}/TouchSense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  TouchSense.c  -o ${OBJECTDIR}/TouchSense.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TouchSense.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/4493e31238cd60ee68b1cb2aadcb9844cdf9af64 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/storage.o: storage.c  .generated_files/flags/default/f53086235535905674befe2d4aece28a31cd7fdb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/storage.o.d 
	@${RM} ${OBJECTDIR}/storage.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  storage.c  -o ${OBJECTDIR}/storage.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/storage.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/cipher.o: cipher.c  .generated_files/flags/default/add698f0be1848f23609f82a04f7173fbd05ba7e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/cipher.o.d 
	@${RM} ${OBJECTDIR}/cipher.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  cipher.c  -o ${OBJECTDIR}/cipher.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/cipher.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/menu.o: menu.c  .generated_files/flags/default/15065ec87f1dd0c85df4fade06c395879ab030c7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/menu.o.d 
	@${RM} ${OBJECTDIR}/menu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  menu.c  -o ${OBJECTDIR}/menu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/menu.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host.o: mla_usb/src/usb_host.c  .generated_files/flags/default/ef1e44139515d9fd5d79d9fda37602018e590443 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host.c  -o ${OBJECTDIR}/mla_usb/src/usb_host.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o: mla_usb/src/usb_hal_pic24f.c  .generated_files/flags/default/eadec2681b968377fd5bc7ec20d0cdc7b8b95fc9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_hal_pic24f.c  -o ${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_hal_pic24f.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid.o: mla_usb/src/usb_host_hid.c  .generated_files/flags/default/67bd84e71f5d42ddb475adf0161c4929eba092df .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o: mla_usb/src/usb_host_hid_parser.c  .generated_files/flags/default/f6f82b44cfa391b7ad059fdafccf2896dd752d02 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_hid_parser.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_hid_parser.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd.o: mla_usb/src/usb_host_msd.c  .generated_files/flags/default/7a7503b142c35cea7b7fef69a94aa2b2781e1207 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o: mla_usb/src/usb_host_msd_scsi.c  .generated_files/flags/default/ea8f85eab3b4cc67c1ae5b01b15547d8f2dc9243 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_usb/src" 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d 
	@${RM} ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_usb/src/usb_host_msd_scsi.c  -o ${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_usb/src/usb_host_msd_scsi.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mla_fileio/src/fileio.o: mla_fileio/src/fileio.c  .generated_files/flags/default/776223d40d77bf0389fbfc04feba5b48a95911e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mla_fileio/src" 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o.d 
	@${RM} ${OBJECTDIR}/mla_fileio/src/fileio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mla_fileio/src/fileio.c  -o ${OBJECTDIR}/mla_fileio/src/fileio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mla_fileio/src/fileio.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_config.o: usb_config.c  .generated_files/flags/default/529b66581d62782d33a18032bef96ba14b838bb1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_config.o.d 
	@${RM} ${OBJECTDIR}/usb_config.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_config.c  -o ${OBJECTDIR}/usb_config.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_config.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/usb_app.o: usb_app.c  .generated_files/flags/default/a757f3bfcb457cbbb65fe3b377b8fa36550b878b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/usb_app.o.d 
	@${RM} ${OBJECTDIR}/usb_app.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  usb_app.c  -o ${OBJECTDIR}/usb_app.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/usb_app.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/keyboard.o: keyboard.c  .generated_files/flags/default/567f825557bbfb801b8196e570dba252f136339f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/keyboard.o.d 
	@${RM} ${OBJECTDIR}/keyboard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  keyboard.c  -o ${OBJECTDIR}/keyboard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/keyboard.o.d"        -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -O0 -I"." -I"mla_usb/inc" -I"mla_fileio/inc" -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
