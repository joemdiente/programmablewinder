
_interrupt:

	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
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
	GOTO        L_interrupt1
	BSF         PORTC+0, 2 
	MOVLW       1
	MOVWF       _firstrun+0 
	MOVLW       0
	MOVWF       _firstrun+1 
L_interrupt1:
L_interrupt0:
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt2
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
	GOTO        L_interrupt3
	BCF         PORTC+0, 2 
	MOVLW       1
	MOVWF       _firstrun+0 
	MOVLW       0
	MOVWF       _firstrun+1 
L_interrupt3:
L_interrupt2:
	BTFSS       INTCON3+0, 1 
	GOTO        L_interrupt4
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       10
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt5
	MOVLW       1
	MOVWF       _run+0 
	MOVLW       0
	MOVWF       _run+1 
	INFSNZ      _turns+0, 1 
	INCF        _turns+1, 1 
L_interrupt5:
L_interrupt4:
	BCF         INTCON+0, 1 
	BCF         INTCON3+0, 1 
	BCF         INTCON3+0, 0 
L_end_interrupt:
L__interrupt26:
	RETFIE      1
; end of _interrupt

_main:

	MOVLW       127
	MOVWF       TRISA+0 
	MOVLW       255
	MOVWF       TRISB+0 
	MOVLW       48
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
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
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
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
	NOP
	BCF         UCON+0, 3 
	BSF         UCFG+0, 3 
	CALL        _Lcd_Init+0, 0
	BCF         PORTC+0, 0 
	BCF         PORTC+0, 2 
	MOVLW       2
	MOVWF       R12, 0
	MOVLW       158
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	MOVLW       110
	MOVWF       _pulses+0 
	MOVLW       1
	MOVWF       _pulses+1 
	MOVLW       37
	MOVWF       _WindingLength+0 
	MOVLW       0
	MOVWF       _WindingLength+1 
	MOVLW       30
	MOVWF       _Layer+0 
	MOVLW       0
	MOVWF       _Layer+1 
	CLRF        _run+0 
	CLRF        _run+1 
	BCF         PORTC+0, 6 
	BCF         PORTC+0, 5 
	BCF         PORTC+0, 7 
	BCF         PORTB+0, 3 
	CLRF        _turns+0 
	CLRF        _turns+1 
	CLRF        _firstrun+0 
	CLRF        _firstrun+1 
	MOVLW       1
	MOVWF       _bla+0 
	MOVLW       0
	MOVWF       _bla+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVF        _pulses+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _pulses+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       0
	BTFSC       PORTC+0, 2 
	MOVLW       1
	MOVWF       FARG_IntToStr_input+0 
	CLRF        FARG_IntToStr_input+1 
	MOVLW       _text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_main9:
	MOVLW       0
	XORWF       _firstrun+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main28
	MOVLW       1
	XORWF       _firstrun+0, 0 
L__main28:
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
	MOVLW       200
	MOVWF       FARG_stepper_pulses+0 
	MOVLW       0
	MOVWF       FARG_stepper_pulses+1 
	MOVLW       160
	MOVWF       FARG_stepper_stpr+0 
	CALL        _stepper+0, 0
	CLRF        _firstrun+0 
	CLRF        _firstrun+1 
L_main12:
	BTFSC       PORTC+0, 5 
	GOTO        L_main13
	GOTO        L_main10
L_main13:
	GOTO        L_main9
L_main10:
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVF        _Layer+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _Layer+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	BCF         PORTC+0, 2 
L_main14:
	MOVLW       0
	XORWF       _bla+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main29
	MOVLW       1
	XORWF       _bla+0, 0 
L__main29:
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
	BSF         PORTC+0, 6 
	MOVLW       163
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	BSF         PORTC+0, 7 
	CLRF        _bla+0 
	CLRF        _bla+1 
L_main17:
	MOVLW       0
	XORWF       _run+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main30
	MOVLW       1
	XORWF       _run+0, 0 
L__main30:
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
	MOVF        _pulses+0, 0 
	MOVWF       FARG_stepper_pulses+0 
	MOVF        _pulses+1, 0 
	MOVWF       FARG_stepper_pulses+1 
	MOVF        _delaystpr+0, 0 
	MOVWF       FARG_stepper_stpr+0 
	CALL        _stepper+0, 0
	CLRF        _run+0 
	CLRF        _run+1 
	MOVF        _turns+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _turns+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _text+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_main19:
	GOTO        L_main14
L_end_main:
	GOTO        $+0
; end of _main

_stepper:

	CLRF        _pulse+0 
	CLRF        _pulse+1 
L_stepper20:
	MOVLW       128
	XORWF       FARG_stepper_pulses+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       _pulse+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__stepper32
	MOVF        _pulse+0, 0 
	SUBWF       FARG_stepper_pulses+0, 0 
L__stepper32:
	BTFSS       STATUS+0, 0 
	GOTO        L_stepper21
	BSF         PORTC+0, 1 
	MOVLW       41
	MOVWF       R13, 0
L_stepper23:
	DECFSZ      R13, 1, 1
	BRA         L_stepper23
	NOP
	BCF         PORTC+0, 1 
	MOVLW       41
	MOVWF       R13, 0
L_stepper24:
	DECFSZ      R13, 1, 1
	BRA         L_stepper24
	NOP
	INFSNZ      _pulse+0, 1 
	INCF        _pulse+1, 1 
	GOTO        L_stepper20
L_stepper21:
L_end_stepper:
	RETURN      0
; end of _stepper
