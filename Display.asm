
_txttoram:

	CLRF        R3 
L_txttoram0:
	MOVLW       txttoram_txt_L0+0
	MOVWF       R1 
	MOVLW       hi_addr(txttoram_txt_L0+0)
	MOVWF       R2 
	MOVF        R3, 0 
	ADDWF       R1, 1 
	BTFSC       STATUS+0, 0 
	INCF        R2, 1 
	MOVF        R3, 0 
	ADDWF       FARG_txttoram_ctxt+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_txttoram_ctxt+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_txttoram_ctxt+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_txttoram1
	INCF        R3, 1 
	GOTO        L_txttoram0
L_txttoram1:
	MOVLW       txttoram_txt_L0+0
	MOVWF       R0 
	MOVLW       hi_addr(txttoram_txt_L0+0)
	MOVWF       R1 
L_end_txttoram:
	RETURN      0
; end of _txttoram

_txttoram2:

	CLRF        R3 
L_txttoram23:
	MOVLW       txttoram2_txt_L0+0
	MOVWF       R1 
	MOVLW       hi_addr(txttoram2_txt_L0+0)
	MOVWF       R2 
	MOVF        R3, 0 
	ADDWF       R1, 1 
	BTFSC       STATUS+0, 0 
	INCF        R2, 1 
	MOVF        R3, 0 
	ADDWF       FARG_txttoram2_ctxt+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       0
	ADDWFC      FARG_txttoram2_ctxt+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      FARG_txttoram2_ctxt+2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_txttoram24
	INCF        R3, 1 
	GOTO        L_txttoram23
L_txttoram24:
	MOVLW       txttoram2_txt_L0+0
	MOVWF       R0 
	MOVLW       hi_addr(txttoram2_txt_L0+0)
	MOVWF       R1 
L_end_txttoram2:
	RETURN      0
; end of _txttoram2

_ftswd:

	CLRF        ftswd_i_L0+0 
	CLRF        ftswd_tmp_L0+0 
	MOVF        FARG_ftswd_dec+0, 0 
	MOVWF       ftswd_len_L0+0 
	MOVLW       ?ICSftswd_p_L0+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICSftswd_p_L0+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICSftswd_p_L0+0)
	MOVWF       TBLPTRU 
	MOVLW       ftswd_p_L0+0
	MOVWF       FSR1 
	MOVLW       hi_addr(ftswd_p_L0+0)
	MOVWF       FSR1H 
	MOVLW       40
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVF        FARG_ftswd_dec+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       ftswd_p_L0+0
	ADDWF       R0, 0 
	MOVWF       FLOC__ftswd+0 
	MOVLW       hi_addr(ftswd_p_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__ftswd+1 
	MOVFF       FLOC__ftswd+0, FSR0
	MOVFF       FLOC__ftswd+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _longword2double+0, 0
	MOVF        FARG_ftswd_f+0, 0 
	MOVWF       R4 
	MOVF        FARG_ftswd_f+1, 0 
	MOVWF       R5 
	MOVF        FARG_ftswd_f+2, 0 
	MOVWF       R6 
	MOVF        FARG_ftswd_f+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2longword+0, 0
	MOVF        R0, 0 
	MOVWF       ftswd_n_L0+0 
	MOVF        R1, 0 
	MOVWF       ftswd_n_L0+1 
	MOVF        R2, 0 
	MOVWF       ftswd_n_L0+2 
	MOVF        R3, 0 
	MOVWF       ftswd_n_L0+3 
	MOVFF       FLOC__ftswd+0, FSR0
	MOVFF       FLOC__ftswd+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	MOVF        POSTINC0+0, 0 
	MOVWF       R8 
	MOVF        R8, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ftswd182
	MOVF        R7, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ftswd182
	MOVF        R6, 0 
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ftswd182
	MOVF        R5, 0 
	SUBWF       R0, 0 
L__ftswd182:
	BTFSC       STATUS+0, 0 
	GOTO        L_ftswd6
	MOVLW       1
	MOVWF       ftswd_tmp_L0+0 
L_ftswd6:
L_ftswd7:
	MOVLW       0
	BTFSC       ftswd_i_L0+0, 7 
	MOVLW       255
	MOVWF       R0 
	MOVLW       0
	XORWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ftswd183
	MOVF        FARG_ftswd_dec+0, 0 
	XORWF       ftswd_i_L0+0, 0 
L__ftswd183:
	BTFSS       STATUS+0, 2 
	GOTO        L_ftswd10
	MOVF        ftswd_i_L0+0, 0 
	ADDWF       FARG_ftswd_txt+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	BTFSC       ftswd_i_L0+0, 7 
	MOVLW       255
	ADDWFC      FARG_ftswd_txt+1, 0 
	MOVWF       FSR1H 
	MOVLW       46
	MOVWF       POSTINC1+0 
	INCF        ftswd_i_L0+0, 1 
	GOTO        L_ftswd9
L_ftswd10:
	MOVF        ftswd_i_L0+0, 0 
	ADDWF       FARG_ftswd_txt+0, 0 
	MOVWF       FLOC__ftswd+0 
	MOVLW       0
	BTFSC       ftswd_i_L0+0, 7 
	MOVLW       255
	ADDWFC      FARG_ftswd_txt+1, 0 
	MOVWF       FLOC__ftswd+1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        ftswd_n_L0+0, 0 
	MOVWF       R0 
	MOVF        ftswd_n_L0+1, 0 
	MOVWF       R1 
	MOVF        ftswd_n_L0+2, 0 
	MOVWF       R2 
	MOVF        ftswd_n_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R10, 0 
	MOVWF       R2 
	MOVF        R11, 0 
	MOVWF       R3 
	MOVLW       48
	ADDWF       R0, 1 
	MOVFF       FLOC__ftswd+0, FSR1
	MOVFF       FLOC__ftswd+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	INCF        ftswd_i_L0+0, 1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	MOVF        ftswd_n_L0+0, 0 
	MOVWF       R0 
	MOVF        ftswd_n_L0+1, 0 
	MOVWF       R1 
	MOVF        ftswd_n_L0+2, 0 
	MOVWF       R2 
	MOVF        ftswd_n_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_U+0, 0
	MOVF        R0, 0 
	MOVWF       ftswd_n_L0+0 
	MOVF        R1, 0 
	MOVWF       ftswd_n_L0+1 
	MOVF        R2, 0 
	MOVWF       ftswd_n_L0+2 
	MOVF        R3, 0 
	MOVWF       ftswd_n_L0+3 
L_ftswd9:
	MOVF        ftswd_len_L0+0, 0 
	MOVWF       R1 
	DECF        ftswd_len_L0+0, 1 
	MOVLW       128
	XORLW       0
	MOVWF       R0 
	MOVLW       128
	XORWF       R1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_ftswd7
	MOVF        ftswd_n_L0+0, 0 
	IORWF       ftswd_n_L0+1, 0 
	IORWF       ftswd_n_L0+2, 0 
	IORWF       ftswd_n_L0+3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_ftswd7
L__ftswd161:
	MOVF        ftswd_tmp_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_ftswd13
	MOVF        ftswd_i_L0+0, 0 
	ADDWF       FARG_ftswd_txt+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	BTFSC       ftswd_i_L0+0, 7 
	MOVLW       255
	ADDWFC      FARG_ftswd_txt+1, 0 
	MOVWF       FSR1H 
	MOVLW       48
	MOVWF       POSTINC1+0 
	INCF        ftswd_i_L0+0, 1 
L_ftswd13:
	MOVF        ftswd_i_L0+0, 0 
	ADDWF       FARG_ftswd_txt+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	BTFSC       ftswd_i_L0+0, 7 
	MOVLW       255
	ADDWFC      FARG_ftswd_txt+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	DECF        ftswd_i_L0+0, 0 
	MOVWF       ftswd_j_L0+0 
	CLRF        ftswd_i_L0+0 
L_ftswd14:
	MOVLW       128
	XORWF       ftswd_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       ftswd_j_L0+0, 0 
	SUBWF       R0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_ftswd15
	MOVF        ftswd_i_L0+0, 0 
	ADDWF       FARG_ftswd_txt+0, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       ftswd_i_L0+0, 7 
	MOVLW       255
	ADDWFC      FARG_ftswd_txt+1, 0 
	MOVWF       R1 
	MOVFF       R0, FSR0
	MOVFF       R1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       ftswd_tmp_L0+0 
	MOVF        ftswd_j_L0+0, 0 
	ADDWF       FARG_ftswd_txt+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	BTFSC       ftswd_j_L0+0, 7 
	MOVLW       255
	ADDWFC      FARG_ftswd_txt+1, 0 
	MOVWF       FSR0H 
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        ftswd_j_L0+0, 0 
	ADDWF       FARG_ftswd_txt+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	BTFSC       ftswd_j_L0+0, 7 
	MOVLW       255
	ADDWFC      FARG_ftswd_txt+1, 0 
	MOVWF       FSR1H 
	MOVF        ftswd_tmp_L0+0, 0 
	MOVWF       POSTINC1+0 
	INCF        ftswd_i_L0+0, 1 
	DECF        ftswd_j_L0+0, 1 
	GOTO        L_ftswd14
L_ftswd15:
L_end_ftswd:
	RETURN      0
; end of _ftswd

_steppertest:

	CLRF        _Pulse+0 
	CLRF        _Pulse+1 
L_steppertest17:
	MOVLW       128
	XORWF       FARG_steppertest_NoOfPulses+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _Pulse+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__steppertest185
	MOVF        _Pulse+0, 0 
	SUBWF       FARG_steppertest_NoOfPulses+0, 0 
L__steppertest185:
	BTFSS       STATUS+0, 0 
	GOTO        L_steppertest18
	BSF         LATC+0, 1 
	MOVLW       70
	MOVWF       FARG_Delay_Cyc_cycles_div_by_10+0 
	CALL        _Delay_Cyc+0, 0
	BCF         LATC+0, 1 
	MOVLW       70
	MOVWF       FARG_Delay_Cyc_cycles_div_by_10+0 
	CALL        _Delay_Cyc+0, 0
	INFSNZ      _Pulse+0, 1 
	INCF        _Pulse+1, 1 
	GOTO        L_steppertest17
L_steppertest18:
L_end_steppertest:
	RETURN      0
; end of _steppertest

_stepper:

	CLRF        _Pulse+0 
	CLRF        _Pulse+1 
L_stepper20:
	MOVLW       128
	XORWF       FARG_stepper_NoOfPulses+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _Pulse+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper187
	MOVF        _Pulse+0, 0 
	SUBWF       FARG_stepper_NoOfPulses+0, 0 
L__stepper187:
	BTFSS       STATUS+0, 0 
	GOTO        L_stepper21
	BSF         LATC+0, 1 
	MOVLW       83
	MOVWF       R13, 0
L_stepper23:
	DECFSZ      R13, 1, 1
	BRA         L_stepper23
	BCF         LATC+0, 1 
	MOVLW       83
	MOVWF       R13, 0
L_stepper24:
	DECFSZ      R13, 1, 1
	BRA         L_stepper24
	INFSNZ      _Pulse+0, 1 
	INCF        _Pulse+1, 1 
	GOTO        L_stepper20
L_stepper21:
L_end_stepper:
	RETURN      0
; end of _stepper

_main:

	CLRF        TRISA+0 
	MOVLW       255
	MOVWF       TRISB+0 
	MOVLW       8
	MOVWF       TRISC+0 
	MOVLW       15
	MOVWF       ADCON1+0 
	MOVLW       7
	MOVWF       CMCON+0 
	CLRF        PORTA+0 
	CLRF        PORTB+0 
	CLRF        PORTC+0 
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
	NOP
	NOP
	CALL        _Lcd_Init+0, 0
	BCF         WDTCON+0, 0 
	BSF         INTCON+0, 3 
	BCF         INTCON+0, 0 
	BCF         INTCON2+0, 0 
	BSF         INTCON+0, 4 
	BCF         INTCON+0, 1 
	BSF         INTCON3+0, 3 
	BCF         INTCON3+0, 0 
	BSF         INTCON3+0, 4 
	BCF         INTCON3+0, 1 
	BSF         INTCON+0, 7 
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	DECFSZ      R11, 1, 1
	BRA         L_main26
	NOP
	NOP
	BCF         UCON+0, 3 
	BSF         UCFG+0, 3 
	BCF         PORTC+0, 0 
	CLRF        _RunStepper+0 
	CLRF        _RunStepper+1 
	BCF         PORTC+0, 7 
	BCF         PORTC+0, 6 
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr28_Display+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr28_Display+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr29_Display+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr29_Display+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
	NOP
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr30_Display+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr30_Display+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr31_Display+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr31_Display+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main28:
	DECFSZ      R13, 1, 1
	BRA         L_main28
	DECFSZ      R12, 1, 1
	BRA         L_main28
	DECFSZ      R11, 1, 1
	BRA         L_main28
	NOP
	NOP
	CLRF        _CountingOn+0 
	CLRF        _CountingOn+1 
	MOVLW       30
	MOVWF       _MaxMenu+0 
	MOVLW       0
	MOVWF       _MaxMenu+1 
	CLRF        _MenuNo+0 
	CLRF        _MenuNo+1 
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       88
	MOVWF       R12, 0
	MOVLW       89
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
	NOP
	NOP
L_main30:
	MOVLW       1
	MOVWF       _EnableInputs+0 
	MOVLW       0
	MOVWF       _EnableInputs+1 
	MOVF        _MenuNo+1, 0 
	SUBWF       _MaxMenu+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main189
	MOVF        _MenuNo+0, 0 
	SUBWF       _MaxMenu+0, 0 
L__main189:
	BTFSC       STATUS+0, 0 
	GOTO        L_main33
	CLRF        _MenuNo+0 
	CLRF        _MenuNo+1 
L_main33:
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	GOTO        L_main34
L_main36:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main37:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main38:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_FDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_FDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+3 
	MOVF        _Unit+2, 0 
	MOVWF       FARG_FDisplay_c+0 
	MOVF        _Unit+3, 0 
	MOVWF       FARG_FDisplay_c+1 
	CALL        _FDisplay+0, 0
	GOTO        L_main35
L_main39:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+4, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+5, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main40:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+4, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+5, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main41:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+4, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+5, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main42:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+4, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+5, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main43:
	CALL        _Compute+0, 0
	GOTO        L_main35
L_main44:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+14, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+15, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main45:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_FDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_FDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+3 
	MOVF        _Unit+2, 0 
	MOVWF       FARG_FDisplay_c+0 
	MOVF        _Unit+3, 0 
	MOVWF       FARG_FDisplay_c+1 
	CALL        _FDisplay+0, 0
	GOTO        L_main35
L_main46:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+4, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+5, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main47:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+6, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+7, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main48:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+6, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+7, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main49:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+8, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+9, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main50:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        _Unit+8, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+9, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main51:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_FDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_FDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+3 
	MOVF        _Unit+10, 0 
	MOVWF       FARG_FDisplay_c+0 
	MOVF        _Unit+11, 0 
	MOVWF       FARG_FDisplay_c+1 
	CALL        _FDisplay+0, 0
	GOTO        L_main35
L_main52:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_FDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_FDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+3 
	MOVF        _Unit+10, 0 
	MOVWF       FARG_FDisplay_c+0 
	MOVF        _Unit+11, 0 
	MOVWF       FARG_FDisplay_c+1 
	CALL        _FDisplay+0, 0
	GOTO        L_main35
L_main53:
	MOVLW       3
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R4 
	MOVF        _MenuNo+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       _ParameterName+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_ParameterName+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_FDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_FDisplay_a+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FDisplay_b+3 
	MOVF        _Unit+12, 0 
	MOVWF       FARG_FDisplay_c+0 
	MOVF        _Unit+13, 0 
	MOVWF       FARG_FDisplay_c+1 
	CALL        _FDisplay+0, 0
	GOTO        L_main35
L_main54:
	MOVLW       _LCD_txt7+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt7+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt7+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt8+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt8+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt8+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main55:
	MOVLW       _LCD_txt2+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt2+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt2+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt1+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt1+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt1+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	MOVLW       0
	XORWF       _RunStepper+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main190
	MOVLW       1
	XORWF       _RunStepper+0, 0 
L__main190:
	BTFSS       STATUS+0, 2 
	GOTO        L_main56
	BCF         LATC+0, 0 
	CLRF        _RunStepper+0 
	CLRF        _RunStepper+1 
	MOVLW       150
	MOVWF       FARG_steppertest_NoOfPulses+0 
	MOVLW       0
	MOVWF       FARG_steppertest_NoOfPulses+1 
	CALL        _steppertest+0, 0
L_main56:
	GOTO        L_main35
L_main57:
	MOVLW       _LCD_txt12+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt12+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt12+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt6+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt6+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt6+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main58:
	MOVLW       _LCD_txt11+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt11+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt11+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt8+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt8+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt8+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	MOVF        _FParameter+44, 0 
	MOVWF       R0 
	MOVF        _FParameter+45, 0 
	MOVWF       R1 
	MOVF        _FParameter+46, 0 
	MOVWF       R2 
	MOVF        _FParameter+47, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WindingProcess+0 
	MOVF        R1, 0 
	MOVWF       FARG_WindingProcess+1 
	MOVF        _FParameter+88, 0 
	MOVWF       R0 
	MOVF        _FParameter+89, 0 
	MOVWF       R1 
	MOVF        _FParameter+90, 0 
	MOVWF       R2 
	MOVF        _FParameter+91, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WindingProcess+0 
	MOVF        R1, 0 
	MOVWF       FARG_WindingProcess+1 
	MOVF        _FParameter+72, 0 
	MOVWF       FARG_WindingProcess+0 
	MOVF        _FParameter+73, 0 
	MOVWF       FARG_WindingProcess+1 
	MOVF        _FParameter+74, 0 
	MOVWF       FARG_WindingProcess+2 
	MOVF        _FParameter+75, 0 
	MOVWF       FARG_WindingProcess+3 
	CALL        _WindingProcess+0, 0
	GOTO        L_main35
L_main59:
	MOVLW       _LCD_txt5+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt5+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt5+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt3+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt3+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt3+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main60:
	MOVLW       _LCD_txt9+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt9+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt9+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt10+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt10+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt10+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main61:
	MOVLW       _LCD_txt2+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt2+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt2+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt1+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt1+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt1+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	MOVLW       0
	XORWF       _RunStepper+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main191
	MOVLW       1
	XORWF       _RunStepper+0, 0 
L__main191:
	BTFSS       STATUS+0, 2 
	GOTO        L_main62
	BCF         LATC+0, 0 
	CLRF        _RunStepper+0 
	CLRF        _RunStepper+1 
	MOVLW       150
	MOVWF       FARG_steppertest_NoOfPulses+0 
	MOVLW       0
	MOVWF       FARG_steppertest_NoOfPulses+1 
	CALL        _steppertest+0, 0
L_main62:
	GOTO        L_main35
L_main63:
	MOVLW       _LCD_txt12+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt12+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt12+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt6+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt6+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt6+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main64:
	MOVLW       _LCD_txt11+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt11+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt11+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt10+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt10+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt10+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	MOVF        _FParameter+48, 0 
	MOVWF       R0 
	MOVF        _FParameter+49, 0 
	MOVWF       R1 
	MOVF        _FParameter+50, 0 
	MOVWF       R2 
	MOVF        _FParameter+51, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WindingProcess+0 
	MOVF        R1, 0 
	MOVWF       FARG_WindingProcess+1 
	MOVF        _FParameter+92, 0 
	MOVWF       R0 
	MOVF        _FParameter+93, 0 
	MOVWF       R1 
	MOVF        _FParameter+94, 0 
	MOVWF       R2 
	MOVF        _FParameter+95, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_WindingProcess+0 
	MOVF        R1, 0 
	MOVWF       FARG_WindingProcess+1 
	MOVF        _FParameter+76, 0 
	MOVWF       FARG_WindingProcess+0 
	MOVF        _FParameter+77, 0 
	MOVWF       FARG_WindingProcess+1 
	MOVF        _FParameter+78, 0 
	MOVWF       FARG_WindingProcess+2 
	MOVF        _FParameter+79, 0 
	MOVWF       FARG_WindingProcess+3 
	CALL        _WindingProcess+0, 0
	GOTO        L_main35
L_main65:
	MOVLW       _LCD_txt4+0
	MOVWF       FARG_txttoram2_ctxt+0 
	MOVLW       hi_addr(_LCD_txt4+0)
	MOVWF       FARG_txttoram2_ctxt+1 
	MOVLW       higher_addr(_LCD_txt4+0)
	MOVWF       FARG_txttoram2_ctxt+2 
	CALL        _txttoram2+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVLW       _LCD_txt3+0
	MOVWF       FARG_txttoram_ctxt+0 
	MOVLW       hi_addr(_LCD_txt3+0)
	MOVWF       FARG_txttoram_ctxt+1 
	MOVLW       higher_addr(_LCD_txt3+0)
	MOVWF       FARG_txttoram_ctxt+2 
	CALL        _txttoram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_IDisplay_a+0 
	MOVF        R1, 0 
	MOVWF       FARG_IDisplay_a+1 
	MOVF        _IParameter+14, 0 
	MOVWF       FARG_IDisplay_b+0 
	MOVF        _IParameter+15, 0 
	MOVWF       FARG_IDisplay_b+1 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main35
L_main34:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main192
	MOVLW       0
	XORWF       _MenuNo+0, 0 
L__main192:
	BTFSC       STATUS+0, 2 
	GOTO        L_main36
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main193
	MOVLW       1
	XORWF       _MenuNo+0, 0 
L__main193:
	BTFSC       STATUS+0, 2 
	GOTO        L_main37
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main194
	MOVLW       2
	XORWF       _MenuNo+0, 0 
L__main194:
	BTFSC       STATUS+0, 2 
	GOTO        L_main38
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main195
	MOVLW       3
	XORWF       _MenuNo+0, 0 
L__main195:
	BTFSC       STATUS+0, 2 
	GOTO        L_main39
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main196
	MOVLW       4
	XORWF       _MenuNo+0, 0 
L__main196:
	BTFSC       STATUS+0, 2 
	GOTO        L_main40
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main197
	MOVLW       5
	XORWF       _MenuNo+0, 0 
L__main197:
	BTFSC       STATUS+0, 2 
	GOTO        L_main41
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main198
	MOVLW       6
	XORWF       _MenuNo+0, 0 
L__main198:
	BTFSC       STATUS+0, 2 
	GOTO        L_main42
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main199
	MOVLW       7
	XORWF       _MenuNo+0, 0 
L__main199:
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main200
	MOVLW       8
	XORWF       _MenuNo+0, 0 
L__main200:
	BTFSC       STATUS+0, 2 
	GOTO        L_main44
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main201
	MOVLW       9
	XORWF       _MenuNo+0, 0 
L__main201:
	BTFSC       STATUS+0, 2 
	GOTO        L_main45
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main202
	MOVLW       10
	XORWF       _MenuNo+0, 0 
L__main202:
	BTFSC       STATUS+0, 2 
	GOTO        L_main46
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main203
	MOVLW       11
	XORWF       _MenuNo+0, 0 
L__main203:
	BTFSC       STATUS+0, 2 
	GOTO        L_main47
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main204
	MOVLW       12
	XORWF       _MenuNo+0, 0 
L__main204:
	BTFSC       STATUS+0, 2 
	GOTO        L_main48
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main205
	MOVLW       13
	XORWF       _MenuNo+0, 0 
L__main205:
	BTFSC       STATUS+0, 2 
	GOTO        L_main49
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main206
	MOVLW       14
	XORWF       _MenuNo+0, 0 
L__main206:
	BTFSC       STATUS+0, 2 
	GOTO        L_main50
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main207
	MOVLW       15
	XORWF       _MenuNo+0, 0 
L__main207:
	BTFSC       STATUS+0, 2 
	GOTO        L_main51
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main208
	MOVLW       16
	XORWF       _MenuNo+0, 0 
L__main208:
	BTFSC       STATUS+0, 2 
	GOTO        L_main52
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main209
	MOVLW       17
	XORWF       _MenuNo+0, 0 
L__main209:
	BTFSC       STATUS+0, 2 
	GOTO        L_main53
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main210
	MOVLW       18
	XORWF       _MenuNo+0, 0 
L__main210:
	BTFSC       STATUS+0, 2 
	GOTO        L_main54
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main211
	MOVLW       19
	XORWF       _MenuNo+0, 0 
L__main211:
	BTFSC       STATUS+0, 2 
	GOTO        L_main55
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main212
	MOVLW       20
	XORWF       _MenuNo+0, 0 
L__main212:
	BTFSC       STATUS+0, 2 
	GOTO        L_main57
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main213
	MOVLW       21
	XORWF       _MenuNo+0, 0 
L__main213:
	BTFSC       STATUS+0, 2 
	GOTO        L_main58
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main214
	MOVLW       22
	XORWF       _MenuNo+0, 0 
L__main214:
	BTFSC       STATUS+0, 2 
	GOTO        L_main59
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main215
	MOVLW       23
	XORWF       _MenuNo+0, 0 
L__main215:
	BTFSC       STATUS+0, 2 
	GOTO        L_main60
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main216
	MOVLW       24
	XORWF       _MenuNo+0, 0 
L__main216:
	BTFSC       STATUS+0, 2 
	GOTO        L_main61
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main217
	MOVLW       25
	XORWF       _MenuNo+0, 0 
L__main217:
	BTFSC       STATUS+0, 2 
	GOTO        L_main63
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main218
	MOVLW       26
	XORWF       _MenuNo+0, 0 
L__main218:
	BTFSC       STATUS+0, 2 
	GOTO        L_main64
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main219
	MOVLW       27
	XORWF       _MenuNo+0, 0 
L__main219:
	BTFSC       STATUS+0, 2 
	GOTO        L_main65
L_main35:
	GOTO        L_main30
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

	MOVF        PORTB+0, 0 
	MOVWF       _temp+0 
	MOVLW       0
	MOVWF       _temp+1 
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt68
	MOVLW       0
	XORWF       _EnableInputs+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt222
	MOVLW       1
	XORWF       _EnableInputs+0, 0 
L__interrupt222:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt68
L__interrupt178:
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt69
	MOVLW       1
	SUBWF       _MenuNo+0, 1 
	MOVLW       0
	SUBWFB      _MenuNo+1, 1 
	GOTO        L_interrupt70
L_interrupt72:
	MOVLW       6
	MOVWF       _MenuNo+0 
	MOVLW       0
	MOVWF       _MenuNo+1 
	GOTO        L_interrupt71
L_interrupt73:
	MOVLW       18
	MOVWF       _MenuNo+0 
	MOVLW       0
	MOVWF       _MenuNo+1 
	GOTO        L_interrupt71
L_interrupt74:
	MOVLW       23
	MOVWF       _MenuNo+0 
	MOVLW       0
	MOVWF       _MenuNo+1 
	GOTO        L_interrupt71
L_interrupt70:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt223
	MOVLW       7
	XORWF       _MenuNo+0, 0 
L__interrupt223:
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt72
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt224
	MOVLW       21
	XORWF       _MenuNo+0, 0 
L__interrupt224:
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt73
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt225
	MOVLW       26
	XORWF       _MenuNo+0, 0 
L__interrupt225:
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt74
L_interrupt71:
	MOVLW       0
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt226
	MOVF        _MenuNo+0, 0 
	SUBLW       0
L__interrupt226:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt75
	CLRF        _MenuNo+0 
	CLRF        _MenuNo+1 
L_interrupt75:
L_interrupt69:
L_interrupt68:
	BCF         INTCON+0, 1 
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt78
	MOVLW       0
	XORWF       _EnableInputs+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt227
	MOVLW       1
	XORWF       _EnableInputs+0, 0 
L__interrupt227:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt78
L__interrupt177:
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       150
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt79
	INFSNZ      _MenuNo+0, 1 
	INCF        _MenuNo+1, 1 
	MOVF        _MaxMenu+1, 0 
	SUBWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt228
	MOVF        _MaxMenu+0, 0 
	SUBWF       _MenuNo+0, 0 
L__interrupt228:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt80
	CLRF        _MenuNo+0 
	CLRF        _MenuNo+1 
L_interrupt80:
	MOVLW       0
	SUBWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt229
	MOVLW       7
	SUBWF       _MenuNo+0, 0 
L__interrupt229:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt83
	BTFSC       PORTC+0, 5 
	GOTO        L_interrupt83
L__interrupt176:
	MOVLW       23
	MOVWF       _MenuNo+0 
	MOVLW       0
	MOVWF       _MenuNo+1 
L_interrupt83:
L_interrupt79:
L_interrupt78:
	BCF         INTCON3+0, 0 
	BTFSS       INTCON3+0, 1 
	GOTO        L_interrupt86
	MOVLW       0
	XORWF       _CountingOn+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt230
	MOVLW       1
	XORWF       _CountingOn+0, 0 
L__interrupt230:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt86
	MOVLW       0
	XORWF       _EnableInputs+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt231
	MOVLW       0
	XORWF       _EnableInputs+0, 0 
L__interrupt231:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt86
L__interrupt175:
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       2
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt87
	INFSNZ      _TurnCount+0, 1 
	INCF        _TurnCount+1, 1 
	MOVLW       1
	MOVWF       _RunStepper+0 
	MOVLW       0
	MOVWF       _RunStepper+1 
L_interrupt87:
L_interrupt86:
	BCF         INTCON3+0, 1 
	BTFSS       INTCON+0, 0 
	GOTO        L__interrupt174
	MOVLW       0
	XORWF       _EnableInputs+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt232
	MOVLW       1
	XORWF       _EnableInputs+0, 0 
L__interrupt232:
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt174
	MOVLW       0
	SUBWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt233
	MOVLW       7
	SUBWF       _MenuNo+0, 0 
L__interrupt233:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt174
	GOTO        L__interrupt173
L__interrupt174:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt234
	MOVLW       19
	XORWF       _MenuNo+0, 0 
L__interrupt234:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt173
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt235
	MOVLW       24
	XORWF       _MenuNo+0, 0 
L__interrupt235:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt173
	GOTO        L_interrupt92
L__interrupt173:
	CLRF        R2 
	BTFSC       PORTB+0, 5 
	INCF        R2, 1 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVLW       0
	BTFSC       PORTB+0, 4 
	MOVLW       1
	MOVWF       _state+0 
	MOVF        R0, 0 
	IORWF       _state+0, 1 
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       255
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt93
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt172
	MOVF        _state+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt172
	GOTO        L__interrupt168
L__interrupt172:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt171
	MOVF        _state+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt171
	GOTO        L__interrupt168
L__interrupt171:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt170
	MOVF        _state+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt170
	GOTO        L__interrupt168
L__interrupt170:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt169
	MOVF        _state+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt169
	GOTO        L__interrupt168
L__interrupt169:
	GOTO        L_interrupt104
L__interrupt168:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt236
	MOVLW       2
	XORWF       _MenuNo+0, 0 
L__interrupt236:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt105
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       218
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVFF       FLOC__interrupt+0, FSR1
	MOVFF       FLOC__interrupt+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
	GOTO        L_interrupt106
L_interrupt105:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt237
	MOVLW       2
	XORWF       _MenuNo+0, 0 
L__interrupt237:
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt109
	MOVLW       0
	SUBWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt238
	MOVLW       22
	SUBWF       _MenuNo+0, 0 
L__interrupt238:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt109
L__interrupt167:
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
L_interrupt109:
L_interrupt106:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt239
	MOVLW       19
	XORWF       _MenuNo+0, 0 
L__interrupt239:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt166
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt240
	MOVLW       24
	XORWF       _MenuNo+0, 0 
L__interrupt240:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt166
	GOTO        L_interrupt112
L__interrupt166:
	BTFSS       PORTC+0, 2 
	GOTO        L_interrupt113
	BCF         LATC+0, 2 
L_interrupt113:
	MOVLW       1
	MOVWF       _RunStepper+0 
	MOVLW       0
	MOVWF       _RunStepper+1 
L_interrupt112:
	GOTO        L_interrupt114
L_interrupt104:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt165
	MOVF        _state+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt165
	GOTO        L__interrupt163
L__interrupt165:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt164
	MOVF        _state+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt164
	GOTO        L__interrupt163
L__interrupt164:
	GOTO        L_interrupt121
L__interrupt163:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt241
	MOVLW       2
	XORWF       _MenuNo+0, 0 
L__interrupt241:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt122
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVLW       218
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVFF       FLOC__interrupt+0, FSR1
	MOVFF       FLOC__interrupt+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt123
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _FParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_FParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
L_interrupt123:
	GOTO        L_interrupt124
L_interrupt122:
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	SUBWFB      POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
L_interrupt124:
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       128
	XORWF       R2, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt242
	MOVLW       0
	SUBWF       R1, 0 
L__interrupt242:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt125
	MOVF        _MenuNo+0, 0 
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _IParameter+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_IParameter+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
L_interrupt125:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt243
	MOVLW       19
	XORWF       _MenuNo+0, 0 
L__interrupt243:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt162
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt244
	MOVLW       24
	XORWF       _MenuNo+0, 0 
L__interrupt244:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt162
	GOTO        L_interrupt128
L__interrupt162:
	BTFSC       PORTC+0, 2 
	GOTO        L_interrupt129
	BSF         LATC+0, 2 
L_interrupt129:
	MOVLW       1
	MOVWF       _RunStepper+0 
	MOVLW       0
	MOVWF       _RunStepper+1 
L_interrupt128:
L_interrupt121:
L_interrupt114:
L_interrupt93:
	MOVF        _state+0, 0 
	MOVWF       interrupt_prevState_L1+0 
L_interrupt92:
	MOVF        _temp+0, 0 
	MOVWF       LATB+0 
	BCF         INTCON+0, 0 
L_end_interrupt:
L__interrupt221:
	RETFIE      1
; end of _interrupt

_Compute:

	CLRF        _EnableInputs+0 
	CLRF        _EnableInputs+1 
	MOVF        _IParameter+0, 0 
	MOVWF       Compute_V1_L0+0 
	MOVF        _IParameter+1, 0 
	MOVWF       Compute_V1_L0+1 
	MOVF        _IParameter+2, 0 
	MOVWF       Compute_V2_L0+0 
	MOVF        _IParameter+3, 0 
	MOVWF       Compute_V2_L0+1 
	MOVF        _FParameter+8, 0 
	MOVWF       Compute_I2_L0+0 
	MOVF        _FParameter+9, 0 
	MOVWF       Compute_I2_L0+1 
	MOVF        _FParameter+10, 0 
	MOVWF       Compute_I2_L0+2 
	MOVF        _FParameter+11, 0 
	MOVWF       Compute_I2_L0+3 
	MOVF        _IParameter+6, 0 
	MOVWF       Compute_CoreWidth_L0+0 
	MOVF        _IParameter+7, 0 
	MOVWF       Compute_CoreWidth_L0+1 
	MOVF        _IParameter+8, 0 
	MOVWF       Compute_CoreLength_L0+0 
	MOVF        _IParameter+9, 0 
	MOVWF       Compute_CoreLength_L0+1 
	MOVF        _IParameter+10, 0 
	MOVWF       Compute_WindingHeight_L0+0 
	MOVF        _IParameter+11, 0 
	MOVWF       Compute_WindingHeight_L0+1 
	MOVF        _IParameter+12, 0 
	MOVWF       R0 
	MOVF        _IParameter+13, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_WindingLength_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_WindingLength_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_WindingLength_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_WindingLength_L0+3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_WindingLength_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_WindingLength_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_WindingLength_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_WindingLength_L0+3 
	MOVLW       0
	MOVWF       Compute_microstep_L0+0 
	MOVLW       0
	MOVWF       Compute_microstep_L0+1 
	MOVLW       27
	MOVWF       Compute_microstep_L0+2 
	MOVLW       135
	MOVWF       Compute_microstep_L0+3 
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr32_Display+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr32_Display+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVF        Compute_V2_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_V2_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        Compute_I2_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_I2_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_I2_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_I2_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_Power_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_Power_L0+1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Compute+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Compute+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Compute+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Compute+3 
	MOVF        Compute_V1_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_V1_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__Compute+0, 0 
	MOVWF       R0 
	MOVF        FLOC__Compute+1, 0 
	MOVWF       R1 
	MOVF        FLOC__Compute+2, 0 
	MOVWF       R2 
	MOVF        FLOC__Compute+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_I1_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_I1_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_I1_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_I1_L0+3 
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Compute130:
	DECFSZ      R13, 1, 1
	BRA         L_Compute130
	DECFSZ      R12, 1, 1
	BRA         L_Compute130
	DECFSZ      R11, 1, 1
	BRA         L_Compute130
	NOP
	NOP
	MOVF        Compute_Power_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_Power_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_sqrt_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_sqrt_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_sqrt_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_sqrt_x+3 
	CALL        _sqrt+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_SectionKernel_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_SectionKernel_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_SectionKernel_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_SectionKernel_L0+3 
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Compute131:
	DECFSZ      R13, 1, 1
	BRA         L_Compute131
	DECFSZ      R12, 1, 1
	BRA         L_Compute131
	DECFSZ      R11, 1, 1
	BRA         L_Compute131
	NOP
	NOP
	MOVF        Compute_SectionKernel_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_SectionKernel_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_SectionKernel_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_SectionKernel_L0+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       40
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Compute+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Compute+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Compute+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Compute+3 
	MOVF        Compute_V1_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_V1_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        FLOC__Compute+0, 0 
	MOVWF       R4 
	MOVF        FLOC__Compute+1, 0 
	MOVWF       R5 
	MOVF        FLOC__Compute+2, 0 
	MOVWF       R6 
	MOVF        FLOC__Compute+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Compute+4 
	MOVF        R1, 0 
	MOVWF       FLOC__Compute+5 
	MOVF        R2, 0 
	MOVWF       FLOC__Compute+6 
	MOVF        R3, 0 
	MOVWF       FLOC__Compute+7 
	MOVF        FLOC__Compute+4, 0 
	MOVWF       Compute_NoOfTurns1_L0+0 
	MOVF        FLOC__Compute+5, 0 
	MOVWF       Compute_NoOfTurns1_L0+1 
	MOVF        FLOC__Compute+6, 0 
	MOVWF       Compute_NoOfTurns1_L0+2 
	MOVF        FLOC__Compute+7, 0 
	MOVWF       Compute_NoOfTurns1_L0+3 
	MOVF        Compute_V2_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_V2_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        FLOC__Compute+0, 0 
	MOVWF       R4 
	MOVF        FLOC__Compute+1, 0 
	MOVWF       R5 
	MOVF        FLOC__Compute+2, 0 
	MOVWF       R6 
	MOVF        FLOC__Compute+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Compute+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Compute+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Compute+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Compute+3 
	MOVF        FLOC__Compute+0, 0 
	MOVWF       Compute_NoOfTurns2_L0+0 
	MOVF        FLOC__Compute+1, 0 
	MOVWF       Compute_NoOfTurns2_L0+1 
	MOVF        FLOC__Compute+2, 0 
	MOVWF       Compute_NoOfTurns2_L0+2 
	MOVF        FLOC__Compute+3, 0 
	MOVWF       Compute_NoOfTurns2_L0+3 
	MOVF        FLOC__Compute+4, 0 
	MOVWF       R0 
	MOVF        FLOC__Compute+5, 0 
	MOVWF       R1 
	MOVF        FLOC__Compute+6, 0 
	MOVWF       R2 
	MOVF        FLOC__Compute+7, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_NoOfTurns1_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_NoOfTurns1_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_NoOfTurns1_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_NoOfTurns1_L0+3 
	MOVF        FLOC__Compute+0, 0 
	MOVWF       R0 
	MOVF        FLOC__Compute+1, 0 
	MOVWF       R1 
	MOVF        FLOC__Compute+2, 0 
	MOVWF       R2 
	MOVF        FLOC__Compute+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_NoOfTurns2_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_NoOfTurns2_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_NoOfTurns2_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_NoOfTurns2_L0+3 
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Compute132:
	DECFSZ      R13, 1, 1
	BRA         L_Compute132
	DECFSZ      R12, 1, 1
	BRA         L_Compute132
	DECFSZ      R11, 1, 1
	BRA         L_Compute132
	NOP
	NOP
	MOVLW       18
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_Compute133:
	MOVLW       4
	MOVWF       R2 
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__Compute246:
	BZ          L__Compute247
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Compute246
L__Compute247:
	MOVLW       _AWG+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_AWG+0)
	ADDWFC      R1, 1 
	MOVLW       12
	ADDWF       R0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R4 
	MOVF        POSTINC2+0, 0 
	MOVWF       R5 
	MOVF        POSTINC2+0, 0 
	MOVWF       R6 
	MOVF        POSTINC2+0, 0 
	MOVWF       R7 
	MOVF        Compute_I1_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_I1_L0+1, 0 
	MOVWF       R1 
	MOVF        Compute_I1_L0+2, 0 
	MOVWF       R2 
	MOVF        Compute_I1_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Compute136
	MOVLW       1
	SUBWF       _i+0, 0 
	MOVWF       R3 
	MOVLW       0
	SUBWFB      _i+1, 0 
	MOVWF       R4 
	MOVLW       4
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__Compute248:
	BZ          L__Compute249
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Compute248
L__Compute249:
	MOVLW       _AWG+0
	ADDWF       R0, 0 
	MOVWF       FLOC__Compute+0 
	MOVLW       hi_addr(_AWG+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__Compute+1 
	MOVFF       FLOC__Compute+0, FSR0
	MOVFF       FLOC__Compute+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_PrimaryGauge_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_PrimaryGauge_L0+1 
	MOVLW       4
	ADDWF       FLOC__Compute+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FLOC__Compute+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        Compute_microstep_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_microstep_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_microstep_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_microstep_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_Pulse1st_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_Pulse1st_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_Pulse1st_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_Pulse1st_L0+3 
	MOVLW       4
	ADDWF       FLOC__Compute+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FLOC__Compute+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R4 
	MOVF        POSTINC2+0, 0 
	MOVWF       R5 
	MOVF        POSTINC2+0, 0 
	MOVWF       R6 
	MOVF        POSTINC2+0, 0 
	MOVWF       R7 
	MOVF        Compute_WindingLength_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_WindingLength_L0+1, 0 
	MOVWF       R1 
	MOVF        Compute_WindingLength_L0+2, 0 
	MOVWF       R2 
	MOVF        Compute_WindingLength_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_TurnsPerLayer1_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_TurnsPerLayer1_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_TurnsPerLayer1_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_TurnsPerLayer1_L0+3 
	MOVLW       4
	ADDWF       FLOC__Compute+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FLOC__Compute+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       Compute_diameter1_L0+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       Compute_diameter1_L0+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       Compute_diameter1_L0+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       Compute_diameter1_L0+3 
	GOTO        L_Compute134
L_Compute136:
	MOVLW       1
	SUBWF       _i+0, 1 
	MOVLW       0
	SUBWFB      _i+1, 1 
	GOTO        L_Compute133
L_Compute134:
	MOVLW       18
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_Compute137:
	MOVLW       4
	MOVWF       R2 
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__Compute250:
	BZ          L__Compute251
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Compute250
L__Compute251:
	MOVLW       _AWG+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(_AWG+0)
	ADDWFC      R1, 1 
	MOVLW       12
	ADDWF       R0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R4 
	MOVF        POSTINC2+0, 0 
	MOVWF       R5 
	MOVF        POSTINC2+0, 0 
	MOVWF       R6 
	MOVF        POSTINC2+0, 0 
	MOVWF       R7 
	MOVF        Compute_I2_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_I2_L0+1, 0 
	MOVWF       R1 
	MOVF        Compute_I2_L0+2, 0 
	MOVWF       R2 
	MOVF        Compute_I2_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Compute140
	MOVLW       1
	SUBWF       _i+0, 0 
	MOVWF       R3 
	MOVLW       0
	SUBWFB      _i+1, 0 
	MOVWF       R4 
	MOVLW       4
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__Compute252:
	BZ          L__Compute253
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Compute252
L__Compute253:
	MOVLW       _AWG+0
	ADDWF       R0, 0 
	MOVWF       FLOC__Compute+0 
	MOVLW       hi_addr(_AWG+0)
	ADDWFC      R1, 0 
	MOVWF       FLOC__Compute+1 
	MOVFF       FLOC__Compute+0, FSR0
	MOVFF       FLOC__Compute+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_SecondaryGauge_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_SecondaryGauge_L0+1 
	MOVLW       4
	ADDWF       FLOC__Compute+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FLOC__Compute+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        Compute_microstep_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_microstep_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_microstep_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_microstep_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_Pulse2nd_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_Pulse2nd_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_Pulse2nd_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_Pulse2nd_L0+3 
	MOVLW       4
	ADDWF       FLOC__Compute+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FLOC__Compute+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R4 
	MOVF        POSTINC2+0, 0 
	MOVWF       R5 
	MOVF        POSTINC2+0, 0 
	MOVWF       R6 
	MOVF        POSTINC2+0, 0 
	MOVWF       R7 
	MOVF        Compute_WindingLength_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_WindingLength_L0+1, 0 
	MOVWF       R1 
	MOVF        Compute_WindingLength_L0+2, 0 
	MOVWF       R2 
	MOVF        Compute_WindingLength_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_TurnsPerLayer2_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_TurnsPerLayer2_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_TurnsPerLayer2_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_TurnsPerLayer2_L0+3 
	MOVLW       4
	ADDWF       FLOC__Compute+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FLOC__Compute+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       Compute_diameter2_L0+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       Compute_diameter2_L0+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       Compute_diameter2_L0+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       Compute_diameter2_L0+3 
	GOTO        L_Compute138
L_Compute140:
	MOVLW       1
	SUBWF       _i+0, 1 
	MOVLW       0
	SUBWFB      _i+1, 1 
	GOTO        L_Compute137
L_Compute138:
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Compute141:
	DECFSZ      R13, 1, 1
	BRA         L_Compute141
	DECFSZ      R12, 1, 1
	BRA         L_Compute141
	DECFSZ      R11, 1, 1
	BRA         L_Compute141
	NOP
	NOP
	MOVF        Compute_CoreWidth_L0+0, 0 
	MOVWF       Compute_Perimeter_L0+0 
	MOVF        Compute_CoreWidth_L0+1, 0 
	MOVWF       Compute_Perimeter_L0+1 
	RLCF        Compute_Perimeter_L0+0, 1 
	BCF         Compute_Perimeter_L0+0, 0 
	RLCF        Compute_Perimeter_L0+1, 1 
	MOVF        Compute_CoreLength_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_CoreLength_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       Compute_Perimeter_L0+0, 1 
	MOVF        R1, 0 
	ADDWFC      Compute_Perimeter_L0+1, 1 
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Compute142:
	DECFSZ      R13, 1, 1
	BRA         L_Compute142
	DECFSZ      R12, 1, 1
	BRA         L_Compute142
	DECFSZ      R11, 1, 1
	BRA         L_Compute142
	NOP
	NOP
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Compute143:
	DECFSZ      R13, 1, 1
	BRA         L_Compute143
	DECFSZ      R12, 1, 1
	BRA         L_Compute143
	DECFSZ      R11, 1, 1
	BRA         L_Compute143
	NOP
	NOP
	MOVF        Compute_WindingHeight_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_WindingHeight_L0+1, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        Compute_WindingLength_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_WindingLength_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_WindingLength_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_WindingLength_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Compute+4 
	MOVF        R1, 0 
	MOVWF       FLOC__Compute+5 
	MOVF        R2, 0 
	MOVWF       FLOC__Compute+6 
	MOVF        R3, 0 
	MOVWF       FLOC__Compute+7 
	MOVF        Compute_TurnsPerLayer1_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_TurnsPerLayer1_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_TurnsPerLayer1_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_TurnsPerLayer1_L0+3, 0 
	MOVWF       R7 
	MOVF        Compute_NoOfTurns1_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_NoOfTurns1_L0+1, 0 
	MOVWF       R1 
	MOVF        Compute_NoOfTurns1_L0+2, 0 
	MOVWF       R2 
	MOVF        Compute_NoOfTurns1_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        Compute_WindingLength_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_WindingLength_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_WindingLength_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_WindingLength_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        Compute_diameter1_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_diameter1_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_diameter1_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_diameter1_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Compute+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Compute+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Compute+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Compute+3 
	MOVF        Compute_TurnsPerLayer2_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_TurnsPerLayer2_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_TurnsPerLayer2_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_TurnsPerLayer2_L0+3, 0 
	MOVWF       R7 
	MOVF        Compute_NoOfTurns2_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_NoOfTurns2_L0+1, 0 
	MOVWF       R1 
	MOVF        Compute_NoOfTurns2_L0+2, 0 
	MOVWF       R2 
	MOVF        Compute_NoOfTurns2_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        Compute_WindingLength_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_WindingLength_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_WindingLength_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_WindingLength_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        Compute_diameter2_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_diameter2_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_diameter2_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_diameter2_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__Compute+0, 0 
	MOVWF       R4 
	MOVF        FLOC__Compute+1, 0 
	MOVWF       R5 
	MOVF        FLOC__Compute+2, 0 
	MOVWF       R6 
	MOVF        FLOC__Compute+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__Compute+4, 0 
	MOVWF       R0 
	MOVF        FLOC__Compute+5, 0 
	MOVWF       R1 
	MOVF        FLOC__Compute+6, 0 
	MOVWF       R2 
	MOVF        FLOC__Compute+7, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_AvailableArea_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_AvailableArea_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_AvailableArea_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_AvailableArea_L0+3 
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Compute144:
	DECFSZ      R13, 1, 1
	BRA         L_Compute144
	DECFSZ      R12, 1, 1
	BRA         L_Compute144
	DECFSZ      R11, 1, 1
	BRA         L_Compute144
	NOP
	NOP
	MOVF        Compute_Power_L0+0, 0 
	MOVWF       _IParameter+16 
	MOVF        Compute_Power_L0+1, 0 
	MOVWF       _IParameter+17 
	MOVF        Compute_I1_L0+0, 0 
	MOVWF       _FParameter+36 
	MOVF        Compute_I1_L0+1, 0 
	MOVWF       _FParameter+37 
	MOVF        Compute_I1_L0+2, 0 
	MOVWF       _FParameter+38 
	MOVF        Compute_I1_L0+3, 0 
	MOVWF       _FParameter+39 
	MOVF        Compute_Perimeter_L0+0, 0 
	MOVWF       _IParameter+20 
	MOVF        Compute_Perimeter_L0+1, 0 
	MOVWF       _IParameter+21 
	MOVF        Compute_NoOfTurns1_L0+0, 0 
	MOVWF       _FParameter+44 
	MOVF        Compute_NoOfTurns1_L0+1, 0 
	MOVWF       _FParameter+45 
	MOVF        Compute_NoOfTurns1_L0+2, 0 
	MOVWF       _FParameter+46 
	MOVF        Compute_NoOfTurns1_L0+3, 0 
	MOVWF       _FParameter+47 
	MOVF        Compute_NoOfTurns2_L0+0, 0 
	MOVWF       _FParameter+48 
	MOVF        Compute_NoOfTurns2_L0+1, 0 
	MOVWF       _FParameter+49 
	MOVF        Compute_NoOfTurns2_L0+2, 0 
	MOVWF       _FParameter+50 
	MOVF        Compute_NoOfTurns2_L0+3, 0 
	MOVWF       _FParameter+51 
	MOVF        Compute_PrimaryGauge_L0+0, 0 
	MOVWF       _IParameter+26 
	MOVF        Compute_PrimaryGauge_L0+1, 0 
	MOVWF       _IParameter+27 
	MOVF        Compute_SecondaryGauge_L0+0, 0 
	MOVWF       _IParameter+28 
	MOVF        Compute_SecondaryGauge_L0+1, 0 
	MOVWF       _IParameter+29 
	MOVF        Compute_WeightWire1_L0+0, 0 
	MOVWF       _FParameter+60 
	MOVF        Compute_WeightWire1_L0+1, 0 
	MOVWF       _FParameter+61 
	MOVF        Compute_WeightWire1_L0+2, 0 
	MOVWF       _FParameter+62 
	MOVF        Compute_WeightWire1_L0+3, 0 
	MOVWF       _FParameter+63 
	MOVF        Compute_WeightWire2_L0+0, 0 
	MOVWF       _FParameter+64 
	MOVF        Compute_WeightWire2_L0+1, 0 
	MOVWF       _FParameter+65 
	MOVF        Compute_WeightWire2_L0+2, 0 
	MOVWF       _FParameter+66 
	MOVF        Compute_WeightWire2_L0+3, 0 
	MOVWF       _FParameter+67 
	MOVF        Compute_AvailableArea_L0+0, 0 
	MOVWF       _FParameter+68 
	MOVF        Compute_AvailableArea_L0+1, 0 
	MOVWF       _FParameter+69 
	MOVF        Compute_AvailableArea_L0+2, 0 
	MOVWF       _FParameter+70 
	MOVF        Compute_AvailableArea_L0+3, 0 
	MOVWF       _FParameter+71 
	MOVF        Compute_TurnsPerLayer1_L0+0, 0 
	MOVWF       _FParameter+72 
	MOVF        Compute_TurnsPerLayer1_L0+1, 0 
	MOVWF       _FParameter+73 
	MOVF        Compute_TurnsPerLayer1_L0+2, 0 
	MOVWF       _FParameter+74 
	MOVF        Compute_TurnsPerLayer1_L0+3, 0 
	MOVWF       _FParameter+75 
	MOVF        Compute_TurnsPerLayer2_L0+0, 0 
	MOVWF       _FParameter+76 
	MOVF        Compute_TurnsPerLayer2_L0+1, 0 
	MOVWF       _FParameter+77 
	MOVF        Compute_TurnsPerLayer2_L0+2, 0 
	MOVWF       _FParameter+78 
	MOVF        Compute_TurnsPerLayer2_L0+3, 0 
	MOVWF       _FParameter+79 
	MOVF        Compute_Pulse1st_L0+0, 0 
	MOVWF       _FParameter+88 
	MOVF        Compute_Pulse1st_L0+1, 0 
	MOVWF       _FParameter+89 
	MOVF        Compute_Pulse1st_L0+2, 0 
	MOVWF       _FParameter+90 
	MOVF        Compute_Pulse1st_L0+3, 0 
	MOVWF       _FParameter+91 
	MOVF        Compute_Pulse2nd_L0+0, 0 
	MOVWF       _FParameter+92 
	MOVF        Compute_Pulse2nd_L0+1, 0 
	MOVWF       _FParameter+93 
	MOVF        Compute_Pulse2nd_L0+2, 0 
	MOVWF       _FParameter+94 
	MOVF        Compute_Pulse2nd_L0+3, 0 
	MOVWF       _FParameter+95 
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_Compute145:
	DECFSZ      R13, 1, 1
	BRA         L_Compute145
	DECFSZ      R12, 1, 1
	BRA         L_Compute145
	DECFSZ      R11, 1, 1
	BRA         L_Compute145
	NOP
	NOP
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	INFSNZ      _MenuNo+0, 1 
	INCF        _MenuNo+1, 1 
	MOVLW       1
	MOVWF       _EnableInputs+0 
	MOVLW       0
	MOVWF       _EnableInputs+1 
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_Compute146:
	DECFSZ      R13, 1, 1
	BRA         L_Compute146
	DECFSZ      R12, 1, 1
	BRA         L_Compute146
	DECFSZ      R11, 1, 1
	BRA         L_Compute146
	NOP
	NOP
L_end_Compute:
	RETURN      0
; end of _Compute

_IDisplay:

	MOVF        FARG_IDisplay_b+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        FARG_IDisplay_b+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _itext+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_itext+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_IDisplay_a+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_IDisplay_a+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _itext+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_itext+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       0
	SUBWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__IDisplay255
	MOVLW       18
	SUBWF       _MenuNo+0, 0 
L__IDisplay255:
	BTFSS       STATUS+0, 0 
	GOTO        L_IDisplay147
	MOVLW       1
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
	GOTO        L_IDisplay148
L_IDisplay147:
	MOVLW       10
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_IDisplay148:
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVF        _i+0, 0 
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_IDisplay_c+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_IDisplay_c+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_IDisplay149:
	DECFSZ      R13, 1, 1
	BRA         L_IDisplay149
	DECFSZ      R12, 1, 1
	BRA         L_IDisplay149
	DECFSZ      R11, 1, 1
	BRA         L_IDisplay149
	NOP
	NOP
L_end_IDisplay:
	RETURN      0
; end of _IDisplay

_FDisplay:

	MOVLW       0
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FDisplay257
	MOVF        _MenuNo+0, 0 
	SUBLW       7
L__FDisplay257:
	BTFSS       STATUS+0, 0 
	GOTO        L_FDisplay150
	MOVF        FARG_FDisplay_b+0, 0 
	MOVWF       FARG_ftswd_f+0 
	MOVF        FARG_FDisplay_b+1, 0 
	MOVWF       FARG_ftswd_f+1 
	MOVF        FARG_FDisplay_b+2, 0 
	MOVWF       FARG_ftswd_f+2 
	MOVF        FARG_FDisplay_b+3, 0 
	MOVWF       FARG_ftswd_f+3 
	MOVLW       _ftext+0
	MOVWF       FARG_ftswd_txt+0 
	MOVLW       hi_addr(_ftext+0)
	MOVWF       FARG_ftswd_txt+1 
	MOVLW       1
	MOVWF       FARG_ftswd_dec+0 
	CALL        _ftswd+0, 0
	GOTO        L_FDisplay151
L_FDisplay150:
	MOVF        FARG_FDisplay_b+0, 0 
	MOVWF       FARG_ftswd_f+0 
	MOVF        FARG_FDisplay_b+1, 0 
	MOVWF       FARG_ftswd_f+1 
	MOVF        FARG_FDisplay_b+2, 0 
	MOVWF       FARG_ftswd_f+2 
	MOVF        FARG_FDisplay_b+3, 0 
	MOVWF       FARG_ftswd_f+3 
	MOVLW       _ftext+0
	MOVWF       FARG_ftswd_txt+0 
	MOVLW       hi_addr(_ftext+0)
	MOVWF       FARG_ftswd_txt+1 
	MOVLW       4
	MOVWF       FARG_ftswd_dec+0 
	CALL        _ftswd+0, 0
L_FDisplay151:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_FDisplay_a+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_FDisplay_a+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _ftext+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_ftext+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        FARG_FDisplay_c+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        FARG_FDisplay_c+1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_FDisplay152:
	DECFSZ      R13, 1, 1
	BRA         L_FDisplay152
	DECFSZ      R12, 1, 1
	BRA         L_FDisplay152
	DECFSZ      R11, 1, 1
	BRA         L_FDisplay152
	NOP
	NOP
L_end_FDisplay:
	RETURN      0
; end of _FDisplay

_WindingProcess:

	CLRF        _EnableInputs+0 
	CLRF        _EnableInputs+1 
	MOVLW       1
	MOVWF       _CountingOn+0 
	MOVLW       0
	MOVWF       _CountingOn+1 
	CLRF        _TurnCount+0 
	CLRF        _TurnCount+1 
	MOVF        FARG_WindingProcess_TurnsPerLayer+0, 0 
	MOVWF       WindingProcess_nLayers_L0+0 
	MOVF        FARG_WindingProcess_TurnsPerLayer+1, 0 
	MOVWF       WindingProcess_nLayers_L0+1 
	MOVF        FARG_WindingProcess_TurnsPerLayer+2, 0 
	MOVWF       WindingProcess_nLayers_L0+2 
	MOVF        FARG_WindingProcess_TurnsPerLayer+3, 0 
	MOVWF       WindingProcess_nLayers_L0+3 
	BCF         LATC+0, 0 
	BCF         LATC+0, 2 
	BSF         LATC+0, 6 
	MOVLW       163
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_WindingProcess153:
	DECFSZ      R13, 1, 1
	BRA         L_WindingProcess153
	DECFSZ      R12, 1, 1
	BRA         L_WindingProcess153
	BSF         LATC+0, 7 
L_WindingProcess154:
	MOVLW       0
	XORWF       _RunStepper+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WindingProcess259
	MOVLW       1
	XORWF       _RunStepper+0, 0 
L__WindingProcess259:
	BTFSS       STATUS+0, 2 
	GOTO        L_WindingProcess157
	CLRF        _RunStepper+0 
	CLRF        _RunStepper+1 
	MOVF        FARG_WindingProcess_PulsesPerTurn+0, 0 
	MOVWF       FARG_stepper_NoOfPulses+0 
	MOVF        FARG_WindingProcess_PulsesPerTurn+1, 0 
	MOVWF       FARG_stepper_NoOfPulses+1 
	CALL        _stepper+0, 0
	MOVF        _TurnCount+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _TurnCount+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _itext+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_itext+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       10
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _itext+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_itext+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_WindingProcess157:
	MOVF        _TurnCount+0, 0 
	MOVWF       R0 
	MOVF        _TurnCount+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        WindingProcess_nLayers_L0+0, 0 
	MOVWF       R4 
	MOVF        WindingProcess_nLayers_L0+1, 0 
	MOVWF       R5 
	MOVF        WindingProcess_nLayers_L0+2, 0 
	MOVWF       R6 
	MOVF        WindingProcess_nLayers_L0+3, 0 
	MOVWF       R7 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_WindingProcess158
	MOVF        WindingProcess_nLayers_L0+0, 0 
	MOVWF       R0 
	MOVF        WindingProcess_nLayers_L0+1, 0 
	MOVWF       R1 
	MOVF        WindingProcess_nLayers_L0+2, 0 
	MOVWF       R2 
	MOVF        WindingProcess_nLayers_L0+3, 0 
	MOVWF       R3 
	MOVF        FARG_WindingProcess_TurnsPerLayer+0, 0 
	MOVWF       R4 
	MOVF        FARG_WindingProcess_TurnsPerLayer+1, 0 
	MOVWF       R5 
	MOVF        FARG_WindingProcess_TurnsPerLayer+2, 0 
	MOVWF       R6 
	MOVF        FARG_WindingProcess_TurnsPerLayer+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       WindingProcess_nLayers_L0+0 
	MOVF        R1, 0 
	MOVWF       WindingProcess_nLayers_L0+1 
	MOVF        R2, 0 
	MOVWF       WindingProcess_nLayers_L0+2 
	MOVF        R3, 0 
	MOVWF       WindingProcess_nLayers_L0+3 
	BTG         PORTC+0, 2 
L_WindingProcess158:
	MOVF        FARG_WindingProcess_xturns+1, 0 
	SUBWF       _TurnCount+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WindingProcess260
	MOVF        FARG_WindingProcess_xturns+0, 0 
	SUBWF       _TurnCount+0, 0 
L__WindingProcess260:
	BTFSS       STATUS+0, 0 
	GOTO        L_WindingProcess154
	BCF         LATC+0, 7 
	MOVLW       163
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_WindingProcess159:
	DECFSZ      R13, 1, 1
	BRA         L_WindingProcess159
	DECFSZ      R12, 1, 1
	BRA         L_WindingProcess159
	BCF         LATC+0, 6 
	CLRF        _CountingOn+0 
	CLRF        _CountingOn+1 
	MOVLW       1
	MOVWF       _EnableInputs+0 
	MOVLW       0
	MOVWF       _EnableInputs+1 
	BSF         LATC+0, 0 
	INFSNZ      _MenuNo+0, 1 
	INCF        _MenuNo+1, 1 
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_WindingProcess160:
	DECFSZ      R13, 1, 1
	BRA         L_WindingProcess160
	DECFSZ      R12, 1, 1
	BRA         L_WindingProcess160
	DECFSZ      R11, 1, 1
	BRA         L_WindingProcess160
	NOP
	NOP
L_end_WindingProcess:
	RETURN      0
; end of _WindingProcess
