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
enum DUT_TYPE{
	RESISTOR,
	INDUCTOR,
	CAPACITOR,
	UNDEFINED
};
enum IMPEDANCEMODEL{
	SERIES,
	PARALLEL
};

enum TestLevel{
	LVL_4V3 = 0,
	LVL_1V2 = 1,
	LVL_2V3 = 2,
	LVL_0V6 = 3,
	LVL_0 = 3,
	LVL_1 = 1,
	LVL_2 = 2,
	LVL_3 = 0
};

typedef struct complexr {
	double real;
	double imag;
}complexr;
typedef struct complexrSet{
	complexr voltage, current;
}complexrSet;
typedef struct complexpolar{
  double mod;
  double argDeg;
}complexp;

//typedef struct impedance{ //Unused for now, using complexp instead
//	double mag;
//	double phaseDeg;
//}impedance;

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
complexr Addzr(complexr a, complexr b);
complexr Subzr(complexr a, complexr b);
complexr CalSingleSampleFourierContribution(int16_t inputSample, uint16_t nTimeIndex);
complexrSet *CalVIFourierCoeff(uint8_t reset);
int16_t GetSingleSampleContinous();
int16_t SignedToUnsignedBinary(uint16_t signedBinary);
uint32_t CalDACFrequencyWord(uint32_t frequency);
void SetDACFrequency(uint32_t frq);
uint32_t CalADCFrequencyWord(uint32_t frequency);
void SetSampleSize(uint16_t sampleSize);
void StartSampling();
void ns_delay(uint16_t);
uint16_t GetkFrequencyIndex(uint32_t DACFrequency, double DFTResolution);
double CalDFTResolution(uint16_t sampleSize, uint32_t sampleRate);
void SetDACTestLevel(enum TestLevel range, enum IOINVERT enable);
void SetPGAGain(enum PGAn PGAx, enum PGAGain gain);
void SetRangeResistor(enum RANGE_SET RANGE);
void AutoRangeV(int16_t VMax, int16_t VMin);
float AutoRangeI(int16_t IMax, int16_t IMin, float R_Range, float IMaxGain);
void AutoRangeI_PGA(int16_t IMax, int16_t IMin);
void AutoRangeSMPL(uint32_t smplt_size);
void AutoRange(uint32_t smpl_f, uint32_t test_f);
uint8_t AutoRangeCheck(uint32_t smpl_f, uint32_t test_f);
complexr Dividezr(complexr v, complexr i);
complexr Prodzr(complexr a, complexr b);
complexp CalImpedance(complexr vFourier, complexr iFourier);
complexr CalAdmittance(complexr vFourier, complexr iFourier);
enum DUT_TYPE IdentifyComponentType(complexp impedance);
double DegToRadians(double angle);
complexr Reciprocalzr(complexr a);
complexp Reciprocalzp(complexp z);
complexr PolarToRectangular(complexp z);
complexr ConvertImpedanceModel(enum IMPEDANCEMODEL ToModel, complexp impedance);
double CalLossTangent(complexr z);
double CalQualityFactor(complexr z);
double GetModelResistance(complexr z);
double CalInductanceMag(uint32_t wFrq, complexr z);
double CalCapacitanceMag(uint32_t wFrq, complexr z);
void tempPrint(uint16_t f_sampleSize, uint16_t testVar);
void smpl_Z(void);
void smpl_Y(void);
void OS_Cal(uint32_t smpl_f, uint32_t test_f, uint32_t sampleSize);
complexp CorrectDUT(complexr Y_MEAS, uint32_t Range);

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
    complexr(*Dividez)(complexr, complexr);
    complexr (*Prodzr)(complexr, complexr);
    complexr (*Addz)(complexr a, complexr b);
    complexr (*Subz)(complexr a, complexr b);
    complexr(*Reciprocalzr)(complexr);
  }rec;
  struct polar{
	complexp (*Reciprocalzp)(complexp);
	complexr (*PolarToRectangular)(complexp);
  }pol;
}cmplxmath;
struct DiscFourTf{
	struct control{
		struct DiscFourTf *selfAddr;
	}ctrl;
	struct DFTsetting{
		uint16_t NSampleSize;
		uint16_t kFrequencyIndex; //Frequency index
		uint16_t nSampleIndex;
		uint16_t nVoltageSampleIndex;
		uint16_t nCurrentSampleIndex; //Time index, eller sample points i tidsdomænet,
		double DFTres;         //En "n" værdi svarer til et specifikt punkt i tid, hvor signalet er samplet.
							   //Hvis der samples hvert 10 sekund, så går "n" fra 0(første sekund) til 9 (10ende sekund)
	}set;
	struct DFTgetting{
		uint16_t CalcDFTPercent;
		complexrSet*(*CalVIFourierCoeff)(uint8_t);
		complexr(*CalSingleSampleFourierContribution)(uint16_t,uint16_t);
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
		double VoltagePGAGain;
		double CurrentPGAGain;
	}adcSet;
	struct DACSettings{
		float DACResolution;
		uint32_t DACFrqWord;
		uint32_t(*CalDACFrequencyWord)(uint32_t);
		void(*SetDACFrequency)(uint32_t);
		void(*TestLevel)(enum TestLevel, enum IOINVERT);
		void(*SetRangeResistor)(enum RANGE_SET);
		void (*AutoRangeV)(int16_t, int16_t);
		float (*AutoRangeI)(int16_t, int16_t, float, float);
		void (*AutoRangeI_PGA)(int16_t, int16_t);
		void (*AutoRangeSMPL)(uint32_t);
		void (*AutoRange)(uint32_t, uint32_t);
		uint8_t (*AutoRangeCheck)(uint32_t, uint32_t);
		double CurrentRangeResistor;
		uint32_t CurrentRangeIndicator;
		int16_t AR_VMax;
		int16_t AR_VMin;
		int16_t AR_IMax;
		int16_t AR_IMin;
		uint8_t I_Lim;
	}dacSet;
	struct SampleControlGetting{
		uint32_t ADCResamplerFrqWord;
		uint16_t(*GetSingleSampleContinous)(void);
	}get;
}SC;
struct ComponentAnalysis{
	struct parameters{
		complexp z;
		complexr y;
	}param;
	struct calculate{
		complexp (*GetImpedance)(complexr vFourier, complexr iFourier);
		complexr (*GetAdmittance)(complexr vFourier, complexr iFourier);
		enum DUT_TYPE (*IdentifyComponentType)(complexp);
		complexr (*ToImpedanceModel)(enum IMPEDANCEMODEL ToModel, complexp impedance);
		double (*LossTangent)(complexr z);
		double (*QualityFactor)(complexr z);
		double (*ModelResistance)(complexr z);
		double (*InductanceMagnitude)(uint32_t wFrq, complexr z);
		double (*CapacitanceMagnitude)(uint32_t wFrq, complexr z);
	}cal;
}DUT;


typedef struct TestParameters{
	uint32_t testFrequency;
	uint32_t sampleFrequency;
	uint16_t sampleSize;
	uint16_t run;
}TestParameters;

struct Calibration{
	void (*smpl_Z)(void);
	void (*smpl_Y)(void);
	void (*OS_Cal)(uint32_t, uint32_t, uint32_t);
	float r_Relay[7];
	float vmeas;
	complexr range_Cal_Open[7];
	complexp (*CorrectDUT)(complexr, uint32_t);
}calPar;


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

/*Calculate magnitude of capacitance*/
double CalCapacitanceMag(uint32_t wFrq, complexr z){
	double capacitiveReactance = abs(z.imag);
	return (1.0/(capacitiveReactance*((double)wFrq)*(2.0*M_PI)));
}
/*Calculate magnitude of inductance*/
double CalInductanceMag(uint32_t wFrq, complexr z){
	double inductiveReactance = z.imag;
	return inductiveReactance / ((double)wFrq);
}
/*Gets the real resistance from the circuit model*/
double GetModelResistance(complexr z){
	return z.real;
}
/*Calculates the loss tangent in the model*/
double CalLossTangent(complexr z){
	double lossTangent = z.real/z.imag;
	return lossTangent;
}
/*Calculates the quality factor of the model*/
double CalQualityFactor(complexr z){
	double qualityFactor = z.imag/z.real;
	return qualityFactor;
}

complexr ConvertImpedanceModel(enum IMPEDANCEMODEL ToModel, complexp impedance){
	complexr modeledImpedance = (complexr){0,0};
	//Convert argument to radians
	double argRadians = DegToRadians(impedance.argDeg);
	//Convert impedance to admittance
	complexp yPolar = cmplxmath.pol.Reciprocalzp(impedance);
	//Convert admittance to rectangular form
	complexr yRect = cmplxmath.pol.PolarToRectangular(yPolar);

	switch (ToModel){
	case(SERIES): //Model as series circuit. Literally no change. Chapter 4.1
			modeledImpedance = (complexr){
		 impedance.mod * cos(argRadians),
		 impedance.mod * sin(argRadians)
	};
			break;
	case(PARALLEL)://Model as parallel circuit. Chapter 4.1
		modeledImpedance = (complexr){
				 yRect.real/(yRect.real*yRect.real + yRect.imag*yRect.imag),
				 (-1)*(yRect.imag/(yRect.real*yRect.real + yRect.imag*yRect.imag))
			};
	break;
	}
	return modeledImpedance;
}

enum DUT_TYPE IdentifyComponentType(complexp impedance){
	enum DUT_TYPE DUT = UNDEFINED;
	if(signbit(impedance.argDeg) == 0){ //signbit() return 0 on positive floating point number, return 1 if negative.
		DUT = INDUCTOR;
	}else if(signbit(impedance.argDeg) == 1) {
		DUT = CAPACITOR;
	}
	return DUT;
}

complexp CalImpedance(complexr vFourier, complexr iFourier){
	double VFourMag = cmplxmath.rec.Magz(vFourier);
	double IFourMag = cmplxmath.rec.Magz(iFourier);
	double VFourArg = cmplxmath.rec.ArgzDeg(vFourier);
	double IFourArg = cmplxmath.rec.ArgzDeg(iFourier);

	double MagZ = ((VFourMag/SC.adcSet.VoltagePGAGain*calPar.vmeas))/
			(IFourMag/(SC.adcSet.CurrentPGAGain * SC.dacSet.CurrentRangeResistor));
	double ArgZ = VFourArg - IFourArg;
	if(ArgZ > 150){
		ArgZ -= 360;
	}
	return (complexp){MagZ, ArgZ};
}

complexr CalAdmittance(complexr vFourier, complexr iFourier){
	double VFourMag = cmplxmath.rec.Magz(vFourier);
	double IFourMag = cmplxmath.rec.Magz(iFourier);
	double VFourArg = cmplxmath.rec.ArgzDeg(vFourier);
	double IFourArg = cmplxmath.rec.ArgzDeg(iFourier);
	complexp y_pol;
	double MagY = (IFourMag/(SC.adcSet.CurrentPGAGain * SC.dacSet.CurrentRangeResistor))/
			((VFourMag/SC.adcSet.VoltagePGAGain*calPar.vmeas));

	double ArgY = IFourArg - VFourArg;
	if(ArgY > 150){
		ArgY -= 360;
	}
	y_pol = (complexp){MagY, ArgY};
	return(cmplxmath.pol.PolarToRectangular(y_pol));
}

void SetRangeResistor(enum RANGE_SET RANGE) {
	HAL_GPIO_WritePin(GPIOA, RANGE_SER_LATCH_Pin, 0);
	for(int i = 7; i >= 0; i--) {
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
	switch(RANGE){
	case(RANGE_1R):
			SC.dacSet.CurrentRangeResistor = 1.0+calPar.r_Relay[0];
			SC.dacSet.CurrentRangeIndicator = 1;
			break;
	case(RANGE_10R):
		SC.dacSet.CurrentRangeResistor = 10.0+calPar.r_Relay[1];
		SC.dacSet.CurrentRangeIndicator = 10;
			break;
	case(RANGE_100R):
		SC.dacSet.CurrentRangeResistor = 100.0+calPar.r_Relay[2];
		SC.dacSet.CurrentRangeIndicator = 100;
		break;
	case(RANGE_1K):
		SC.dacSet.CurrentRangeResistor = 1000.0+calPar.r_Relay[3];
		SC.dacSet.CurrentRangeIndicator = 1000;
			break;
	case(RANGE_10K):
		SC.dacSet.CurrentRangeResistor = 10000.0+calPar.r_Relay[4];
		SC.dacSet.CurrentRangeIndicator = 10000;
		break;
	case(RANGE_100K):
		SC.dacSet.CurrentRangeResistor = 100000.0+calPar.r_Relay[5];
		SC.dacSet.CurrentRangeIndicator = 100000;
		break;
	case(RANGE_1M):
		SC.dacSet.CurrentRangeResistor = 1000000.0+calPar.r_Relay[6];
		SC.dacSet.CurrentRangeIndicator = 1000000;
		break;
	}
}

void SetPGAGain(enum PGAn PGAx, enum PGAGain gain){
	if(PGAx == PGA_V){
		switch(gain){
		case GAIN_0125:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, LOW);
			  SC.adcSet.VoltagePGAGain = 0.125;
		break;
		case GAIN_025:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, LOW);
			  SC.adcSet.VoltagePGAGain = 0.25;
		break;
		case GAIN_05:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, LOW);
			  SC.adcSet.VoltagePGAGain = 0.5;
		break;
		case GAIN_1:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, LOW);
			  SC.adcSet.VoltagePGAGain = 1.0;
		break;
		case GAIN_2:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, HIGH);
			  SC.adcSet.VoltagePGAGain = 2.0;
		break;
		case GAIN_4:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, HIGH);
			  SC.adcSet.VoltagePGAGain = 4.0;
		break;
		case GAIN_8:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, HIGH);
			  SC.adcSet.VoltagePGAGain = 8.0;
		break;
		case GAIN_16:
			  HAL_GPIO_WritePin(GPIOA, V_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, V_PGA_A2_Pin, HIGH);
			  SC.adcSet.VoltagePGAGain = 16.0;
		break;
		}
	}else if(PGAx == PGA_I){
		switch(gain){
		case GAIN_0125:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, LOW);
			  SC.adcSet.CurrentPGAGain = 0.125;
		break;
		case GAIN_025:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, LOW);
			  SC.adcSet.CurrentPGAGain = 0.25;
		break;
		case GAIN_05:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, LOW);
			  SC.adcSet.CurrentPGAGain = 0.5;
		break;
		case GAIN_1:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, LOW);
			  SC.adcSet.CurrentPGAGain = 1.0;
		break;
		case GAIN_2:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, HIGH);
			  SC.adcSet.CurrentPGAGain = 2.0;
		break;
		case GAIN_4:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, HIGH);
			  SC.adcSet.CurrentPGAGain = 4.0;
		break;
		case GAIN_8:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, LOW);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, HIGH);
			  SC.adcSet.CurrentPGAGain = 8.0;
		break;
		case GAIN_16:
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A0_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A1_Pin, HIGH);
			  HAL_GPIO_WritePin(GPIOB, I_PGA_A2_Pin, HIGH);
			  SC.adcSet.CurrentPGAGain = 16.0;
		break;
		}
	}
}

void SetDACTestLevel(enum TestLevel range, enum IOINVERT enable){
	if(enable == HIGH){
		HAL_GPIO_WritePin(GPIOA, DAC_RANGE_EN_Pin, 0); /*Output is inverted*/
	}else{
		HAL_GPIO_WritePin(GPIOA, DAC_RANGE_EN_Pin, 1);
	}

	switch(range){
	case LVL_4V3:
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A0_Pin, 0); //Inverted from actual PCB
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A1_Pin, 0);
	break;
	case LVL_1V2:
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A0_Pin, 0); //Inverted from actual PCB
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A1_Pin, 1);
	break;
	case LVL_2V3:
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A0_Pin, 1); //Inverted from actual PCB
		 HAL_GPIO_WritePin(GPIOA, DAC_RANGE_A1_Pin, 0);
	break;
	case LVL_0V6:
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

void smpl_Z(void) {
	complexrSet VIFourCoeffs = (complexrSet){{0,0},{0,0}};
	complexrSet *ptrVIFourcoeffs = &VIFourCoeffs;
	complexr IFourCoeff = (complexr){0,0};
	complexr VFourCoeff = (complexr){0,0};
	double IFourCoeffMag = 0.0;
	double VFourCoeffMag = 0.0;
	double IFourCoeffAng = 0.0;
	double VFourCoeffAng = 0.0;
	double ZFourCoeffMag = 0.0;
	double ZFourCoeffAng = 0.0;

	complexp z;
	SC.adcSet.StartSampling();
	HAL_Delay(200);
	CommPort.ResetComm();
	HAL_Delay(10);
	VIFourCoeffs = *DFTSet.get.CalVIFourierCoeff(1);

	IFourCoeff = VIFourCoeffs.current;
	VFourCoeff = VIFourCoeffs.voltage;
	IFourCoeffMag = cmplxmath.rec.Magz(IFourCoeff);
	VFourCoeffMag = cmplxmath.rec.Magz(VFourCoeff);
	IFourCoeffAng = cmplxmath.rec.ArgzDeg(IFourCoeff);
	VFourCoeffAng = cmplxmath.rec.ArgzDeg(VFourCoeff);
	DUT.param.z = DUT.cal.GetImpedance(VFourCoeff, IFourCoeff);
}

void smpl_Y(void) {
	complexrSet VIFourCoeffs = (complexrSet){{0,0},{0,0}};
	complexrSet *ptrVIFourcoeffs = &VIFourCoeffs;
	complexr IFourCoeff = (complexr){0,0};
	complexr VFourCoeff = (complexr){0,0};
	double IFourCoeffMag = 0.0;
	double VFourCoeffMag = 0.0;
	double IFourCoeffAng = 0.0;
	double VFourCoeffAng = 0.0;
	double ZFourCoeffMag = 0.0;
	double ZFourCoeffAng = 0.0;

	complexr y;
	SC.adcSet.StartSampling();
	HAL_Delay(500);
	CommPort.ResetComm();
	HAL_Delay(10);


	VIFourCoeffs = *DFTSet.get.CalVIFourierCoeff(1);

	IFourCoeff = VIFourCoeffs.current;
	VFourCoeff = VIFourCoeffs.voltage;
	IFourCoeffMag = cmplxmath.rec.Magz(IFourCoeff);
	VFourCoeffMag = cmplxmath.rec.Magz(VFourCoeff);
	IFourCoeffAng = cmplxmath.rec.ArgzDeg(IFourCoeff);
	VFourCoeffAng = cmplxmath.rec.ArgzDeg(VFourCoeff);
	DUT.param.y = DUT.cal.GetAdmittance(VFourCoeff, IFourCoeff);
}

complexp CorrectDUT(complexr Y_MEAS, uint32_t Range) {
//	complexr rec_Z = cmplxmath.pol.PolarToRectangular(Z_DUT);
	complexp Z_DUT;
	complexr Z_M;
	complexr OS_Y;
	complexr SS_Z;
	SS_Z.real =0.0;
	SS_Z.imag = 0.0;
	Z_M = cmplxmath.rec.Reciprocalzr(Y_MEAS);
	Y_MEAS = cmplxmath.rec.Subz(Z_M, SS_Z);
	Y_MEAS = cmplxmath.rec.Reciprocalzr(Y_MEAS);

	switch (Range) {
	case 1:
		OS_Y = calPar.range_Cal_Open[0];
		OS_Y = cmplxmath.rec.Subz(Y_MEAS, OS_Y);
		OS_Y = cmplxmath.rec.Reciprocalzr(OS_Y);
		Z_DUT.argDeg = cmplxmath.rec.ArgzDeg(OS_Y)
				-atan2(SC.dacSet.CurrentRangeResistor, (1/calPar.range_Cal_Open[0].imag))*57.2958;
		Z_DUT.mod = cmplxmath.rec.Magz(OS_Y);
		break;
	case 10:
		OS_Y = calPar.range_Cal_Open[1];
		OS_Y = cmplxmath.rec.Subz(Y_MEAS, OS_Y);
		OS_Y = cmplxmath.rec.Reciprocalzr(OS_Y);
		Z_DUT.argDeg = cmplxmath.rec.ArgzDeg(OS_Y)
				-atan2(SC.dacSet.CurrentRangeResistor, (1/calPar.range_Cal_Open[1].imag))*57.2958;
		Z_DUT.mod = cmplxmath.rec.Magz(OS_Y);
		break;
	case 100:
		OS_Y = calPar.range_Cal_Open[2];
		OS_Y = cmplxmath.rec.Subz(Y_MEAS, OS_Y);
		OS_Y = cmplxmath.rec.Reciprocalzr(OS_Y);
		Z_DUT.argDeg = cmplxmath.rec.ArgzDeg(OS_Y)
				-atan2(SC.dacSet.CurrentRangeResistor, (1/calPar.range_Cal_Open[2].imag))*57.2958;
		Z_DUT.mod = cmplxmath.rec.Magz(OS_Y);
		break;
	case 1000:
		OS_Y = calPar.range_Cal_Open[3];
		OS_Y = cmplxmath.rec.Subz(Y_MEAS, OS_Y);
		OS_Y = cmplxmath.rec.Reciprocalzr(OS_Y);
		Z_DUT.argDeg = cmplxmath.rec.ArgzDeg(OS_Y)
				-atan2(SC.dacSet.CurrentRangeResistor, (1/calPar.range_Cal_Open[3].imag))*57.2958;
		Z_DUT.mod = cmplxmath.rec.Magz(OS_Y);
		break;
	case 10000:
		OS_Y = calPar.range_Cal_Open[4];
		OS_Y = cmplxmath.rec.Subz(Y_MEAS, OS_Y);
		OS_Y = cmplxmath.rec.Reciprocalzr(OS_Y);
		Z_DUT.argDeg = cmplxmath.rec.ArgzDeg(OS_Y)
				-atan2(SC.dacSet.CurrentRangeResistor, (1/calPar.range_Cal_Open[4].imag))*57.2958;
		Z_DUT.mod = cmplxmath.rec.Magz(OS_Y);
		break;
	case 100000:
		OS_Y = calPar.range_Cal_Open[5];
		OS_Y = cmplxmath.rec.Subz(Y_MEAS, OS_Y);
		OS_Y = cmplxmath.rec.Reciprocalzr(OS_Y);
		Z_DUT.argDeg = cmplxmath.rec.ArgzDeg(OS_Y)
				-atan2(SC.dacSet.CurrentRangeResistor, (1/calPar.range_Cal_Open[5].imag))*57.2958;
		Z_DUT.mod = cmplxmath.rec.Magz(OS_Y);
		break;
	case 1000000:
		OS_Y = calPar.range_Cal_Open[6];
		OS_Y = cmplxmath.rec.Subz(Y_MEAS, OS_Y);
		OS_Y = cmplxmath.rec.Reciprocalzr(OS_Y);
		Z_DUT.argDeg = cmplxmath.rec.ArgzDeg(OS_Y)
				-atan2(SC.dacSet.CurrentRangeResistor, (1/calPar.range_Cal_Open[6].imag))*57.2958;
		Z_DUT.mod = cmplxmath.rec.Magz(OS_Y);
		break;

	}

	return(Z_DUT);
}

void OS_Cal(uint32_t smpl_f, uint32_t test_f, uint32_t sampleSize) {
	CommPort.ResetComm();
	HAL_Delay(10);
	SC.adcSet.SetPGAGain(PGA_V, GAIN_1);
	SC.adcSet.SetPGAGain(PGA_I, GAIN_16);
	SC.dacSet.SetRangeResistor(RANGE_1R);
	HAL_Delay(20);
	uint32_t range_SampleSize = 3*(smpl_f/test_f);
	//double IMaxGain = 2000000;
	SC.adcSet.SetSampleSize(range_SampleSize);
	HAL_Delay(1);
	SC.dacSet.AutoRangeSMPL(range_SampleSize);
	HAL_Delay(200);
	SC.dacSet.AutoRangeV(SC.dacSet.AR_VMax, SC.dacSet.AR_VMin);
//	SC.dacSet.AutoRange(smpl_f, test_f);
//	HAL_Delay(20);
	HAL_Delay(1);
	SC.adcSet.SetSampleSize(sampleSize);

	HAL_Delay(5);
	calPar.smpl_Y();
	calPar.range_Cal_Open[0] = DUT.param.y;

	SC.dacSet.SetRangeResistor(RANGE_10R);
	HAL_Delay(20);
	calPar.smpl_Y();
	calPar.range_Cal_Open[1] = DUT.param.y;


	SC.dacSet.SetRangeResistor(RANGE_100R);
	HAL_Delay(20);
	calPar.smpl_Y();
	calPar.range_Cal_Open[2] = DUT.param.y;


	SC.dacSet.SetRangeResistor(RANGE_1K);
	HAL_Delay(20);
	calPar.smpl_Y();
	calPar.range_Cal_Open[3] = DUT.param.y;


	SC.dacSet.SetRangeResistor(RANGE_10K);
	HAL_Delay(20);
	calPar.smpl_Y();
	calPar.range_Cal_Open[4] = DUT.param.y;


	SC.dacSet.SetRangeResistor(RANGE_100K);
	HAL_Delay(20);
	calPar.smpl_Y();
	calPar.range_Cal_Open[5] = DUT.param.y;


	SC.dacSet.SetRangeResistor(RANGE_1M);
	HAL_Delay(20);
	calPar.smpl_Y();
	calPar.range_Cal_Open[6] = DUT.param.y;



}

uint32_t CalADCFrequencyWord(uint32_t frequency){
	uint32_t frqWord = frequency * (uint32_t)(SC.adcSet.ADCResolution);
	return frqWord;
}

void SetSampleSize(uint16_t sampleSize){
	CommPort.set.SetIXMode(INTERNAL); //Set to internal
	HAL_Delay(1);
	CommPort.WriteData(sampleSize, ADC_SAMPLE_SIZE_REG);//Set sample size to FPGA.
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

void AutoRangeV(int16_t VMax, int16_t VMin) {

	  float VGain = (60000.0/((float)(VMax-VMin)));
	  if((VGain >= 2)&(VGain < 4)) {
		  SC.adcSet.SetPGAGain(PGA_V, GAIN_2);
	  } else if ((VGain >= 4)&(VGain < 8)) {
		  SC.adcSet.SetPGAGain(PGA_V, GAIN_4);
	  } else if ((VGain >= 8)&(VGain < 16)) {
		  SC.adcSet.SetPGAGain(PGA_V, GAIN_8);
	  } else if (VGain >= 16) {
		  SC.adcSet.SetPGAGain(PGA_V, GAIN_16);
	  }
}
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

void AutoRangeI_PGA(int16_t IMax, int16_t IMin){
	float IGain = (60000.0/((float)(IMax-IMin)));
	  if((IGain >= 2)&(IGain < 4)) {
		  SC.adcSet.SetPGAGain(PGA_I, GAIN_2);
	  } else if ((IGain >= 4)&(IGain < 8)) {
		  SC.adcSet.SetPGAGain(PGA_I, GAIN_4);
	  } else if ((IGain >= 8)&(IGain < 16)) {
		  SC.adcSet.SetPGAGain(PGA_I, GAIN_8);
	  } else if (IGain >= 16) {
		  SC.adcSet.SetPGAGain(PGA_I, GAIN_16);
	  }
}

float AutoRangeI(int16_t IMax, int16_t IMin, float R_Range, float IMaxGain) {
	float scale = R_Range;

	float IGain = (60000.0/((float)(IMax-IMin)))*scale;
	uint8_t str[28];
	uint8_t uartBuf[21];
	if(IGain >= IMaxGain) {
	  IGain = IMaxGain;
	  SC.dacSet.I_Lim = 1;
	}
	else {
		SC.dacSet.I_Lim = 0;
	}


	  if((IGain >= 10.0)&(IGain < 200.0)) {
		  SC.dacSet.SetRangeResistor(RANGE_10R);
		  return(10.0);
	  } else if ((IGain >= 200.0)&(IGain < 1000.0)) {
		  SC.dacSet.SetRangeResistor(RANGE_100R);
		  return(100.0);
	  } else if ((IGain >= 1000.0)&(IGain < 10000.0)) {
		  SC.dacSet.SetRangeResistor(RANGE_1K);
		  return(1000.0);
	  } else if ((IGain >= 10000.0)&(IGain < 100000.0)) {
		  SC.dacSet.SetRangeResistor(RANGE_10K);
		  return(10000.0);
	  } else if ((IGain >= 100000.0)&(IGain < 1000000.0)) {
		  SC.dacSet.SetRangeResistor(RANGE_100K);
		  return(100000.0);
	  } else if ((IGain >= 1000000.0)&(IGain < 10000000.0)) {
		  SC.dacSet.SetRangeResistor(RANGE_1M);
		  return(1000000.0);
	  }


}

void AutoRangeSMPL(uint32_t smpl_size) {
	  int16_t VMax = 0;
	  int16_t VMin = 0;
	  int16_t IMax = 0;
	  int16_t IMin = 0;
	  int16_t Vint = 0;
	  int16_t Iint = 0;

	  CommPort.ResetComm();
	  SC.adcSet.SetSampleSize(smpl_size);
	  HAL_Delay(1);
	  SC.adcSet.StartSampling();
	  HAL_Delay(100);
	  for(int i = 0; i < (smpl_size); i++) {
		  Vint = SC.get.GetSingleSampleContinous();
		  Iint = SC.get.GetSingleSampleContinous();
		  if(i > 5) {
			  if(Vint > VMax) {
				  VMax = Vint;
			  }
			  else if(Vint < VMin) {
				  VMin = Vint;
			  }
			  if(Iint > IMax) {
				  IMax = Iint;
			  }
			  else if(Iint < IMin) {
				  IMin = Iint;
			  }
		  }

	  }
	  SC.dacSet.AR_VMax = VMax;
	  SC.dacSet.AR_VMin = VMin;
	  SC.dacSet.AR_IMax = IMax;
	  SC.dacSet.AR_IMin = IMin;


}

void AutoRange(uint32_t smpl_f, uint32_t test_f) {
	  CommPort.ResetComm();
	  SC.adcSet.SetPGAGain(PGA_V, GAIN_1);
	  SC.adcSet.SetPGAGain(PGA_I, GAIN_1);
	  SC.dacSet.SetRangeResistor(RANGE_1R);
	  HAL_Delay(50);
	  uint32_t range_SampleSize = 3*(smpl_f/test_f);
	  float R_Range = 1;
	  double IMaxGain = (1/((float)test_f))*(300000000.0);
	  //double IMaxGain = 2000000;
	  SC.adcSet.SetSampleSize(range_SampleSize);
	  HAL_Delay(1);

	  SC.dacSet.AutoRangeSMPL(range_SampleSize);
	  HAL_Delay(200);
	  R_Range = SC.dacSet.AutoRangeI(SC.dacSet.AR_IMax, SC.dacSet.AR_IMin, R_Range, IMaxGain);
	  HAL_Delay(50);
	  SC.dacSet.AutoRangeSMPL(range_SampleSize);
	  HAL_Delay(200);
	  R_Range = SC.dacSet.AutoRangeI(SC.dacSet.AR_IMax, SC.dacSet.AR_IMin, R_Range, IMaxGain);
	  HAL_Delay(50);
	  SC.dacSet.AutoRangeSMPL(range_SampleSize);
	  HAL_Delay(200);
	  SC.dacSet.AutoRangeV(SC.dacSet.AR_VMax, SC.dacSet.AR_VMin);
	  SC.dacSet.AutoRangeI_PGA(SC.dacSet.AR_IMax, SC.dacSet.AR_IMin);
}

uint8_t AutoRangeCheck(uint32_t smpl_f, uint32_t test_f) {
	int32_t IDiff = 0;
	int32_t VDiff = 0;
	uint8_t state = 0;
	CommPort.ResetComm();
	HAL_Delay(20);
	uint32_t range_SampleSize = 3*(smpl_f/test_f);
	float R_Range = 1;
	double IMaxGain = (1/((float)test_f))*(30000000.0);
	//double IMaxGain = 2000000;
	SC.adcSet.SetSampleSize(range_SampleSize);
	HAL_Delay(1);
	SC.dacSet.AutoRangeSMPL(range_SampleSize);
	HAL_Delay(100);
	IDiff = SC.dacSet.AR_IMax-SC.dacSet.AR_IMin;
	VDiff = SC.dacSet.AR_VMax-SC.dacSet.AR_VMin;
	if((IDiff < 3000)|(VDiff <3000)) {
		if(SC.dacSet.I_Lim != 1) {
			state = 1;
		}
	}
	if((IDiff > 62000)|(VDiff >62000)) {
		state = 1;
	}
	return(state);
}


double Argzr(complexr z)
{
  return atan2(z.imag, z.real); //atan2() tager højde for og korrigerer tangens fejl.
}
double ArgzDegr(complexr z)
{
	return (atan2(z.imag, z.real) * (180/M_PI)); //atan2() tager højde for og korrigerer tangens fejl.
}
double Magzr(complexr z)
{
  return sqrt(z.real*z.real + z.imag*z.imag);
}
complexr Addzr(complexr a, complexr b){
	return (complexr){a.real + b.real, a.imag + b.imag};
}
complexr Subzr(complexr a, complexr b){
	return (complexr){a.real - b.real, a.imag - b.imag};
}
complexr Dividezr(complexr v, complexr i){
	complexr z = (complexr)
	{(v.real*i.real + v.imag*i.imag)/((i.imag*i.imag) +(i.real*i.real)),
	((v.imag * i.real) - (v.real*i.imag))/((i.imag * i.imag) + (i.real * i.real))};
	return z;
}
complexr Prodzr(complexr a, complexr b){
	complexr z = (complexr)
		{a.real*b.real-a.imag*b.imag,a.real*b.imag+a.imag*b.real};
	return z;

}

complexr Reciprocalzr(complexr a){
	return (complexr){
		a.real/(a.real*a.real + a.imag*a.imag),
		(-1)*(a.imag/(a.real*a.real + a.imag*a.imag))
	};
}
complexp Reciprocalzp(complexp z){
	return (complexp){1/z.mod,-1*z.argDeg};
}
complexr PolarToRectangular(complexp z){
	return (complexr){
		z.mod * cos(DegToRadians(z.argDeg)),
		z.mod * sin(DegToRadians(z.argDeg))
	};
}

double DegToRadians(double angle){
	return angle * (M_PI/180.0);
}



/*
 * Computes the fourier coefficient at the "k" frequency index in the DFT*/
complexrSet *CalVIFourierCoeff(uint8_t reset){

	struct DiscFourTf *DFT = DFTSet.ctrl.selfAddr;
	complexr fourierCoeffV = (complexr){0,0};
	complexr fourierCoeffI = (complexr){0,0};
	static complexrSet fourierVI =(complexrSet){{0,0},{0,0}};
	DFT->set.nCurrentSampleIndex = 0;
	DFT->set.nVoltageSampleIndex = 0;
	complexr nextSampleFourierContribution = (complexr){0,0};
	int16_t nextSample = 0;
	if(reset == 1){
		fourierVI =(complexrSet){{0,0},{0,0}};
	}

	for(uint16_t i = 0; i < DFT->set.NSampleSize*2; i++){
		//Get next sample from external memory, could be voltage or current. Even i = voltage, Odd i = current
		nextSample = SC.get.GetSingleSampleContinous();
		//Calculate fourier contribution at nextSample to the DFT.
		//complexr nextSampleFourierContribution = DFT->get.CalSingleSampleFourierContribution(nextSample);

		//Check for even of odd i.
		if((i % 2) == 0){ //Even i, voltage. Voltage sample multiplied by (-1) because of inversion in hardware
			nextSampleFourierContribution = DFT->get.CalSingleSampleFourierContribution((1)*nextSample, DFT->set.nVoltageSampleIndex);
			if(isnan(nextSampleFourierContribution.imag) || isnan(nextSampleFourierContribution.real)){
				fourierCoeffV = (complexr){-1,-1};
				break;
			}else{
				fourierCoeffV = cmplxmath.rec.Addz(fourierCoeffV, nextSampleFourierContribution);
			//Increment time index to next sample.
				DFT->set.nVoltageSampleIndex++;
			}
		}else{ // Odd i, current
			nextSampleFourierContribution = DFT->get.CalSingleSampleFourierContribution((-1)*nextSample, DFT->set.nCurrentSampleIndex);
			if(isnan(nextSampleFourierContribution.imag) || isnan(nextSampleFourierContribution.real)){
				fourierCoeffI = (complexr){-1,-1};
				break;
			}else{
				fourierCoeffI = cmplxmath.rec.Addz(fourierCoeffI, nextSampleFourierContribution);
			//Increment time index to next sample.
				DFT->set.nCurrentSampleIndex++;
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
complexr CalSingleSampleFourierContribution(int16_t inputSample, uint16_t nTimeIndex){
	struct DiscFourTf *DFT = DFTSet.ctrl.selfAddr;
	static complexr fourierPartCoeff = (complexr){0,0};
	if(DFT->set.NSampleSize != 0){ /*Calculate part of the fourier coefficient*/
		double angle = (2.0*M_PI * (double)DFT->set.kFrequencyIndex * (double)nTimeIndex)/(double)DFT->set.NSampleSize;
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
int16_t SignedToUnsignedBinary(uint16_t signedBinary){
	int16_t binary = 0;
	if((signedBinary) & (1<<16)) {
		binary = (signedBinary ^ 1<<16)*(-1);
	}
	else{
		binary = signedBinary;
	}
	return binary;
}

int16_t GetSingleSampleContinous(){
	int16_t sample;
	CommPort.set.SetIOMode(READ); //Set MCU to READ mode
	CommPort.set.SetRnW(READ);    //Set RW pin to READ
	CommPort.set.SetIXMode(EXTERNAL); //Set internal/external switch-over MUX to External memory mode
	/*
	* CLK 1 -> Address 0 from external memory. (ADC0 DATA)
	* CLK 2 -> Address 1 from external memory. (ADC1 DATA)
	* */
	CommPort.set.PulseCLK(); //ADC "n" data
	CommPort.set.GetIOValue(&sample); //Read IO port value
	sample = SignedToUnsignedBinary(sample);

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





//TEMP

void tempPrint(uint16_t f_sampleSize, uint16_t testVar) {
	int16_t VMeas = 0;
	int16_t IMeas = 0;
	char str[25];
	uint8_t uartBuf[21];
	HAL_Delay(10);
	CommPort.ResetComm();
		CommPort.WriteData(0x8000, 7);
		HAL_Delay(500);
		CommPort.set.SetIOMode(READ);
		CommPort.set.SetRnW(READ);
		CommPort.set.SetIXMode(EXTERNAL);
		HAL_Delay(5);
			for(int i = 0; i< f_sampleSize; i++) {

			CommPort.set.PulseCLK();
			CommPort.set.GetIOValue(&testVar);
			//CommPort.set.PulseCLK();
	//
			if((testVar) & (1<<16)) {
				VMeas = (testVar ^ 1<<16)*(-1);
			}
			else{
				VMeas = testVar;
			}
			VMeas*=-1;
			HAL_Delay(1);
			sprintf(str, "Voltage:");
			strcpy((char*)uartBuf, str);
			HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
			float meas = VMeas*(4.999/32768.0);
			sprintf(str, "%.6f", (meas));
			strcpy((char*)uartBuf, str);
			HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);

			sprintf(str, ",");
			strcpy((char*)uartBuf, str);
			HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
			CommPort.set.PulseCLK();
			CommPort.set.GetIOValue(&testVar);
			//CommPort.set.PulseCLK();
	//
			if((testVar) & (1<<16)) {
				VMeas = (testVar ^ 1<<16)*(-1);
			}
			else{
				VMeas = testVar;
			}
			HAL_Delay(1);
			sprintf(str, "Current:");
			strcpy((char*)uartBuf, str);
			HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
			meas = VMeas*(4.999/32768.0);
			sprintf(str, "%.6f\r\n", (meas));
			strcpy((char*)uartBuf, str);
			HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);

			HAL_Delay(4);
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

	//Complex Math Functions
	cmplxmath.rec.Argz = Argzr;
	cmplxmath.rec.ArgzDeg = ArgzDegr;
	cmplxmath.rec.Magz = Magzr;
	cmplxmath.rec.Addz = Addzr;
	cmplxmath.rec.Subz = Subzr;
	cmplxmath.rec.Dividez = Dividezr;
	cmplxmath.rec.Prodzr = Prodzr;
	cmplxmath.rec.Reciprocalzr = Reciprocalzr;
	cmplxmath.pol.Reciprocalzp = Reciprocalzp;
	cmplxmath.pol.PolarToRectangular = PolarToRectangular;
	//DUT Functions
	DUT.cal.GetImpedance = CalImpedance;
	DUT.cal.GetAdmittance = CalAdmittance;
	DUT.cal.IdentifyComponentType = IdentifyComponentType;
	DUT.cal.ToImpedanceModel = ConvertImpedanceModel;
	DUT.cal.LossTangent = CalLossTangent;
	DUT.cal.QualityFactor = CalQualityFactor;
	DUT.cal.ModelResistance = GetModelResistance;
	DUT.cal.InductanceMagnitude = CalInductanceMag;
	DUT.cal.CapacitanceMagnitude = CalCapacitanceMag;
	//DFT Functions
	DFTSet.ctrl.selfAddr = &DFTSet;
	DFTSet.set.nCurrentSampleIndex = 0;
	DFTSet.set.nVoltageSampleIndex = 0;
	DFTSet.set.nSampleIndex = 0;
	DFTSet.get.GetkFrequencyIndex = GetkFrequencyIndex;
	DFTSet.get.CalDFTResolution = CalDFTResolution;
	DFTSet.get.CalVIFourierCoeff = CalVIFourierCoeff;
	DFTSet.get.CalSingleSampleFourierContribution = CalSingleSampleFourierContribution;
	//Sample Control Functions
	SC.get.GetSingleSampleContinous = GetSingleSampleContinous;
	SC.dacSet.DACResolution = 214.748365;
	SC.dacSet.CalDACFrequencyWord = CalDACFrequencyWord;
	SC.adcSet.ADCResolution = 214.748365;
	SC.adcSet.CalADCFrequencyWord = CalADCFrequencyWord;
	SC.adcSet.SetADCSampleFrequency = SetADCSampleFrequency;
	SC.adcSet.SetSampleSize = SetSampleSize;
	SC.adcSet.StartSampling = StartSampling;
	SC.dacSet.TestLevel = SetDACTestLevel;
	SC.adcSet.SetPGAGain = SetPGAGain;
	SC.dacSet.SetRangeResistor = SetRangeResistor;
	SC.dacSet.SetDACFrequency = SetDACFrequency;
	SC.dacSet.AutoRangeV = AutoRangeV;
	SC.dacSet.AutoRangeI = AutoRangeI;
	SC.dacSet.AutoRangeI_PGA = AutoRangeI_PGA;
	SC.dacSet.AutoRangeSMPL = AutoRangeSMPL;
	SC.dacSet.AutoRange = AutoRange;
	SC.dacSet.AutoRangeCheck = AutoRangeCheck;

	//FPGA <-> MCU Communication Functions
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

	calPar.OS_Cal = OS_Cal;
	calPar.smpl_Z = smpl_Z;
	calPar.smpl_Y = smpl_Y;
	calPar.CorrectDUT = CorrectDUT;

	//Calibration Constants:
	calPar.vmeas = 1.000605;	//Voltage Calibration Constant
	calPar.r_Relay[1] = 0.0113;
	calPar.r_Relay[2] = -0.24945;
	calPar.r_Relay[3] = -1.7634;
	calPar.r_Relay[4] = -27.766;
	calPar.r_Relay[5] = -344.7;
	calPar.r_Relay[6] = 0;

	uint8_t uartBuf[21];

	complexrSet VIFourCoeffs = (complexrSet){{0,0},{0,0}};
	complexrSet *ptrVIFourcoeffs = &VIFourCoeffs;
	complexr IFourCoeff = (complexr){0,0};
	complexr VFourCoeff = (complexr){0,0};
	double IFourCoeffMag = 0.0;
	double VFourCoeffMag = 0.0;
	double IFourCoeffAng = 0.0;
	double VFourCoeffAng = 0.0;
	double ZFourCoeffMag = 0.0;
	double ZFourCoeffAng = 0.0;
	complexp z;
	IFourCoeffMag = cmplxmath.rec.Magz(IFourCoeff);
	//TEMP
	uint16_t testVar = 0;
	uint16_t f_sampleSize = 0;
	float f_set = 1000000;
	int16_t val = 0;
	char str[25];
	uint32_t f_word = (uint32_t)(f_set*214.748365);
	int16_t VMeas = 0;
	int16_t IMeas = 0;
	uint32_t smpl_word = (uint32_t)(f_set*214.748365);
	float smpl_set = 100000;



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

  uint16_t sampleSize = 32000;
  uint16_t sampleF = 1000000;
  uint16_t testF = 100000;
  double testZ = 0;

  TestParameters testPar = (TestParameters){10000, 320000, 32000, 1};
//  for(int i=0; i < 7; i++) {
//	  calPar.r_Relay[i] = 0.06;
//  }


  CommPort.ResetComm();
  SC.adcSet.SetSampleSize(testPar.sampleSize);
  SC.adcSet.SetADCSampleFrequency(testPar.sampleFrequency);
  SC.dacSet.SetDACFrequency(testPar.testFrequency);
  //
  DFTSet.set.NSampleSize = testPar.sampleSize;
  DFTSet.set.DFTres = DFTSet.get.CalDFTResolution(testPar.sampleSize, testPar.sampleFrequency); //Lav gets til disse
  DFTSet.set.kFrequencyIndex = DFTSet.get.GetkFrequencyIndex(testPar.testFrequency, DFTSet.set.DFTres);

  SC.adcSet.SetPGAGain(PGA_V, GAIN_1);
  SC.adcSet.SetPGAGain(PGA_I, GAIN_1);
  SC.dacSet.SetRangeResistor(RANGE_100R);
  SC.dacSet.TestLevel(LVL_3, HIGH);
//  SC.dacSet.AutoRange(testPar.sampleFrequency, testPar.testFrequency);

  calPar.OS_Cal(testPar.sampleFrequency, testPar.testFrequency, testPar.sampleSize);
//  sprintf(str, "Range0 Z: ");
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//  sprintf(str, "%.2f\r\n ", (calPar.range_Cal_Open[0]));
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//
//  sprintf(str, "Range1 Z: ");
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//  sprintf(str, "%.2f\r\n ", (calPar.range_Cal_Open[1]));
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//
//  sprintf(str, "Range2 Z: ");
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//  sprintf(str, "%.2f\r\n ", (calPar.range_Cal_Open[2]));
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//
//  sprintf(str, "Range3 Z: ");
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//  sprintf(str, "%.2f\r\n ", (calPar.range_Cal_Open[3]));
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//
//  sprintf(str, "Range4 Z: ");
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//  sprintf(str, "%.2f\r\n ", (calPar.range_Cal_Open[4]));
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//
  sprintf(str, "Range5 Real: ");
  strcpy((char*)uartBuf, str);
  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
  sprintf(str, "%.2f\r\n ", (1/calPar.range_Cal_Open[5].real));
  strcpy((char*)uartBuf, str);
  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);

  sprintf(str, "Range5 Imag: ");
  strcpy((char*)uartBuf, str);
  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
  sprintf(str, "%.2f\r\n ", (1/calPar.range_Cal_Open[5].imag));
  strcpy((char*)uartBuf, str);
  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);

//  sprintf(str, "Range6 Z: ");
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//  sprintf(str, "%.2f\r\n ", (calPar.range_Cal_Open[6]));
//  strcpy((char*)uartBuf, str);
//  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//  HAL_Delay(2000);

//  SC.adcSet.SetPGAGain(PGA_V, GAIN_1);
//  SC.adcSet.SetPGAGain(PGA_I, GAIN_16);
//  SC.dacSet.SetRangeResistor(RANGE_100R);

  CommPort.ResetComm();
  SC.adcSet.SetSampleSize(testPar.sampleSize);

  while (1)
  {
	  if(SC.dacSet.AutoRangeCheck(testPar.sampleFrequency, testPar.testFrequency) == 1) {
		  SC.dacSet.AutoRange(testPar.sampleFrequency, testPar.testFrequency);
	  }
	  SC.adcSet.SetSampleSize(testPar.sampleSize);
//	  Calculate fourier coefficient at 10kHz
	  SC.adcSet.StartSampling();
	  HAL_Delay(1200);
	  CommPort.ResetComm();
	  HAL_Delay(10);
	  VIFourCoeffs = *DFTSet.get.CalVIFourierCoeff(1);

	  IFourCoeff = VIFourCoeffs.current;
	  VFourCoeff = VIFourCoeffs.voltage;
	  IFourCoeffMag = cmplxmath.rec.Magz(IFourCoeff);
	  VFourCoeffMag = cmplxmath.rec.Magz(VFourCoeff);
	  IFourCoeffAng = cmplxmath.rec.ArgzDeg(IFourCoeff);
	  VFourCoeffAng = cmplxmath.rec.ArgzDeg(VFourCoeff);
//	  DUT.param.z = DUT.cal.GetImpedance(VFourCoeff, IFourCoeff);
	  DUT.param.y = DUT.cal.GetAdmittance(VFourCoeff, IFourCoeff);
//	  ZFourCoeffMag = (VFourCoeffMag/2.0) / ((IFourCoeffMag/(8.0*100)));
//	  ZFourCoeffAng=  VFourCoeffAng - IFourCoeffAng;

	  sprintf(str, "DFT V X[10kHz] MAG : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.2f ", (VFourCoeffMag));
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);

	  sprintf(str, "PHI : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.2f\n", (VFourCoeffAng));
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);


	  sprintf(str, "DFT I X[10kHz] MAG : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.2f ", (IFourCoeffMag));
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);


	  sprintf(str, "PHI : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.2f\n", (IFourCoeffAng));
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);

////
//	  sprintf(str, "Impedance MAG : ");
//	  strcpy((char*)uartBuf, str);
//	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//	  sprintf(str, "%.2f", (ZFourCoeffMag));
//	  strcpy((char*)uartBuf, str);
//	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//
//
//
//	  sprintf(str, "PHI : ");
//	  strcpy((char*)uartBuf, str);
//	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//	  sprintf(str, "%.2f\n", (ZFourCoeffAng));
//	  strcpy((char*)uartBuf, str);
//	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);


//
	  DUT.param.z = calPar.CorrectDUT(DUT.param.y, SC.dacSet.CurrentRangeIndicator);
	  complexr device = cmplxmath.pol.PolarToRectangular(DUT.param.z);
//	  double Cap = DUT.cal.CapacitanceMagnitude(testPar.sampleFrequency, device);

	  sprintf(str, "Impedance MAG : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.5f", DUT.param.z.mod);
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);



	  sprintf(str, " PHI : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.5f\n", DUT.param.z.argDeg);
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);



	  sprintf(str, "Capacitance : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.12f", (device.imag/(2*M_PI*testPar.testFrequency))*1.0E6);
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);

	  sprintf(str, " uH : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);



	  HAL_Delay(2000);

		//Random string functions
		//sprintf(str, "%.2f\r\n", (VFourCoeffMag));
		//strcpy((char*)uartBuf, str);
		//HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
		//HAL_Delay(10);

	//}

    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	  tempPrint(200, testVar);
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
