
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
	GOTO        L__ftswd194
	MOVF        R7, 0 
	SUBWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ftswd194
	MOVF        R6, 0 
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ftswd194
	MOVF        R5, 0 
	SUBWF       R0, 0 
L__ftswd194:
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
	GOTO        L__ftswd195
	MOVF        FARG_ftswd_dec+0, 0 
	XORWF       ftswd_i_L0+0, 0 
L__ftswd195:
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
L__ftswd172:
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
	GOTO        L__steppertest197
	MOVF        _Pulse+0, 0 
	SUBWF       FARG_steppertest_NoOfPulses+0, 0 
L__steppertest197:
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
	GOTO        L__stepper199
	MOVF        _Pulse+0, 0 
	SUBWF       FARG_stepper_NoOfPulses+0, 0 
L__stepper199:
	BTFSS       STATUS+0, 0 
	GOTO        L_stepper21
	BSF         LATC+0, 1 
	MOVLW       66
	MOVWF       R13, 0
L_stepper23:
	DECFSZ      R13, 1, 1
	BRA         L_stepper23
	NOP
	BCF         LATC+0, 1 
	MOVLW       66
	MOVWF       R13, 0
L_stepper24:
	DECFSZ      R13, 1, 1
	BRA         L_stepper24
	NOP
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
	BCF         LATC+0, 0 
	CLRF        _RunStepper+0 
	CLRF        _RunStepper+1 
	BCF         LATC+0, 7 
	BCF         LATC+0, 6 
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr28_Display+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr28_Display+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr29_Display+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr29_Display+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
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
	CLRF        _i+0 
	CLRF        _i+1 
L_main28:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main201
	MOVLW       32
	SUBWF       _i+0, 0 
L__main201:
	BTFSC       STATUS+0, 0 
	GOTO        L_main29
	MOVLW       24
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       231
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main28
L_main29:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	CLRF        _i+0 
	CLRF        _i+1 
L_main32:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main202
	MOVLW       4
	SUBWF       _i+0, 0 
L__main202:
	BTFSC       STATUS+0, 0 
	GOTO        L_main33
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
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       44
	MOVWF       R12, 0
	MOVLW       171
	MOVWF       R13, 0
L_main35:
	DECFSZ      R13, 1, 1
	BRA         L_main35
	DECFSZ      R12, 1, 1
	BRA         L_main35
	DECFSZ      R11, 1, 1
	BRA         L_main35
	NOP
	NOP
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       44
	MOVWF       R12, 0
	MOVLW       171
	MOVWF       R13, 0
L_main36:
	DECFSZ      R13, 1, 1
	BRA         L_main36
	DECFSZ      R12, 1, 1
	BRA         L_main36
	DECFSZ      R11, 1, 1
	BRA         L_main36
	NOP
	NOP
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
	GOTO        L_main32
L_main33:
	CLRF        _CountingOn+0 
	CLRF        _CountingOn+1 
	CLRF        _MenuNo+0 
	CLRF        _MenuNo+1 
L_main37:
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main40:
	DECFSZ      R13, 1, 1
	BRA         L_main40
	DECFSZ      R12, 1, 1
	BRA         L_main40
	DECFSZ      R11, 1, 1
	BRA         L_main40
	NOP
	NOP
	MOVLW       1
	MOVWF       _EnableInputs+0 
	MOVLW       0
	MOVWF       _EnableInputs+1 
	MOVF        _MenuNo+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main203
	MOVF        _MenuNo+0, 0 
	SUBLW       27
L__main203:
	BTFSC       STATUS+0, 0 
	GOTO        L_main41
	CLRF        _MenuNo+0 
	CLRF        _MenuNo+1 
L_main41:
	GOTO        L_main42
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
	MOVF        _Unit+0, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+1, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main43
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
	GOTO        L_main43
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
	GOTO        L_main43
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
	GOTO        L_main43
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
	GOTO        L_main43
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
	MOVF        _Unit+4, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+5, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main43
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
	MOVF        _Unit+4, 0 
	MOVWF       FARG_IDisplay_c+0 
	MOVF        _Unit+5, 0 
	MOVWF       FARG_IDisplay_c+1 
	CALL        _IDisplay+0, 0
	GOTO        L_main43
L_main51:
	CALL        _Compute+0, 0
	GOTO        L_main43
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
	GOTO        L_main43
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
	MOVF        _Unit+2, 0 
	MOVWF       FARG_FDisplay_c+0 
	MOVF        _Unit+3, 0 
	MOVWF       FARG_FDisplay_c+1 
	CALL        _FDisplay+0, 0
	GOTO        L_main43
L_main54:
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
	GOTO        L_main43
L_main55:
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
	GOTO        L_main43
L_main56:
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
	GOTO        L_main43
L_main57:
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
	GOTO        L_main43
L_main58:
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
	GOTO        L_main43
L_main59:
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
	GOTO        L_main43
L_main60:
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
	GOTO        L_main43
L_main61:
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
	GOTO        L_main43
L_main62:
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
	GOTO        L_main43
L_main63:
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
	GOTO        L__main204
	MOVLW       1
	XORWF       _RunStepper+0, 0 
L__main204:
	BTFSS       STATUS+0, 2 
	GOTO        L_main64
	BCF         LATC+0, 0 
	CLRF        _RunStepper+0 
	CLRF        _RunStepper+1 
	MOVLW       150
	MOVWF       FARG_steppertest_NoOfPulses+0 
	MOVLW       0
	MOVWF       FARG_steppertest_NoOfPulses+1 
	CALL        _steppertest+0, 0
L_main64:
	GOTO        L_main43
L_main65:
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
	GOTO        L_main43
L_main66:
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
	MOVF        _FParameter+80, 0 
	MOVWF       R0 
	MOVF        _FParameter+81, 0 
	MOVWF       R1 
	MOVF        _FParameter+82, 0 
	MOVWF       R2 
	MOVF        _FParameter+83, 0 
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
	GOTO        L_main43
L_main67:
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
	GOTO        L_main43
L_main68:
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
	GOTO        L_main43
L_main69:
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
	GOTO        L__main205
	MOVLW       1
	XORWF       _RunStepper+0, 0 
L__main205:
	BTFSS       STATUS+0, 2 
	GOTO        L_main70
	BCF         LATC+0, 0 
	CLRF        _RunStepper+0 
	CLRF        _RunStepper+1 
	MOVLW       150
	MOVWF       FARG_steppertest_NoOfPulses+0 
	MOVLW       0
	MOVWF       FARG_steppertest_NoOfPulses+1 
	CALL        _steppertest+0, 0
L_main70:
	GOTO        L_main43
L_main71:
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
	GOTO        L_main43
L_main72:
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
	MOVF        _FParameter+84, 0 
	MOVWF       R0 
	MOVF        _FParameter+85, 0 
	MOVWF       R1 
	MOVF        _FParameter+86, 0 
	MOVWF       R2 
	MOVF        _FParameter+87, 0 
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
	GOTO        L_main43
L_main73:
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
	GOTO        L_main43
L_main42:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main206
	MOVLW       0
	XORWF       _MenuNo+0, 0 
L__main206:
	BTFSC       STATUS+0, 2 
	GOTO        L_main44
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main207
	MOVLW       1
	XORWF       _MenuNo+0, 0 
L__main207:
	BTFSC       STATUS+0, 2 
	GOTO        L_main45
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main208
	MOVLW       2
	XORWF       _MenuNo+0, 0 
L__main208:
	BTFSC       STATUS+0, 2 
	GOTO        L_main46
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main209
	MOVLW       3
	XORWF       _MenuNo+0, 0 
L__main209:
	BTFSC       STATUS+0, 2 
	GOTO        L_main47
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main210
	MOVLW       4
	XORWF       _MenuNo+0, 0 
L__main210:
	BTFSC       STATUS+0, 2 
	GOTO        L_main48
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main211
	MOVLW       5
	XORWF       _MenuNo+0, 0 
L__main211:
	BTFSC       STATUS+0, 2 
	GOTO        L_main49
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main212
	MOVLW       6
	XORWF       _MenuNo+0, 0 
L__main212:
	BTFSC       STATUS+0, 2 
	GOTO        L_main50
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main213
	MOVLW       7
	XORWF       _MenuNo+0, 0 
L__main213:
	BTFSC       STATUS+0, 2 
	GOTO        L_main51
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main214
	MOVLW       8
	XORWF       _MenuNo+0, 0 
L__main214:
	BTFSC       STATUS+0, 2 
	GOTO        L_main52
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main215
	MOVLW       9
	XORWF       _MenuNo+0, 0 
L__main215:
	BTFSC       STATUS+0, 2 
	GOTO        L_main53
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main216
	MOVLW       10
	XORWF       _MenuNo+0, 0 
L__main216:
	BTFSC       STATUS+0, 2 
	GOTO        L_main54
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main217
	MOVLW       11
	XORWF       _MenuNo+0, 0 
L__main217:
	BTFSC       STATUS+0, 2 
	GOTO        L_main55
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main218
	MOVLW       12
	XORWF       _MenuNo+0, 0 
L__main218:
	BTFSC       STATUS+0, 2 
	GOTO        L_main56
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main219
	MOVLW       13
	XORWF       _MenuNo+0, 0 
L__main219:
	BTFSC       STATUS+0, 2 
	GOTO        L_main57
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main220
	MOVLW       14
	XORWF       _MenuNo+0, 0 
L__main220:
	BTFSC       STATUS+0, 2 
	GOTO        L_main58
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main221
	MOVLW       15
	XORWF       _MenuNo+0, 0 
L__main221:
	BTFSC       STATUS+0, 2 
	GOTO        L_main59
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main222
	MOVLW       16
	XORWF       _MenuNo+0, 0 
L__main222:
	BTFSC       STATUS+0, 2 
	GOTO        L_main60
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main223
	MOVLW       17
	XORWF       _MenuNo+0, 0 
L__main223:
	BTFSC       STATUS+0, 2 
	GOTO        L_main61
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main224
	MOVLW       18
	XORWF       _MenuNo+0, 0 
L__main224:
	BTFSC       STATUS+0, 2 
	GOTO        L_main62
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main225
	MOVLW       19
	XORWF       _MenuNo+0, 0 
L__main225:
	BTFSC       STATUS+0, 2 
	GOTO        L_main63
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main226
	MOVLW       20
	XORWF       _MenuNo+0, 0 
L__main226:
	BTFSC       STATUS+0, 2 
	GOTO        L_main65
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main227
	MOVLW       21
	XORWF       _MenuNo+0, 0 
L__main227:
	BTFSC       STATUS+0, 2 
	GOTO        L_main66
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main228
	MOVLW       22
	XORWF       _MenuNo+0, 0 
L__main228:
	BTFSC       STATUS+0, 2 
	GOTO        L_main67
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main229
	MOVLW       23
	XORWF       _MenuNo+0, 0 
L__main229:
	BTFSC       STATUS+0, 2 
	GOTO        L_main68
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main230
	MOVLW       24
	XORWF       _MenuNo+0, 0 
L__main230:
	BTFSC       STATUS+0, 2 
	GOTO        L_main69
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main231
	MOVLW       25
	XORWF       _MenuNo+0, 0 
L__main231:
	BTFSC       STATUS+0, 2 
	GOTO        L_main71
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main232
	MOVLW       26
	XORWF       _MenuNo+0, 0 
L__main232:
	BTFSC       STATUS+0, 2 
	GOTO        L_main72
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main233
	MOVLW       27
	XORWF       _MenuNo+0, 0 
L__main233:
	BTFSC       STATUS+0, 2 
	GOTO        L_main73
L_main43:
	GOTO        L_main37
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

	MOVF        PORTB+0, 0 
	MOVWF       _temp+0 
	MOVLW       0
	MOVWF       _temp+1 
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt76
	MOVLW       0
	XORWF       _EnableInputs+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt236
	MOVLW       1
	XORWF       _EnableInputs+0, 0 
L__interrupt236:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt76
L__interrupt190:
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       100
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt77
	MOVLW       1
	SUBWF       _MenuNo+0, 1 
	MOVLW       0
	SUBWFB      _MenuNo+1, 1 
	GOTO        L_interrupt78
L_interrupt80:
	MOVLW       6
	MOVWF       _MenuNo+0 
	MOVLW       0
	MOVWF       _MenuNo+1 
	GOTO        L_interrupt79
L_interrupt81:
	MOVLW       18
	MOVWF       _MenuNo+0 
	MOVLW       0
	MOVWF       _MenuNo+1 
	GOTO        L_interrupt79
L_interrupt82:
	MOVLW       23
	MOVWF       _MenuNo+0 
	MOVLW       0
	MOVWF       _MenuNo+1 
	GOTO        L_interrupt79
L_interrupt78:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt237
	MOVLW       7
	XORWF       _MenuNo+0, 0 
L__interrupt237:
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt80
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt238
	MOVLW       21
	XORWF       _MenuNo+0, 0 
L__interrupt238:
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt81
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt239
	MOVLW       26
	XORWF       _MenuNo+0, 0 
L__interrupt239:
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt82
L_interrupt79:
	MOVLW       0
	MOVWF       R0 
	MOVF        _MenuNo+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt240
	MOVF        _MenuNo+0, 0 
	SUBLW       0
L__interrupt240:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt83
	CLRF        _MenuNo+0 
	CLRF        _MenuNo+1 
L_interrupt83:
L_interrupt77:
L_interrupt76:
	BCF         INTCON+0, 1 
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt86
	MOVLW       0
	XORWF       _EnableInputs+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt241
	MOVLW       1
	XORWF       _EnableInputs+0, 0 
L__interrupt241:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt86
L__interrupt189:
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       100
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt87
	INFSNZ      _MenuNo+0, 1 
	INCF        _MenuNo+1, 1 
	MOVLW       0
	SUBWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt242
	MOVLW       27
	SUBWF       _MenuNo+0, 0 
L__interrupt242:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt88
	CLRF        _MenuNo+0 
	CLRF        _MenuNo+1 
L_interrupt88:
	MOVLW       0
	SUBWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt243
	MOVLW       7
	SUBWF       _MenuNo+0, 0 
L__interrupt243:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt91
	BTFSC       PORTC+0, 5 
	GOTO        L_interrupt91
L__interrupt188:
	MOVLW       18
	MOVWF       _MenuNo+0 
	MOVLW       0
	MOVWF       _MenuNo+1 
L_interrupt91:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt244
	MOVLW       18
	XORWF       _MenuNo+0, 0 
L__interrupt244:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt94
	BTFSC       PORTC+0, 5 
	GOTO        L_interrupt94
L__interrupt187:
	MOVLW       23
	MOVWF       _MenuNo+0 
	MOVLW       0
	MOVWF       _MenuNo+1 
L_interrupt94:
L_interrupt87:
L_interrupt86:
	BCF         INTCON3+0, 0 
	BTFSS       INTCON3+0, 1 
	GOTO        L_interrupt97
	MOVLW       0
	XORWF       _CountingOn+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt245
	MOVLW       1
	XORWF       _CountingOn+0, 0 
L__interrupt245:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt97
	MOVLW       0
	XORWF       _EnableInputs+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt246
	MOVLW       0
	XORWF       _EnableInputs+0, 0 
L__interrupt246:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt97
L__interrupt186:
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
	GOTO        L_interrupt98
	INFSNZ      _TurnCount+0, 1 
	INCF        _TurnCount+1, 1 
	MOVLW       1
	MOVWF       _RunStepper+0 
	MOVLW       0
	MOVWF       _RunStepper+1 
L_interrupt98:
L_interrupt97:
	BCF         INTCON3+0, 1 
	BTFSS       INTCON+0, 0 
	GOTO        L__interrupt185
	MOVLW       0
	XORWF       _EnableInputs+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt247
	MOVLW       1
	XORWF       _EnableInputs+0, 0 
L__interrupt247:
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt185
	MOVLW       0
	SUBWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt248
	MOVLW       7
	SUBWF       _MenuNo+0, 0 
L__interrupt248:
	BTFSC       STATUS+0, 0 
	GOTO        L__interrupt185
	GOTO        L__interrupt184
L__interrupt185:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt249
	MOVLW       19
	XORWF       _MenuNo+0, 0 
L__interrupt249:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt184
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt250
	MOVLW       24
	XORWF       _MenuNo+0, 0 
L__interrupt250:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt184
	GOTO        L_interrupt103
L__interrupt184:
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
	GOTO        L_interrupt104
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt183
	MOVF        _state+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt183
	GOTO        L__interrupt179
L__interrupt183:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt182
	MOVF        _state+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt182
	GOTO        L__interrupt179
L__interrupt182:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt181
	MOVF        _state+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt181
	GOTO        L__interrupt179
L__interrupt181:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt180
	MOVF        _state+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt180
	GOTO        L__interrupt179
L__interrupt180:
	GOTO        L_interrupt115
L__interrupt179:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt251
	MOVLW       2
	XORWF       _MenuNo+0, 0 
L__interrupt251:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt116
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
	GOTO        L_interrupt117
L_interrupt116:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt252
	MOVLW       2
	XORWF       _MenuNo+0, 0 
L__interrupt252:
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt120
	MOVLW       0
	SUBWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt253
	MOVLW       22
	SUBWF       _MenuNo+0, 0 
L__interrupt253:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt120
L__interrupt178:
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
L_interrupt120:
L_interrupt117:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt254
	MOVLW       19
	XORWF       _MenuNo+0, 0 
L__interrupt254:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt177
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt255
	MOVLW       24
	XORWF       _MenuNo+0, 0 
L__interrupt255:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt177
	GOTO        L_interrupt123
L__interrupt177:
	BTFSS       PORTC+0, 2 
	GOTO        L_interrupt124
	BCF         LATC+0, 2 
L_interrupt124:
	MOVLW       1
	MOVWF       _RunStepper+0 
	MOVLW       0
	MOVWF       _RunStepper+1 
L_interrupt123:
	GOTO        L_interrupt125
L_interrupt115:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt176
	MOVF        _state+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt176
	GOTO        L__interrupt174
L__interrupt176:
	MOVF        interrupt_prevState_L1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt175
	MOVF        _state+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt175
	GOTO        L__interrupt174
L__interrupt175:
	GOTO        L_interrupt132
L__interrupt174:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt256
	MOVLW       2
	XORWF       _MenuNo+0, 0 
L__interrupt256:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt133
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
	GOTO        L_interrupt134
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
L_interrupt134:
	GOTO        L_interrupt135
L_interrupt133:
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
L_interrupt135:
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
	GOTO        L__interrupt257
	MOVLW       0
	SUBWF       R1, 0 
L__interrupt257:
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt136
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
L_interrupt136:
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt258
	MOVLW       19
	XORWF       _MenuNo+0, 0 
L__interrupt258:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt173
	MOVLW       0
	XORWF       _MenuNo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt259
	MOVLW       24
	XORWF       _MenuNo+0, 0 
L__interrupt259:
	BTFSC       STATUS+0, 2 
	GOTO        L__interrupt173
	GOTO        L_interrupt139
L__interrupt173:
	BTFSC       PORTC+0, 2 
	GOTO        L_interrupt140
	BSF         LATC+0, 2 
L_interrupt140:
	MOVLW       1
	MOVWF       _RunStepper+0 
	MOVLW       0
	MOVWF       _RunStepper+1 
L_interrupt139:
L_interrupt132:
L_interrupt125:
L_interrupt104:
	MOVF        _state+0, 0 
	MOVWF       interrupt_prevState_L1+0 
L_interrupt103:
	BCF         INTCON+0, 0 
L_end_interrupt:
L__interrupt235:
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
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       124
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
	MOVWF       Compute_microstep1_L0+0 
	MOVLW       0
	MOVWF       Compute_microstep1_L0+1 
	MOVLW       27
	MOVWF       Compute_microstep1_L0+2 
	MOVLW       135
	MOVWF       Compute_microstep1_L0+3 
	MOVLW       0
	MOVWF       Compute_microstep2_L0+0 
	MOVLW       0
	MOVWF       Compute_microstep2_L0+1 
	MOVLW       17
	MOVWF       Compute_microstep2_L0+2 
	MOVLW       135
	MOVWF       Compute_microstep2_L0+3 
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
L_Compute141:
	DECFSZ      R13, 1, 1
	BRA         L_Compute141
	DECFSZ      R12, 1, 1
	BRA         L_Compute141
	DECFSZ      R11, 1, 1
	BRA         L_Compute141
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
L_Compute142:
	DECFSZ      R13, 1, 1
	BRA         L_Compute142
	DECFSZ      R12, 1, 1
	BRA         L_Compute142
	DECFSZ      R11, 1, 1
	BRA         L_Compute142
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
L_Compute143:
	DECFSZ      R13, 1, 1
	BRA         L_Compute143
	DECFSZ      R12, 1, 1
	BRA         L_Compute143
	DECFSZ      R11, 1, 1
	BRA         L_Compute143
	NOP
	NOP
	MOVLW       18
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_Compute144:
	MOVLW       4
	MOVWF       R2 
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__Compute261:
	BZ          L__Compute262
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Compute261
L__Compute262:
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
	GOTO        L_Compute147
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
L__Compute263:
	BZ          L__Compute264
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Compute263
L__Compute264:
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
	MOVF        Compute_microstep1_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_microstep1_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_microstep1_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_microstep1_L0+3, 0 
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
	GOTO        L_Compute145
L_Compute147:
	MOVLW       1
	SUBWF       _i+0, 1 
	MOVLW       0
	SUBWFB      _i+1, 1 
	GOTO        L_Compute144
L_Compute145:
	MOVLW       18
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_Compute148:
	MOVLW       4
	MOVWF       R2 
	MOVF        _i+0, 0 
	MOVWF       R0 
	MOVF        _i+1, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__Compute265:
	BZ          L__Compute266
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Compute265
L__Compute266:
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
	GOTO        L_Compute151
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
L__Compute267:
	BZ          L__Compute268
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	ADDLW       255
	GOTO        L__Compute267
L__Compute268:
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
	MOVF        Compute_microstep2_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_microstep2_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_microstep2_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_microstep2_L0+3, 0 
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
	GOTO        L_Compute149
L_Compute151:
	MOVLW       1
	SUBWF       _i+0, 1 
	MOVLW       0
	SUBWFB      _i+1, 1 
	GOTO        L_Compute148
L_Compute149:
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Compute152:
	DECFSZ      R13, 1, 1
	BRA         L_Compute152
	DECFSZ      R12, 1, 1
	BRA         L_Compute152
	DECFSZ      R11, 1, 1
	BRA         L_Compute152
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
L_Compute153:
	DECFSZ      R13, 1, 1
	BRA         L_Compute153
	DECFSZ      R12, 1, 1
	BRA         L_Compute153
	DECFSZ      R11, 1, 1
	BRA         L_Compute153
	NOP
	NOP
	MOVF        Compute_CoreWidth_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_CoreWidth_L0+1, 0 
	MOVWF       R1 
	MOVF        Compute_CoreLength_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_CoreLength_L0+1, 0 
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
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
	MOVWF       Compute_VolumeSpace_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_VolumeSpace_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_VolumeSpace_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_VolumeSpace_L0+3 
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
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
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
	MOVF        Compute_CoreLength_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_CoreLength_L0+1, 0 
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
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pow_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_x+3 
	MOVLW       0
	MOVWF       FARG_pow_y+0 
	MOVLW       0
	MOVWF       FARG_pow_y+1 
	MOVLW       0
	MOVWF       FARG_pow_y+2 
	MOVLW       128
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
	MOVF        Compute_WindingLength_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_WindingLength_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_WindingLength_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_WindingLength_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        Compute_VolumeSpace_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_VolumeSpace_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_VolumeSpace_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_VolumeSpace_L0+3, 0 
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_VolumeWire1_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_VolumeWire1_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_VolumeWire1_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_VolumeWire1_L0+3 
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
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
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
	MOVF        R0, 0 
	MOVWF       FLOC__Compute+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Compute+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Compute+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Compute+3 
	MOVF        Compute_CoreLength_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_CoreLength_L0+1, 0 
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
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pow_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_x+3 
	MOVLW       0
	MOVWF       FARG_pow_y+0 
	MOVLW       0
	MOVWF       FARG_pow_y+1 
	MOVLW       0
	MOVWF       FARG_pow_y+2 
	MOVLW       128
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
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
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
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
	MOVF        Compute_CoreLength_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_CoreLength_L0+1, 0 
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
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_pow_x+0 
	MOVF        R1, 0 
	MOVWF       FARG_pow_x+1 
	MOVF        R2, 0 
	MOVWF       FARG_pow_x+2 
	MOVF        R3, 0 
	MOVWF       FARG_pow_x+3 
	MOVLW       0
	MOVWF       FARG_pow_y+0 
	MOVLW       0
	MOVWF       FARG_pow_y+1 
	MOVLW       0
	MOVWF       FARG_pow_y+2 
	MOVLW       128
	MOVWF       FARG_pow_y+3 
	CALL        _pow+0, 0
	MOVF        FLOC__Compute+4, 0 
	MOVWF       R4 
	MOVF        FLOC__Compute+5, 0 
	MOVWF       R5 
	MOVF        FLOC__Compute+6, 0 
	MOVWF       R6 
	MOVF        FLOC__Compute+7, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
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
	MOVWF       FLOC__Compute+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Compute+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Compute+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Compute+3 
	MOVF        Compute_VolumeSpace_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_VolumeSpace_L0+1, 0 
	MOVWF       R1 
	MOVF        Compute_VolumeSpace_L0+2, 0 
	MOVWF       R2 
	MOVF        Compute_VolumeSpace_L0+3, 0 
	MOVWF       R3 
	MOVF        Compute_VolumeWire1_L0+0, 0 
	MOVWF       R4 
	MOVF        Compute_VolumeWire1_L0+1, 0 
	MOVWF       R5 
	MOVF        Compute_VolumeWire1_L0+2, 0 
	MOVWF       R6 
	MOVF        Compute_VolumeWire1_L0+3, 0 
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
	MOVF        FLOC__Compute+0, 0 
	MOVWF       R0 
	MOVF        FLOC__Compute+1, 0 
	MOVWF       R1 
	MOVF        FLOC__Compute+2, 0 
	MOVWF       R2 
	MOVF        FLOC__Compute+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Compute+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Compute+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Compute+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Compute+3 
	MOVF        Compute_VolumeWire1_L0+0, 0 
	MOVWF       R0 
	MOVF        Compute_VolumeWire1_L0+1, 0 
	MOVWF       R1 
	MOVF        Compute_VolumeWire1_L0+2, 0 
	MOVWF       R2 
	MOVF        Compute_VolumeWire1_L0+3, 0 
	MOVWF       R3 
	MOVLW       232
	MOVWF       R4 
	MOVLW       82
	MOVWF       R5 
	MOVLW       22
	MOVWF       R6 
	MOVLW       110
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_WeightWire1_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_WeightWire1_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_WeightWire1_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_WeightWire1_L0+3 
	MOVF        FLOC__Compute+0, 0 
	MOVWF       R0 
	MOVF        FLOC__Compute+1, 0 
	MOVWF       R1 
	MOVF        FLOC__Compute+2, 0 
	MOVWF       R2 
	MOVF        FLOC__Compute+3, 0 
	MOVWF       R3 
	MOVLW       232
	MOVWF       R4 
	MOVLW       82
	MOVWF       R5 
	MOVLW       22
	MOVWF       R6 
	MOVLW       110
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Compute_WeightWire2_L0+0 
	MOVF        R1, 0 
	MOVWF       Compute_WeightWire2_L0+1 
	MOVF        R2, 0 
	MOVWF       Compute_WeightWire2_L0+2 
	MOVF        R3, 0 
	MOVWF       Compute_WeightWire2_L0+3 
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       69
	MOVWF       R12, 0
	MOVLW       169
	MOVWF       R13, 0
L_Compute154:
	DECFSZ      R13, 1, 1
	BRA         L_Compute154
	DECFSZ      R12, 1, 1
	BRA         L_Compute154
	DECFSZ      R11, 1, 1
	BRA         L_Compute154
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
L_Compute155:
	DECFSZ      R13, 1, 1
	BRA         L_Compute155
	DECFSZ      R12, 1, 1
	BRA         L_Compute155
	DECFSZ      R11, 1, 1
	BRA         L_Compute155
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
	MOVWF       _FParameter+80 
	MOVF        Compute_Pulse1st_L0+1, 0 
	MOVWF       _FParameter+81 
	MOVF        Compute_Pulse1st_L0+2, 0 
	MOVWF       _FParameter+82 
	MOVF        Compute_Pulse1st_L0+3, 0 
	MOVWF       _FParameter+83 
	MOVF        Compute_Pulse2nd_L0+0, 0 
	MOVWF       _FParameter+84 
	MOVF        Compute_Pulse2nd_L0+1, 0 
	MOVWF       _FParameter+85 
	MOVF        Compute_Pulse2nd_L0+2, 0 
	MOVWF       _FParameter+86 
	MOVF        Compute_Pulse2nd_L0+3, 0 
	MOVWF       _FParameter+87 
	MOVLW       46
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_Compute156:
	DECFSZ      R13, 1, 1
	BRA         L_Compute156
	DECFSZ      R12, 1, 1
	BRA         L_Compute156
	DECFSZ      R11, 1, 1
	BRA         L_Compute156
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
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_Compute157:
	DECFSZ      R13, 1, 1
	BRA         L_Compute157
	DECFSZ      R12, 1, 1
	BRA         L_Compute157
	DECFSZ      R11, 1, 1
	BRA         L_Compute157
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
	GOTO        L__IDisplay270
	MOVLW       18
	SUBWF       _MenuNo+0, 0 
L__IDisplay270:
	BTFSS       STATUS+0, 0 
	GOTO        L_IDisplay158
	MOVLW       1
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
	GOTO        L_IDisplay159
L_IDisplay158:
	MOVLW       10
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
L_IDisplay159:
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
L_IDisplay160:
	DECFSZ      R13, 1, 1
	BRA         L_IDisplay160
	DECFSZ      R12, 1, 1
	BRA         L_IDisplay160
	DECFSZ      R11, 1, 1
	BRA         L_IDisplay160
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
	GOTO        L__FDisplay272
	MOVF        _MenuNo+0, 0 
	SUBLW       7
L__FDisplay272:
	BTFSS       STATUS+0, 0 
	GOTO        L_FDisplay161
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
	GOTO        L_FDisplay162
L_FDisplay161:
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
L_FDisplay162:
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
L_FDisplay163:
	DECFSZ      R13, 1, 1
	BRA         L_FDisplay163
	DECFSZ      R12, 1, 1
	BRA         L_FDisplay163
	DECFSZ      R11, 1, 1
	BRA         L_FDisplay163
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
L_WindingProcess164:
	DECFSZ      R13, 1, 1
	BRA         L_WindingProcess164
	DECFSZ      R12, 1, 1
	BRA         L_WindingProcess164
	BSF         LATC+0, 7 
L_WindingProcess165:
	MOVLW       0
	XORWF       _RunStepper+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WindingProcess274
	MOVLW       1
	XORWF       _RunStepper+0, 0 
L__WindingProcess274:
	BTFSS       STATUS+0, 2 
	GOTO        L_WindingProcess168
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
L_WindingProcess168:
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
	GOTO        L_WindingProcess169
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
L_WindingProcess169:
	MOVF        FARG_WindingProcess_xturns+1, 0 
	SUBWF       _TurnCount+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__WindingProcess275
	MOVF        FARG_WindingProcess_xturns+0, 0 
	SUBWF       _TurnCount+0, 0 
L__WindingProcess275:
	BTFSS       STATUS+0, 0 
	GOTO        L_WindingProcess165
	BCF         LATC+0, 7 
	MOVLW       163
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_WindingProcess170:
	DECFSZ      R13, 1, 1
	BRA         L_WindingProcess170
	DECFSZ      R12, 1, 1
	BRA         L_WindingProcess170
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
L_WindingProcess171:
	DECFSZ      R13, 1, 1
	BRA         L_WindingProcess171
	DECFSZ      R12, 1, 1
	BRA         L_WindingProcess171
	DECFSZ      R11, 1, 1
	BRA         L_WindingProcess171
	NOP
	NOP
L_end_WindingProcess:
	RETURN      0
; end of _WindingProcess
