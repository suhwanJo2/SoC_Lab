@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Mon Oct 07 23:15:31 +0900 2024
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto d361e4b8d02f44a585cf97a85d09b4a8 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_WB_behav xil_defaultlib.tb_WB xil_defaultlib.glbl -log elaborate.log"
call xelab  -wto d361e4b8d02f44a585cf97a85d09b4a8 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_WB_behav xil_defaultlib.tb_WB xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
