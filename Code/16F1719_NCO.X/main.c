 /*
 * MAIN Generated Driver File
 * 
 * @file main.c
 * 
 * @defgroup main MAIN
 * 
 * @brief This is the generated driver implementation file for the MAIN driver.
 *
 * @version MAIN Driver Version 1.0.2
 *
 * @version Package Version: 3.1.2
*/

/*
© [2024] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip 
    software and any derivatives exclusively with Microchip products. 
    You are responsible for complying with 3rd party license terms  
    applicable to your use of 3rd party software (including open source  
    software) that may accompany Microchip software. SOFTWARE IS ?AS IS.? 
    NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 
    SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT,  
    MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
    WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 
    KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 
    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 
    FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP?S 
    TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
    EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 
    THIS SOFTWARE.
*/
#include "mcc_generated_files/system/system.h"

void IsTheThingAlive(void);

/*
    Main application
*/

int main(void)
{
    //SYSTEM_Initialize();
    // If using interrupts in PIC18 High/Low Priority Mode you need to enable the Global High and Low Interrupts 
    // If using interrupts in PIC Mid-Range Compatibility Mode you need to enable the Global and Peripheral Interrupts 
    // Use the following macros to: 

    // Enable the Global Interrupts 
    INTERRUPT_GlobalInterruptEnable(); 

    // Disable the Global Interrupts 
    //INTERRUPT_GlobalInterruptDisable(); 

    // Enable the Peripheral Interrupts 
    INTERRUPT_PeripheralInterruptEnable(); 

    // Disable the Peripheral Interrupts 
    //INTERRUPT_PeripheralInterruptDisable(); 
    //Oscillator stuff
    OSCCONbits.SPLLEN = 1; /*PLL ON*/
    OSCCONbits.IRCF1 = 0; /*8MHz * 4X PLL = 32 MHz Internal oscillator*/
    OSCCONbits.IRCF1 = 1;
    OSCCONbits.IRCF2 = 1;
    OSCCONbits.IRCF3 = 1;
    OSCCONbits.SCS1 = 1; /*Internal oscillator block*/
    //Port D stuff
    ANSELD = 0; /*All port D = digital*/
    TRISD = 0; /*All port D = outputs*/
    LATD = 0; /*All D Outputs = 0V*/
    
    //NCO Pin Setup
    PPSLOCK = 0;
    RD7PPS = 0b00011; /*NCO Output connected to pin RD7*/
    //NCO1 stuff
    NCO1CLKbits.N1CKS = 0; //Use 16MHz HFINTOSC clock
    NCO1CONbits.N1OUT = 1;
    NCO1CONbits.N1PFM = 0; //Fixed Duty Cycle mode
    NCO1CONbits.N1POL = 0; //Dont invert output
    
    //Increment values
    NCO1INCU = 0;
    NCO1INCH = 0;
    NCO1INCL = 20; //152.587 Hz
    
    NCO1CONbits.N1EN = 1; //Enable the NCO
    

    
    IsTheThingAlive();
    while(1)
    {
        
    }    
}

void IsTheThingAlive(void) {
    
    for(int i = 0; i < 20; i++){
    LATDbits.LATD1 = 1;
    __delay_ms(40);
    LATDbits.LATD1 = 0;
    __delay_ms(40);
    }
    LATDbits.LATD1 = 1;
}