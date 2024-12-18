/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

//Declares specific modes, here we can either read or write.
//Enum is essentially a special type that represents a group of constants,
//Here the IOMode can take two constants, either READ or WRITE.

#include <string.h>
#include <stdio.h>
#include <math.h>

#define DAC_FRQ_WORD_LSB_REG 4
#define DAC_FRQ_WORD_MSB_REG 5
#define ADC_FRQ_WORD_LSB_REG 2
#define ADC_FRQ_WORD_MSB_REG 3
#define ADC_SAMPLE_SIZE_REG 6
#define ADC_RESAMPLER_START_REG 7

enum IOMode{
	READ = 0,
	WRITE = 1
};
enum bool{
	FALSE,
	TRUE
};
enum IXMode{
	INTERNAL,
	EXTERNAL
};
enum IOINVERT{
	HIGH = 0,
	LOW = 1
};
enum PGAn{
	PGA_V,
	PGA_I
};
enum PGAGain{
	GAIN_0125,
	GAIN_025,
	GAIN_05,
	GAIN_1,
	GAIN_2,
	GAIN_4,
	GAIN_8,
	GAIN_16
};
enum RANGE_SET{
	RANGE_1R= 6,
	RANGE_10R = 5,
	RANGE_100R = 4,
	RANGE_1K = 3,
	RANGE_10K = 2,
	RANGE_100K = 0,
	RANGE_1M = 1
};


typedef struct complexr {
	double real;
	double imag;
}complexr;
typedef struct complexrSet{
	complexr voltage, current;
}complexrSet;
typedef struct complexpolar{
  double arg;
  double mod;
}complexp;

int8_t SetGPIOMode(enum IOMode mode);
int8_t SetIOValue(uint16_t IOvalue);
int8_t GetIOValue(uint16_t *result);
int8_t SetRnW(enum IOMode mode);
int8_t SetCLK(enum bool state);
int8_t PulseCLK(void);
int8_t ResetComm(void);
int8_t WriteData(uint16_t data, uint16_t addr);
int8_t FetchData(uint16_t *result, uint16_t addr);
int8_t SetIXMode(enum IXMode);
double argzr(complexr z);
double argzDegr(complexr z);
double magzr(complexr z);
complexr AddComplexr(complexr a, complexr b);
complexr CalSingleSampleFourierContribution(uint16_t inputSample);
complexrSet *CalVIFourierCoeff();
uint16_t GetSingleSampleContinous();
uint16_t SignedToUnsignedBinary(int16_t signedBinary);
uint32_t CalDACFrequencyWord(uint32_t frequency);
void SetDACFrequency(uint32_t frq);
uint32_t CalADCFrequencyWord(uint32_t frequency);
void SetSampleSize(uint16_t sampleSize);
void StartSampling();
void ns_delay(uint16_t);
uint16_t GetkFrequencyIndex(uint32_t DACFrequency, double DFTResolution);
double CalDFTResolution(uint16_t sampleSize, uint32_t sampleRate);
void SetDACRange(uint8_t range, enum IOINVERT enable);
void SetPGAGain(enum PGAn PGAx, enum PGAGain gain);
void SET_RANGE(enum RANGE_SET RANGE);
struct CommunicationPort{
	struct Control{
		struct CommunicationPort *selfAddr;
		uint16_t LowBytePins[8];
		GPIO_TypeDef *LowBytePort;
		uint16_t HighBytePins[8];
		GPIO_TypeDef *HighBytePort;
		uint16_t RWPin, CLKPin, IXPin;
		GPIO_TypeDef *RWport, *CLKport, *IXport;
		enum IOMode CurrentMode;
		enum IXMode CurrentIXMode;
	}ctrl;
	struct Set{
		int8_t (*SetIOMode)(enum IOMode);
		int8_t (*SetIOValue)(uint16_t);
		int8_t (*GetIOValue)(uint16_t*);
		int8_t (*SetRnW)(enum IOMode);
		int8_t (*SetCLK)(enum bool);
		int8_t (*PulseCLK)(void);
		int8_t (*SetIXMode)(enum IXMode);
	}set;
	int8_t (*ResetComm)(void);
	int8_t (*WriteData)(uint16_t, uint16_t);
	int8_t (*FetchData)(uint16_t*, uint16_t);
	struct Get{

	}get;
}CommPort;

struct complexMath{
  struct rectangular{
    double  (*Argz)(complexr);
    double  (*ArgzDeg)(complexr);
    double  (*Magz)(complexr);
    complexr (*Addz)(complexr a, complexr b);
  }rec;
  struct polar{ //dont need.

  }pol;
}cmplxmath;
struct DiscFourTf{
	struct control{
		struct DiscFourTf *selfAddr;
	}ctrl;
	struct DFTsetting{
		uint16_t NSampleSize;
		uint16_t kFrequencyIndex; //Frequency index
		uint16_t nSampleIndex; //Time index, eller sample points i tidsdomænet,
		double DFTres;         //En "n" værdi svarer til et specifikt punkt i tid, hvor signalet er samplet.
							   //Hvis der samples hvert 10 sekund, så går "n" fra 0(første sekund) til 9 (10ende sekund)
	}set;
	struct DFTgetting{
		uint16_t CalcDFTPercent;
		complexrSet*(*CalVIFourierCoeff)(void);
		complexr(*CalSingleSampleFourierContribution)(uint16_t);
		uint16_t (*GetkFrequencyIndex)(uint32_t, double);
		double (*CalDFTResolution)(uint16_t, uint32_t);
	}get;
}DFTSet;
struct FPGASampleControl{
	struct ADCSettings{
		float ADCResolution;
		uint32_t (*CalADCFrequencyWord)(uint32_t);
		void (*SetADCSampleFrequency)(uint32_t);
		void (*SetSampleSize)(uint16_t);
		void (*StartSampling)(void);
		void (*SetPGAGain)(enum PGAn, enum PGAGain);
	}adcSet;
	struct DACSettings{
		float DACResolution;
		uint32_t DACFrqWord;
		uint32_t(*CalDACFrequencyWord)(uint32_t);
		void(*SetDACFrequency)(uint32_t);
		void(*Range)(uint8_t, enum IOINVERT);
	}dacSet;
	struct SampleControlGetting{
		uint32_t ADCResamplerFrqWord;
		uint16_t(*GetSingleSampleContinous)(void);
	}get;
}SC;


//complexr z;



/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

void SET_RANGE(enum RANGE_SET RANGE) {
	HAL_GPIO_WritePin(GPIOA, RANGE_SER_LATCH_Pin, 0);
	for(int i = 0; i < 8; i++) {
		if(i == RANGE) {
			HAL_GPIO_WritePin(GPIOA, RANGE_SER_DATA_Pin, 1);
		}
		else {
			HAL_GPIO_WritePin(GPIOA, RANGE_SER_DATA_Pin, 0);
		}
			HAL_Delay(1);
			HAL_GPIO_WritePin(GPIOA, RANGE_SER_CLK_Pin, 1);
			HAL_Delay(1);
			HAL_GPIO_WritePin(GPIOA, RANGE_SER_CLK_Pin, 0);
			HAL_Delay(1);
	}
	HAL_GPIO_WritePin(GPIOA, RANGE_SER_LATCH_Pin, 1);
	HAL_Delay(1);
	HAL_GPIO_WritePin(GPIOA, RANGE_SER_LATCH_Pin, 0);
}

void SetPGAGain(enum PGAn PGAx, enum PGAGain gain){
	if(PGAx == PGA_V){
		switch(gain){
		case GAIN_0125:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, LOW);
		break;
		case GAIN_025:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, LOW);
		break;
		case GAIN_05:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, LOW);
		break;
		case GAIN_1:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, LOW);
		break;
		case GAIN_2:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, HIGH);
		break;
		case GAIN_4:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, HIGH);
		break;
		case GAIN_8:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, HIGH);
		break;
		case GAIN_16:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, HIGH);
		break;
		}
	}else if(PGAx == PGA_I){
		switch(gain){
		case GAIN_0125:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, LOW);
		break;
		case GAIN_025:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, LOW);
		break;
		case GAIN_05:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, LOW);
		break;
		case GAIN_1:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, LOW);
		break;
		case GAIN_2:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, HIGH);
		break;
		case GAIN_4:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, HIGH);
		break;
		case GAIN_8:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, HIGH);
		break;
		case GAIN_16:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, HIGH);
		break;
		}
	}
}

void SetDACRange(uint8_t range, enum IOINVERT enable){
	if(enable == HIGH){
		HAL_GPIO_WritePin(GPIOA, DAC_RANGE_EN_Pin, 0); /*Output is inverted*/
	}else{
		HAL_GPIO_WritePin(GPIOA, DAC_RANGE_EN_Pin, 1);
	}

	switch(range){
	case 0:
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A0_Pin, 0); //Inverted from actual PCB
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A1_Pin, 0);
	break;
	case 1:
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A0_Pin, 0); //Inverted from actual PCB
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A1_Pin, 1);
	break;
	case 2:
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A0_Pin, 1); //Inverted from actual PCB
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A1_Pin, 0);
	break;
	case 3:
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A0_Pin, 1); //Inverted from actual PCB
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A1_Pin, 1);
	break;
	}
}

double CalDFTResolution(uint16_t sampleSize, uint32_t sampleRate){
	return (double)(((double)sampleRate)/((double)sampleSize));
}

uint16_t GetkFrequencyIndex(uint32_t DACFrequency, double DFTResolution){
	return  (uint16_t)(DACFrequency /((uint16_t) DFTResolution));
}

void StartSampling(){
	CommPort.set.SetIXMode(INTERNAL); //Set to internal
	HAL_Delay(1);
	CommPort.ResetComm(); //Reset internal counter registers
	CommPort.WriteData(0x8000, ADC_RESAMPLER_START_REG); //Set MSB in register 7. ADC Resampler will be triggered.
}

uint32_t CalADCFrequencyWord(uint32_t frequency){
	uint32_t frqWord = frequency * (uint32_t)(SC.adcSet.ADCResolution);
	return frqWord;
}

void SetSampleSize(uint16_t sampleSize){
	CommPort.set.SetIXMode(INTERNAL); //Set to internal
	HAL_Delay(1);
	CommPort.WriteData(sampleSize, ADC_SAMPLE_SIZE_REG);      //Set sample size to FPGA.
}

void SetADCSampleFrequency(uint32_t frq){
	//Reset comm
	CommPort.set.SetIXMode(INTERNAL); //Set to internal
	HAL_Delay(1);
	CommPort.ResetComm(); //Reset FPGA modules. Only works in internal mode
	CommPort.set.SetIXMode(INTERNAL); //We set internal again after reset.
	HAL_Delay(1);
	uint32_t f_word = SC.adcSet.CalADCFrequencyWord(frq);
	CommPort.WriteData((f_word & 0xFFFF), ADC_FRQ_WORD_LSB_REG); //Write 16 LSBs of frq word to ADC register.
	CommPort.WriteData(((f_word >> 16)), ADC_FRQ_WORD_MSB_REG);  //Write 16 MSBs of frq word to ADC register.
}

uint32_t CalDACFrequencyWord(uint32_t frequency){
	uint32_t frqWord = frequency * (uint32_t)(SC.dacSet.DACResolution);
	return frqWord;
}

void SetDACFrequency(uint32_t frq){
	//Reset comm
	CommPort.set.SetIXMode(INTERNAL); //Set to internal
	HAL_Delay(1);
	CommPort.ResetComm(); //Reset FPGA modules. Only works in internal mode
	CommPort.set.SetIXMode(INTERNAL); //We set internal again after reset.
	HAL_Delay(1);
	uint32_t f_word = SC.dacSet.CalDACFrequencyWord(frq);
	CommPort.WriteData((f_word & 0xFFFF), DAC_FRQ_WORD_LSB_REG); //Write 16 LSBs of frq word to DAC register.
	CommPort.WriteData(((f_word >> 16)), DAC_FRQ_WORD_MSB_REG);  //Write 16 MSBs of frq word to DAC register.
}

double Argzr(complexr z)
{
  return atan2(z.imag, z.real); //atan2() tager højde for og korrigerer tangens fejl.
}
double ArgzDegr(complexr z)
{
  return atan2(z.imag, z.real) * (180/M_PI); //atan2() tager højde for og korrigerer tangens fejl.
}
double Magzr(complexr z)
{
  return sqrt(z.real*z.real + z.imag*z.imag);
}
complexr Addzr(complexr a, complexr b){
	return (complexr){a.real + b.real, a.imag + b.imag};
}

/*
 * Computes the fourier coefficient at the "k" frequency index in the DFT*/
complexrSet *CalVIFourierCoeff(){
	struct DiscFourTf *DFT = DFTSet.ctrl.selfAddr;
	complexr fourierCoeffV = (complexr){0,0};
	complexr fourierCoeffI = (complexr){0,0};
	static complexrSet fourierVI =(complexrSet){{0,0},{0,0}};
	DFT->set.nSampleIndex = 0;
	uint16_t nextSample = 0;
	for(uint16_t i = 0; i < DFT->set.NSampleSize; i++){
		//Get next sample from external memory, could be voltage or current. Even i = voltage, Odd i = current
		nextSample = SC.get.GetSingleSampleContinous();
		//Calculate fourier contribution at nextSample to the DFT.
		complexr nextSampleFourierContribution = DFT->get.CalSingleSampleFourierContribution(nextSample);
		//Check for even of odd i.
		if((i % 2) == 0){ //Even i, current
			if(isnan(nextSampleFourierContribution.imag) || isnan(nextSampleFourierContribution.real)){
				fourierCoeffI = (complexr){-1,-1};
				break;
			}else{
				fourierCoeffI = cmplxmath.rec.Addz(fourierCoeffI, nextSampleFourierContribution);
			//Increment time index to next sample.
				DFT->set.nSampleIndex++;
			}
		}else{ // Odd i, voltage
			if(isnan(nextSampleFourierContribution.imag) || isnan(nextSampleFourierContribution.real)){
				fourierCoeffV = (complexr){-1,-1};
				break;
			}else{
				fourierCoeffV = cmplxmath.rec.Addz(fourierCoeffV, nextSampleFourierContribution);
			//Increment time index to next sample.
				DFT->set.nSampleIndex++;
			}
		}
	}
	fourierVI = (complexrSet){fourierCoeffV, fourierCoeffI};
	return &fourierVI;
}
/*
 "n" = Time index, eller sample points i tidsdomænet,
En "n" værdi svarer til et specifikt punkt i tid, hvor signalet er samplet. "n" går fra 0 til N-1, hvor N
er det totale antal samples.
Hvis der samples hvert sekund i 10 sekunder, så går "n" fra 0(første sekund) til 9 (10ende sekund).
I DFT bruges "n" når vi summerer over alle samples af input signalet til at beregne fourier koefficienterne.
 *
 *
 "k" = frequency index. Repræsenterer de forskellige frekvenser som input signalet kan deles op i. Det giver en
 diskret opdeling af hele frekvensspektret af signalet.
 "k" går også fra 0 til N - 1. Her er "N" også det totale antal samples, men nu i frekvensdomænet.
 Hver eneste "k" værdi svarer til en bestemt frekvens "kasse" / bin. Den frekvens som hører til enhver "k" værdi er
 f_k =(k*f_s)/N
 Hvor f_s er sample frekvensen.
 *
 DFT'en fortæller, "hvor meget" der er en bestemt frekvens i et signal, eller "k" værdi.

 Twiddle faktoren er det som konverterer en samplet værdi i tidsdomænet x[n] til en værdi i frekvensdomænet X[k]
 */
complexr CalSingleSampleFourierContribution(uint16_t inputSample){
	struct DiscFourTf *DFT = DFTSet.ctrl.selfAddr;
	static complexr fourierPartCoeff = (complexr){0,0};
	if(DFT->set.NSampleSize != 0){ /*Calculate part of the fourier coefficient*/
		double angle = (2.0*M_PI * (double)DFT->set.kFrequencyIndex * (double)DFT->set.nSampleIndex )/(double)DFT->set.NSampleSize;
		fourierPartCoeff = (complexr){
			(double)inputSample * cos(angle),
			(double)inputSample * ((-1)* sin(angle))
		};
	}else{ /*Division by zero, return undefined*/
		fourierPartCoeff = (complexr){NAN,NAN};
	}
	return fourierPartCoeff;
}

/*Converts a 16bit value in 2's complement to ordinary binary.*/
uint16_t SignedToUnsignedBinary(int16_t signedBinary){
	uint16_t binary = 0;
	if((signedBinary) & (1<<16)) {
		binary = (signedBinary ^ 1<<16)*(-1);
	}
	else{
		binary = signedBinary;
	}
	return binary;
}

uint16_t GetSingleSampleContinous(){
	uint16_t sample;
	CommPort.set.SetIOMode(READ); //Set MCU to READ mode
	CommPort.set.SetRnW(READ);    //Set RW pin to READ
	CommPort.set.SetIXMode(EXTERNAL); //Set internal/external switch-over MUX to External memory mode
	/*
	* CLK 1 -> Address 0 from external memory. (ADC0 DATA)
	* CLK 2 -> Address 1 from external memory. (ADC1 DATA)
	* */
	CommPort.set.PulseCLK(); //ADC "n" data
	CommPort.set.GetIOValue(&sample); //Read IO port value
	return sample;
}

uint8_t test = 0;

/*SetGPIOMode() - Sets all LowBytePort, HighBytePort pins to Input or Output*/
int8_t SetGPIOMode(enum IOMode mode){
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	static GPIO_InitTypeDef GPIO_InitStruct_HighByte = {0};
	static GPIO_InitTypeDef GPIO_InitStruct_LowByte = {0};
	int8_t status = 1;
	if(cp != NULL){
		switch (mode){
		case READ: /*Set all I/O to Read mode*/
			for(uint8_t i = 0; i < 8; i++){
			/*Load pins*/
			GPIO_InitStruct_HighByte.Pin |= cp->ctrl.HighBytePins[i];
			GPIO_InitStruct_LowByte.Pin |= cp->ctrl.LowBytePins[i];
			}
			//GPIO_InitStruct_HighByte.Pin &= 0b0000000011111111;
			//GPIO_InitStruct_LowByte.Pin &= 0b0000000011111111;
			/*Set pins mode*/
			GPIO_InitStruct_HighByte.Mode = GPIO_MODE_INPUT;
			GPIO_InitStruct_LowByte.Mode = GPIO_MODE_INPUT;
			GPIO_InitStruct_HighByte.Pull = GPIO_PULLUP;
			GPIO_InitStruct_LowByte.Pull = GPIO_PULLUP;
			cp->ctrl.CurrentMode = READ;
			break;
		case WRITE: /*Set all I/O to Output mode*/
			for(uint8_t i = 0; i < 8; i++){
				/*Load pins*/
				GPIO_InitStruct_HighByte.Pin |= cp->ctrl.HighBytePins[i];
				GPIO_InitStruct_LowByte.Pin |= cp->ctrl.LowBytePins[i];
			}
			//GPIO_InitStruct_HighByte.Pin &= 0b0000000011111111;
			//GPIO_InitStruct_LowByte.Pin &= 0b0000000011111111;
			GPIO_InitStruct_HighByte.Mode = GPIO_MODE_OUTPUT_OD;
			GPIO_InitStruct_HighByte.Pull = GPIO_PULLUP;
			GPIO_InitStruct_HighByte.Speed = GPIO_SPEED_FREQ_LOW;
			GPIO_InitStruct_LowByte.Mode = GPIO_MODE_OUTPUT_OD;
			GPIO_InitStruct_LowByte.Pull = GPIO_PULLUP;
			GPIO_InitStruct_LowByte.Speed = GPIO_SPEED_FREQ_LOW;
			cp->ctrl.CurrentMode = WRITE;
			break;
		}

	/*Change settings..*/
	HAL_GPIO_Init(cp->ctrl.LowBytePort, &GPIO_InitStruct_LowByte);
	HAL_GPIO_Init(cp->ctrl.HighBytePort, &GPIO_InitStruct_HighByte);
	}else{
		status = -1;
	}
	return status;
};
int8_t SetIOValue(uint16_t IOvalue){
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	int8_t status = 1;
	if(cp != NULL) {
		uint16_t lowByte = 0;
		uint16_t highByte = 0;
		//split IOValue into two.
//		lowByte = IOvalue & 0xFF;
//		highByte = (IOvalue >> 8) & 0xFF;
		/*Ensure that the new value to the high and low byte ports do not change what is
		already on the port, i.e. only the 8 LSB of a port is used, we do not want to change
		values of bit 8-15. */
		lowByte = ((cp->ctrl.LowBytePort -> ODR)&0xFF00)|(IOvalue&0xFF);
		highByte = ((cp->ctrl.HighBytePort -> ODR)&0xFF00)|((IOvalue>>8)&0xFF);
		if((cp->ctrl.LowBytePort == GPIOB) && cp->ctrl.HighBytePort == GPIOC){
			GPIOB->ODR = lowByte;
			GPIOC->ODR = highByte;
		}else{
			status = -2;
		}
	}else{
		status = -1;
	}
return status;
}

int8_t GetIOValue(uint16_t *result) {
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	int8_t status = 1;
	if (cp != NULL) {
		uint16_t readVal = 0;
		if ((cp -> ctrl.LowBytePort == GPIOB) && (cp -> ctrl.HighBytePort == GPIOC)) {
			readVal = ((GPIOC->IDR)&0xFF)<<8;
			readVal |= ((GPIOB->IDR)&0xFF);
			*result = readVal;
		} else {
			status = -2;
			*result = 0;
		}
	} else {
		status = -1;
	}
	return status;
}

int8_t SetRnW(enum IOMode mode) {
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	int8_t status = 1;
	if (cp != NULL) {
		if (mode == READ) {
			HAL_GPIO_WritePin(cp->ctrl.RWport, cp->ctrl.RWPin, TRUE);
		}
		else if (mode == WRITE) {
			HAL_GPIO_WritePin(cp->ctrl.RWport, cp->ctrl.RWPin, FALSE);
		}
		return(status);
	}
	else {
		status = -1;
		return(status);
	}
}

int8_t SetIXMode(enum IXMode mode) {
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	int8_t status = 1;
	if(cp != NULL) {
		if(mode == INTERNAL) {
			HAL_GPIO_WritePin(cp ->ctrl.IXport, cp ->ctrl.IXPin, INTERNAL);
		}
		else if(mode == EXTERNAL) {
			HAL_GPIO_WritePin(cp ->ctrl.IXport, cp ->ctrl.IXPin, EXTERNAL);
		}
		return(status);
	}
	else {
		status = -1;
		return(status);
	}
}



int8_t SetCLK(enum bool state) {
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	int8_t status = 1;
	if (cp != NULL) {
		if (state == TRUE) {
			HAL_GPIO_WritePin(cp->ctrl.CLKport, cp->ctrl.CLKPin, TRUE);
		}
		else if (state == FALSE) {
			HAL_GPIO_WritePin(cp->ctrl.CLKport, cp->ctrl.CLKPin, FALSE);
		}
		return(status);
	}
	else {
		status = -1;
		return(status);
	}
}

int8_t PulseCLK(void) {
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	int8_t status = 1;
	if (cp != NULL) {
		HAL_GPIO_WritePin(cp->ctrl.CLKport, cp->ctrl.CLKPin, FALSE);
		HAL_GPIO_WritePin(cp->ctrl.CLKport, cp->ctrl.CLKPin, TRUE);
		ns_delay(500);
		HAL_GPIO_WritePin(cp->ctrl.CLKport, cp->ctrl.CLKPin, FALSE);
		return(status);
	}
	else {
		status = -1;
		return(status);
	}
}

int8_t ResetComm(void) {
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	int8_t status = 1;
	if (cp != NULL) {
		CommPort.set.SetIXMode(INTERNAL);
		CommPort.set.SetRnW(WRITE);
		CommPort.set.PulseCLK();
		CommPort.set.SetRnW(READ);
		CommPort.set.PulseCLK();
		CommPort.set.PulseCLK();
		CommPort.set.PulseCLK();
		CommPort.set.PulseCLK();
		return(status);
	}
	else {
		status = -1;
		return(status);
	}
}

int8_t WriteData(uint16_t data, uint16_t addr) {
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	int8_t status = 1;
	if (cp != NULL) {
		CommPort.set.SetRnW(WRITE);
//		if (CommPort.ctrl.CurrentMode != WRITE) {
//
//		}
		CommPort.set.SetIOMode(WRITE);
		CommPort.set.SetIOValue(addr);
		ns_delay(500);
		CommPort.set.PulseCLK();
		ns_delay(500);
		CommPort.set.SetIOValue(data);
		ns_delay(500);
		CommPort.set.PulseCLK();
		return(status);
	}
	else {
		status = -1;
		return(status);
	}
}

int8_t FetchData(uint16_t *result, uint16_t addr) {
	struct CommunicationPort *cp = CommPort.ctrl.selfAddr;
	int8_t status = 1;
	if (cp != NULL) {
		uint16_t readVal = 0;
		CommPort.set.SetIOMode(WRITE);
		CommPort.set.SetRnW(WRITE);
		ns_delay(500);
		CommPort.set.SetIOValue(addr);
		ns_delay(500);
		CommPort.set.PulseCLK();
		ns_delay(500);
		CommPort.set.SetRnW(READ);
		CommPort.set.SetIOMode(READ);
		ns_delay(500);
		CommPort.set.PulseCLK();
		ns_delay(500);
		CommPort.set.GetIOValue(&readVal);
		*result = readVal;
		return(status);
	}
	else {
		status = -1;
		return(status);
	}
}


/*Creates delay of approx 285 ns + del_time ns delay, 75 ns resolution*/
void ns_delay(uint16_t del_time) {
	if (del_time != 0) {
		uint16_t count = del_time/75;
		for (uint16_t i = 0; i < count; i++) {
			asm("NOP");
		}
	}
}


/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

	//DFT
	cmplxmath.rec.Argz = Argzr;
	cmplxmath.rec.ArgzDeg = ArgzDegr;
	cmplxmath.rec.Magz = Magzr;
	cmplxmath.rec.Addz = Addzr;
	DFTSet.ctrl.selfAddr = &DFTSet;
	DFTSet.get.GetkFrequencyIndex = GetkFrequencyIndex;
	DFTSet.get.CalDFTResolution = CalDFTResolution;
	DFTSet.get.CalVIFourierCoeff = CalVIFourierCoeff;
	DFTSet.get.CalSingleSampleFourierContribution = CalSingleSampleFourierContribution;
	SC.get.GetSingleSampleContinous = GetSingleSampleContinous;
	SC.dacSet.DACResolution = 214.748365;
	SC.dacSet.CalDACFrequencyWord = CalDACFrequencyWord;
	SC.adcSet.ADCResolution = 214.748365;
	SC.adcSet.CalADCFrequencyWord = CalADCFrequencyWord;
	SC.adcSet.SetADCSampleFrequency = SetADCSampleFrequency;
	SC.adcSet.SetSampleSize = SetSampleSize;
	SC.adcSet.StartSampling = StartSampling;
	SC.dacSet.Range = SetDACRange;
	SC.adcSet.SetPGAGain = SetPGAGain;
	//

	CommPort.set.SetIOMode = SetGPIOMode;
	CommPort.set.SetIOValue = SetIOValue;
	CommPort.set.GetIOValue = GetIOValue;
	CommPort.set.SetRnW = SetRnW;
	CommPort.set.SetCLK = SetCLK;
	CommPort.set.SetIXMode = SetIXMode;
	CommPort.set.PulseCLK = PulseCLK;
	CommPort.ResetComm = ResetComm;
	CommPort.WriteData = WriteData;
	CommPort.FetchData = FetchData;
	CommPort.ctrl.selfAddr = &CommPort;
	CommPort.ctrl.RWPin = DB_RW_Pin;
	CommPort.ctrl.CLKPin = DB_CLK_Pin;
	CommPort.ctrl.LowBytePort = GPIOB;
	CommPort.ctrl.HighBytePort = GPIOC;
	CommPort.ctrl.RWport = GPIOB;
	CommPort.ctrl.CLKport = GPIOC;
	CommPort.ctrl.IXport = GPIOC;
	CommPort.ctrl.IXPin = DB_IX_Pin;
	CommPort.ctrl.LowBytePins[0] = DB0_Pin;
	CommPort.ctrl.LowBytePins[1] = DB1_Pin;
	CommPort.ctrl.LowBytePins[2] = DB2_Pin;
	CommPort.ctrl.LowBytePins[3] = DB3_Pin;
	CommPort.ctrl.LowBytePins[4] = DB4_Pin;
	CommPort.ctrl.LowBytePins[5] = DB5_Pin;
	CommPort.ctrl.LowBytePins[6] = DB6_Pin;
	CommPort.ctrl.LowBytePins[7] = DB7_Pin;
	CommPort.ctrl.HighBytePins[0] = DB8_Pin;
	CommPort.ctrl.HighBytePins[1] = DB9_Pin;
	CommPort.ctrl.HighBytePins[2] = DB10_Pin;
	CommPort.ctrl.HighBytePins[3] = DB11_Pin;
	CommPort.ctrl.HighBytePins[4] = DB12_Pin;
	CommPort.ctrl.HighBytePins[5] = DB13_Pin;
	CommPort.ctrl.HighBytePins[6] = DB14_Pin;
	CommPort.ctrl.HighBytePins[7] = DB15_Pin;

	uint8_t uartBuf[16];
	//uint16_t testVar = 0;
	//uint16_t f_sampleSize = 0;
	int16_t val = 0;
	char str[16];
	//float f_set = 1000000;
	//uint32_t f_word = (uint32_t)(f_set*214.748365);
	complexrSet VIFourCoeffs = (complexrSet){{0,0},{0,0}};
	complexrSet *ptrVIFourcoeffs = &VIFourCoeffs;
	complexr IFourCoeff = (complexr){0,0};
	complexr VFourCoeff = (complexr){0,0};
	double IFourCoeffMag = 0.0;
	double VFourCoeffMag = 0.0;IFourCoeffMag = cmplxmath.rec.Magz(IFourCoeff);
  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();
  /* USER CODE BEGIN 2 */

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */

  //TEST
 // SC.adcSet.SetSampleSize(10000);
 // SC.adcSet.SetADCSampleFrequency(12000);
 // SC.dacSet.SetDACFrequency(1000);
  //
 // DFTSet.set.NSampleSize = 10000;
 // DFTSet.set.DFTres = DFTSet.get.CalDFTResolution(10000, 12000); //Lav gets til disse
 // DFTSet.set.kFrequencyIndex = DFTSet.get.GetkFrequencyIndex(1000, DFTSet.set.DFTres);

//
//  HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A0_Pin, 0); //Inverted from actual PCB
//  HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A1_Pin, 0);
//  HAL_GPIO_WritePin(GPIOA, DAC_RANGE_EN_Pin, 0);
//
//  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, 1);
//  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, 1);
//  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, 1);
//
//  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, 1);
//  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, 0);
//  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, 0);
//
//  HAL_GPIO_WritePin(GPIOA, RANGE_SER_LATCH_Pin, 0);
//  for(int i = 0; i < 8; i++) {
//  	if(i == 5) {
//  		HAL_GPIO_WritePin(GPIOA, RANGE_SER_DATA_Pin, 1);
//  	}
//  	else {
//  		HAL_GPIO_WritePin(GPIOA, RANGE_SER_DATA_Pin, 0);
//  	}
//  	HAL_Delay(1);
//  	HAL_GPIO_WritePin(GPIOA, RANGE_SER_CLK_Pin, 1);
//  	HAL_Delay(1);
//  	HAL_GPIO_WritePin(GPIOA, RANGE_SER_CLK_Pin, 0);
//  	HAL_Delay(1);
//  }
//  HAL_GPIO_WritePin(GPIOA, RANGE_SER_LATCH_Pin, 1);
//  HAL_Delay(1);
//  HAL_GPIO_WritePin(GPIOA, RANGE_SER_LATCH_Pin, 0);


  //SC.dacSet.Range(1, HIGH);

  SET_RANGE(RANGE_10R);

/*
CommPort.set.SetIXMode(INTERNAL); //Set to internal
HAL_Delay(10);
CommPort.ResetComm(); //Reset FPGA modules. Only works in internal mode

HAL_Delay(10);

CommPort.set.SetIXMode(INTERNAL); //We set internal again after reset.
HAL_Delay(1);


f_sampleSize = 10000;
f_set = 1333;

f_word = (uint32_t)(f_set*214.748365); //Calculate DAC resolution
HAL_Delay(10);
CommPort.WriteData((f_word & 0xFFFF), 4); //Write 16 LSBs of frq word to DAC register.
HAL_Delay(10);
CommPort.WriteData(((f_word >> 16)), 5);  //Write 16 MSBs of frq word to DAC register.
HAL_Delay(10);
CommPort.WriteData((f_word & 0xFFFF), 2); //Write 16 LSBs of frq word to ADC register.
HAL_Delay(10);
CommPort.WriteData(((f_word >> 16)), 3);  //Write 16 MSBs of frq word to ADC register.
HAL_Delay(10);
CommPort.WriteData(f_sampleSize, 6);      //Set sample size to FPGA.
HAL_Delay(10);
*/
  while (1)
  {

	//CommPort.ResetComm(); //Reset internal counter registers
	//CommPort.WriteData(0x8000, 7); //Set MSB in register 7. ADC Resampler will be triggered.
	//HAL_Delay(500);
	//Setup micro and FPGA for continous CLKing data out of external memory.
	//CommPort.set.SetIOMode(READ); //Set MCU to READ mode
	//CommPort.set.SetRnW(READ);    //Set RW pin to READ
	//CommPort.set.SetIXMode(EXTERNAL); //Set internal/external switch-over MUX to External memory mode
	//HAL_Delay(5);
	//	for(int i = 0; i< f_sampleSize; i++) {
		/*
		 * CLK 1 -> Address 0 from external memory. (ADC0 DATA)
		 * CLK 2 -> Address 1 from external memory. (ADC1 DATA)
		 * */
	//	CommPort.set.PulseCLK(); //ADC 0 data
	//	CommPort.set.GetIOValue(&testVar); //Read IO port value
	//	CommPort.set.PulseCLK();//ADC 1 data
		//CommPort.set.GetIOValue(&testVar); //read ADC1 DATA

		//Convert 2's complement (signed binary) to binary
	//	if((testVar) & (1<<16)) {
	//		val = (testVar ^ 1<<16)*(-1);
	//	}
	//	else{
	//		val = testVar;
	//	}


	  //SC.adcSet.StartSampling();
	  //ptrVIFourcoeffs = DFTSet.get.CalVIFourierCoeff;
	  //VIFourCoeffs = *DFTSet.get.CalVIFourierCoeff();
	  //IFourCoeff = VIFourCoeffs.current;
	  //VFourCoeff = VIFourCoeffs.voltage;
	  //IFourCoeffMag = cmplxmath.rec.Magz(IFourCoeff);
	  //VFourCoeffMag = cmplxmath.rec.Magz(VFourCoeff);

		//Random string functions
		//sprintf(str, "%.2f\r\n", (VFourCoeffMag));
		//strcpy((char*)uartBuf, str);
		//HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
		//HAL_Delay(10);

	//}
	HAL_Delay(1000);


    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 360;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 2;
  RCC_OscInitStruct.PLL.PLLR = 2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Activate the Over-Drive mode
  */
  if (HAL_PWREx_EnableOverDrive() != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 2000000;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOD_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOC, DB8_Pin|DB9_Pin|DB10_Pin|DB11_Pin
                          |DB12_Pin|DB13_Pin|DB15_Pin|DB_IX_Pin
                          |DB_CLK_Pin|TimerPin_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, DB_RESET_Pin|V_PGA_A0_Pin|RANGE_SER_DATA_Pin|LD2_Pin
                          |RANGE_SER_CLK_Pin|RANGE_SER_LATCH_Pin|DAC_RANGE_A0_Pin|DAC_RANGE_A1_Pin
                          |DAC_RANGE_EN_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, DB0_Pin|DB1_Pin|DB2_Pin|V_PGA_A1_Pin
                          |V_PGA_A2_Pin|I_PGA_A0_Pin|I_PGA_A1_Pin|I_PGA_A2_Pin
                          |DB3_Pin|DB4_Pin|DB5_Pin|DB6_Pin
                          |DB7_Pin|DB_RW_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : B1_Pin */
  GPIO_InitStruct.Pin = B1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(B1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : DB8_Pin DB9_Pin DB10_Pin DB11_Pin
                           DB12_Pin DB13_Pin DB15_Pin DB_IX_Pin
                           DB_CLK_Pin TimerPin_Pin */
  GPIO_InitStruct.Pin = DB8_Pin|DB9_Pin|DB10_Pin|DB11_Pin
                          |DB12_Pin|DB13_Pin|DB15_Pin|DB_IX_Pin
                          |DB_CLK_Pin|TimerPin_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pins : DB_RESET_Pin V_PGA_A0_Pin RANGE_SER_DATA_Pin LD2_Pin
                           RANGE_SER_CLK_Pin RANGE_SER_LATCH_Pin DAC_RANGE_A0_Pin DAC_RANGE_A1_Pin
                           DAC_RANGE_EN_Pin */
  GPIO_InitStruct.Pin = DB_RESET_Pin|V_PGA_A0_Pin|RANGE_SER_DATA_Pin|LD2_Pin
                          |RANGE_SER_CLK_Pin|RANGE_SER_LATCH_Pin|DAC_RANGE_A0_Pin|DAC_RANGE_A1_Pin
                          |DAC_RANGE_EN_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pin : DB0_Pin */
  GPIO_InitStruct.Pin = DB0_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  HAL_GPIO_Init(DB0_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : DB1_Pin DB2_Pin V_PGA_A1_Pin V_PGA_A2_Pin
                           I_PGA_A0_Pin I_PGA_A1_Pin I_PGA_A2_Pin DB3_Pin
                           DB4_Pin DB5_Pin DB6_Pin DB7_Pin
                           DB_RW_Pin */
  GPIO_InitStruct.Pin = DB1_Pin|DB2_Pin|V_PGA_A1_Pin|V_PGA_A2_Pin
                          |I_PGA_A0_Pin|I_PGA_A1_Pin|I_PGA_A2_Pin|DB3_Pin
                          |DB4_Pin|DB5_Pin|DB6_Pin|DB7_Pin
                          |DB_RW_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pin : DB14_Pin */
  GPIO_InitStruct.Pin = DB14_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(DB14_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : Test_Input_Pin */
  GPIO_InitStruct.Pin = Test_Input_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(Test_Input_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : UART5_TX_DISPLAY_Pin */
  GPIO_InitStruct.Pin = UART5_TX_DISPLAY_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = GPIO_AF8_UART5;
  HAL_GPIO_Init(UART5_TX_DISPLAY_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : UART5_RX_DISPLAY_Pin */
  GPIO_InitStruct.Pin = UART5_RX_DISPLAY_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = GPIO_AF8_UART5;
  HAL_GPIO_Init(UART5_RX_DISPLAY_GPIO_Port, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
