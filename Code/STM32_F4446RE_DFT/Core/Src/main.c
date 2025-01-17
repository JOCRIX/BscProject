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
	RANGE_1M = 1,
	RANGE_OFF = 7
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
void OS_Cal(uint32_t smpl_f, uint32_t test_f, uint32_t sampleSize, double phaseCorrection);
complexp CorrectDUT(complexr Y_MEAS, uint32_t Range, uint32_t frq);
double PhaseCorrection(double phi, double frq, enum PGAGain vGain, enum PGAGain iGain);
uint32_t smplTime(uint32_t smpl_f, uint32_t smpl_size);
void get_Z(void);

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
		uint32_t (*smplTime)(uint32_t, uint32_t);
		double VoltagePGAGain;
		double CurrentPGAGain;
		enum PGAGain CurrentPGA_V;
		enum PGAGain CurrentPGA_C;
	}adcSet;
	struct DACSettings{
		float DACResolution;
		uint32_t DACFrqWord;
		uint32_t(*CalDACFrequencyWord)(uint32_t);
		void(*SetDACFrequency)(uint32_t);
		void(*TestLevel)(enum TestLevel, enum IOINVERT);
		void(*SetRangeResistor)(enum RANGE_SET);
		void (*AutoRangeV)(int16_t, int16_t);
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
		void (*get_Z)(void);
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
	void (*OS_Cal)(uint32_t, uint32_t, uint32_t, double);
	float r_Relay[7];
	double vmeas;
	double imeas;
	complexr range_Cal_Open[7];
	complexp (*CorrectDUT)(complexr, uint32_t, uint32_t);
	struct PhaseCal{
		double a_phi;
		double b_phi;
		double iLag_16;
		double iLag_8;
		double iLag_4;
		double iLag_2;
		double iLag_1;
		double vLag_16;
		double vLag_8;
		double vLag_4;
		double vLag_2;
		double vLag_1;
		double mBW_16;
		double mBW_8;
		double mBW_4;
		double mBW_2;
		double mBW_1;
		double (*CorrectPhi)(double, double, enum PGAGain, enum PGAGain);
	}PhiCal;
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
	case(RANGE_OFF):

	}
}

void SetPGAGain(enum PGAn PGAx, enum PGAGain gain){
	if(PGAx == PGA_V){
		SC.adcSet.CurrentPGA_V = gain;
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
		SC.adcSet.CurrentPGA_C = gain;
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

void get_Z(void) {
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
	CommPort.ResetComm();
	VIFourCoeffs = *DFTSet.get.CalVIFourierCoeff(1);
	IFourCoeff = VIFourCoeffs.current;
	VFourCoeff = VIFourCoeffs.voltage;
	IFourCoeffMag = cmplxmath.rec.Magz(IFourCoeff);
	VFourCoeffMag = cmplxmath.rec.Magz(VFourCoeff);
	IFourCoeffAng = cmplxmath.rec.ArgzDeg(IFourCoeff);
	VFourCoeffAng = cmplxmath.rec.ArgzDeg(VFourCoeff);
	DUT.param.z = DUT.cal.GetImpedance(VFourCoeff, IFourCoeff);
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
	HAL_Delay(35);
	CommPort.ResetComm();
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
	HAL_Delay(35);
	CommPort.ResetComm();
	VIFourCoeffs = *DFTSet.get.CalVIFourierCoeff(1);
	IFourCoeff = VIFourCoeffs.current;
	VFourCoeff = VIFourCoeffs.voltage;
	IFourCoeffMag = cmplxmath.rec.Magz(IFourCoeff);
	VFourCoeffMag = cmplxmath.rec.Magz(VFourCoeff);
	IFourCoeffAng = cmplxmath.rec.ArgzDeg(IFourCoeff);
	VFourCoeffAng = cmplxmath.rec.ArgzDeg(VFourCoeff);
	DUT.param.y = DUT.cal.GetAdmittance(VFourCoeff, IFourCoeff);
}

complexp CorrectDUT(complexr Y_MEAS, uint32_t Range, uint32_t frq) {
//	complexr rec_Z = cmplxmath.pol.PolarToRectangular(Z_DUT);
	complexp Z_DUT;
	complexr Z_M = Y_MEAS;
	complexr OS_Y;
	complexr SS_Z;
	complexr OS_Z;
	complexr workWar;
//	SS_Z.real =0.012;
//	SS_Z.imag = 0.0473; //About 175 nH
	SS_Z.real =0.005;
	SS_Z.imag = 0.00792; //About 175 nH 100 kHz
//	SS_Z.real =0.004974;
//	SS_Z.imag = 0.000113; //About 175 nH
	double calDeg = 0;
	double RP = 0;

	complexr top;
	complexr div;
	double Ro = 10.0;
	double RR = SC.dacSet.CurrentRangeResistor;
	complexr Zcm;

	switch(Range){
		case(1):
			Zcm = calPar.range_Cal_Open[0];
			break;
		case(10):
			Zcm = calPar.range_Cal_Open[1];
			break;
		case(100):
			Zcm = calPar.range_Cal_Open[2];
			break;
		case(1000):
			Zcm = calPar.range_Cal_Open[3];
			break;
		case(10000):
			Zcm = calPar.range_Cal_Open[4];
			break;
		case(100000):
			Zcm = calPar.range_Cal_Open[5];
			break;
		case(1000000):
			Zcm = calPar.range_Cal_Open[6];
			break;
	}
//	Zcm.real = 1958.9;
//	Zcm.imag = -18445.5;
	Zcm.real-= (RR+(2*Ro));
	Zcm.real/= 2.0;
	Zcm.imag/= 2.0;
	Zcm = cmplxmath.rec.Subz(Zcm, SS_Z);

//	Zcm.real = 1417.1/2.0;
//	Zcm.imag = -14991.2/2.0;
	OS_Z.real = 0.1;
	OS_Z.imag = -1989437*(100000.0/((double)frq));


	top.real = 2.0*RR+4.0*Ro;
	top.imag = 0.0;
	top = cmplxmath.rec.Prodzr(Zcm, top);
	workWar = cmplxmath.rec.Prodzr(Zcm, Zcm);
	workWar.real*= 2.0;
	workWar.imag*= 2.0;
	workWar.real+= RR+Ro;
	top = cmplxmath.rec.Addz(top, workWar);
	top = cmplxmath.rec.Prodzr(top, Z_M);

	div.real = RR + Ro;
	div.imag = 0.0;
	div = cmplxmath.rec.Addz(div, Zcm);
			workWar.real = RR +(2.0*Ro) -Z_M.real+2.0*Zcm.real;
	workWar.imag = -Z_M.imag+(2.0*Zcm.imag);
	div = cmplxmath.rec.Prodzr(div, workWar);

	workWar = cmplxmath.rec.Dividez(top, div);

	workWar = cmplxmath.rec.Subz(workWar, SS_Z);

	Z_DUT.mod = cmplxmath.rec.Magz(workWar);
	Z_DUT.argDeg = cmplxmath.rec.ArgzDeg(workWar);

	return(Z_DUT);
}

void OS_Cal(uint32_t smpl_f, uint32_t test_f, uint32_t sampleSize, double phaseCorrect) {
	CommPort.ResetComm();
	uint32_t smpl_time = SC.adcSet.smplTime(smpl_f, sampleSize);
	SC.adcSet.SetPGAGain(PGA_V, GAIN_1);
	SC.adcSet.SetPGAGain(PGA_I, GAIN_16);
	SC.dacSet.SetRangeResistor(RANGE_1R);
	HAL_Delay(10);
	uint32_t range_SampleSize = 3*(smpl_f/test_f);
	uint32_t r_smpl_time = ((range_SampleSize*1000)/smpl_f)+5;
	if(r_smpl_time <= 1) {
		r_smpl_time = 5;
	}
	//double IMaxGain = 2000000;
	SC.adcSet.SetSampleSize(range_SampleSize);
	SC.dacSet.AutoRangeSMPL(range_SampleSize);
	HAL_Delay(r_smpl_time);
	SC.dacSet.AutoRangeV(SC.dacSet.AR_VMax, SC.dacSet.AR_VMin);
	SC.adcSet.SetSampleSize(sampleSize);
	phaseCorrect = calPar.PhiCal.CorrectPhi(0, (double)test_f, SC.adcSet.CurrentPGA_V, SC.adcSet.CurrentPGA_C);
	SC.adcSet.StartSampling();
	HAL_Delay(smpl_time);
	DUT.cal.get_Z();
	DUT.param.z.argDeg-=phaseCorrect;
	calPar.range_Cal_Open[0] = (cmplxmath.pol.PolarToRectangular(DUT.param.z));

	SC.dacSet.SetRangeResistor(RANGE_10R);
	HAL_Delay(10);
	SC.adcSet.StartSampling();
	HAL_Delay(smpl_time);
	DUT.cal.get_Z();
	DUT.param.z.argDeg-=phaseCorrect;
	calPar.range_Cal_Open[1] = (cmplxmath.pol.PolarToRectangular(DUT.param.z));

	SC.dacSet.SetRangeResistor(RANGE_100R);
	HAL_Delay(10);
	SC.adcSet.StartSampling();
	HAL_Delay(smpl_time);
	DUT.cal.get_Z();
	phaseCorrect = calPar.PhiCal.CorrectPhi(0, (double)test_f, SC.adcSet.CurrentPGA_V, SC.adcSet.CurrentPGA_C);
	DUT.param.z.argDeg-=phaseCorrect;
	calPar.range_Cal_Open[2] = (cmplxmath.pol.PolarToRectangular(DUT.param.z));

	SC.dacSet.SetRangeResistor(RANGE_1K);
	HAL_Delay(10);
	SC.adcSet.StartSampling();
	HAL_Delay(smpl_time);
	DUT.cal.get_Z();
	DUT.param.z.argDeg-=phaseCorrect;
	calPar.range_Cal_Open[3] = (cmplxmath.pol.PolarToRectangular(DUT.param.z));

	SC.dacSet.SetRangeResistor(RANGE_10K);
	HAL_Delay(10);
	SC.adcSet.StartSampling();
	HAL_Delay(smpl_time);
	DUT.cal.get_Z();
	phaseCorrect = calPar.PhiCal.CorrectPhi(0, (double)test_f, SC.adcSet.CurrentPGA_V, SC.adcSet.CurrentPGA_C);
	DUT.param.z.argDeg-=phaseCorrect;
	calPar.range_Cal_Open[4] = (cmplxmath.pol.PolarToRectangular(DUT.param.z));


	SC.dacSet.SetRangeResistor(RANGE_100K);
	HAL_Delay(10);
	SC.adcSet.StartSampling();
	HAL_Delay(smpl_time);
	DUT.cal.get_Z();
	phaseCorrect = calPar.PhiCal.CorrectPhi(0, (double)test_f, SC.adcSet.CurrentPGA_V, SC.adcSet.CurrentPGA_C);
	DUT.param.z.argDeg-=phaseCorrect;
	calPar.range_Cal_Open[5] = (cmplxmath.pol.PolarToRectangular(DUT.param.z));


	SC.dacSet.SetRangeResistor(RANGE_1M);
	HAL_Delay(10);
	SC.adcSet.StartSampling();
	HAL_Delay(smpl_time);
	DUT.cal.get_Z();
	DUT.param.z.argDeg-=phaseCorrect;
	calPar.range_Cal_Open[6] = (cmplxmath.pol.PolarToRectangular(DUT.param.z));
}

uint32_t CalADCFrequencyWord(uint32_t frequency){
	uint32_t frqWord = (uint32_t)((float)frequency * (SC.adcSet.ADCResolution));
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
	uint32_t frqWord =	(uint32_t)((float)frequency * (SC.dacSet.DACResolution));
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
	  uint32_t Vpp = VMax - VMin;
	  if(Vpp <= 4000) {
		  SC.adcSet.SetPGAGain(PGA_V, GAIN_16);
	  } else if ((Vpp > 4000)&(Vpp <= 7500)) {
		  SC.adcSet.SetPGAGain(PGA_V, GAIN_8);
	  } else if ((Vpp > 7500)&(Vpp <= 15000)) {
		  SC.adcSet.SetPGAGain(PGA_V, GAIN_4);
	  } else if ((Vpp > 15000)&(Vpp <= 30000)) {
		  SC.adcSet.SetPGAGain(PGA_V, GAIN_2);
	  } else {
		  SC.adcSet.SetPGAGain(PGA_V, GAIN_1);
	  }
}
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////

void AutoRangeI_PGA(int16_t IMax, int16_t IMin){
	  uint32_t Ipp = IMax - IMin;
	  if(Ipp <= 4000) {
		  SC.adcSet.SetPGAGain(PGA_I, GAIN_16);
	  } else if ((Ipp > 4000)&(Ipp <= 7500)) {
		  SC.adcSet.SetPGAGain(PGA_I, GAIN_8);
	  } else if ((Ipp > 7500)&(Ipp <= 15000)) {
		  SC.adcSet.SetPGAGain(PGA_I, GAIN_4);
	  } else if ((Ipp > 15000)&(Ipp <= 30000)) {
		  SC.adcSet.SetPGAGain(PGA_I, GAIN_2);
	  } else {
		  SC.adcSet.SetPGAGain(PGA_I, GAIN_1);
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
	  HAL_Delay(35);
	  for(int i = 0; i < (smpl_size); i++) {
		  Vint = SC.get.GetSingleSampleContinous();
		  Iint = SC.get.GetSingleSampleContinous();
		  if(i > 5) {
			  if(Vint > VMax) {
				  VMax = Vint;
			  } else if(Vint < VMin) {
				  VMin = Vint;
			  } if(Iint > IMax) {
				  IMax = Iint;
			  } else if(Iint < IMin) {
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

	  uint32_t MAX_R = 0;
	  uint16_t PGA_SET = 0;
	  uint16_t R_SET = 0;
	  double CR = (double)SC.dacSet.CurrentRangeIndicator;
	  double Z = 0;
	  if (test_f > 300000) {
		  MAX_R = 100;
	  }  else if (test_f > 100000) {
		  MAX_R = 1000;
	  }  else if (test_f > 3000) {
		  MAX_R = 10000;
	  }  else if (test_f > 300) {
		  MAX_R = 100000;
	  }	else {
		  MAX_R = 1000000;
	  }
	  uint32_t range_SampleSize = 3*(smpl_f/test_f);
	  SC.adcSet.SetSampleSize(range_SampleSize);
	  SC.dacSet.AutoRangeSMPL(range_SampleSize);
	  double Ipp = (double)(SC.dacSet.AR_IMax - SC.dacSet.AR_IMin);
	  double Vpp = (double)(SC.dacSet.AR_VMax - SC.dacSet.AR_VMin);
	  Z = (Vpp / Ipp)*(CR*SC.adcSet.CurrentPGAGain/SC.adcSet.VoltagePGAGain);
	  if((Ipp > 62000)|( Vpp > 62000)) {
		  R_SET = 1;
	  }
	  else {
		  if ((Z< (0.28*CR))|(Z>(3.2*CR))) {
			  R_SET = 1;
			  if(((CR >= (double)MAX_R)&(Z > 3.2*CR))|((CR <= 3.2)&(Z <0.28*CR))) {
				  R_SET = 0;
				  PGA_SET = 1;
			  }
		  } else {
			  R_SET = 0;
//			  if((Ipp < 20000)|(Vpp <20000)) {
//				  PGA_SET = 1;
//			  }
		  }

	  }

		  if(R_SET == 1) {
			  SC.adcSet.SetPGAGain(PGA_V, GAIN_1);
			  SC.adcSet.SetPGAGain(PGA_I, GAIN_1);
			  SC.dacSet.SetRangeResistor(RANGE_1R);
			  SC.dacSet.AutoRangeSMPL(range_SampleSize);
			  double Ipp = (double)(SC.dacSet.AR_IMax - SC.dacSet.AR_IMin);
			  double Vpp = (double)(SC.dacSet.AR_VMax - SC.dacSet.AR_VMin);
			  Z = (Vpp/Ipp);
			  if(Ipp < 3400) {
				  SC.adcSet.SetPGAGain(PGA_I, GAIN_16);
				  SC.dacSet.AutoRangeSMPL(range_SampleSize);
				  Ipp = (double)(SC.dacSet.AR_IMax - SC.dacSet.AR_IMin);
				  Vpp = (double)(SC.dacSet.AR_VMax - SC.dacSet.AR_VMin);
				  if (Ipp < 2000) {
					  SC.adcSet.SetPGAGain(PGA_I, GAIN_1);
					  SC.dacSet.SetRangeResistor(RANGE_1K);
					  SC.dacSet.AutoRangeSMPL(range_SampleSize);
					  Ipp = (double)(SC.dacSet.AR_IMax - SC.dacSet.AR_IMin);
					  Vpp = (double)(SC.dacSet.AR_VMax - SC.dacSet.AR_VMin);
					  Z = (Vpp / Ipp)*1000.0;
				  }
			  }
			  else {
				  Z = (Vpp/Ipp)*16.0;
			  }
			  if (Z > ((double)(MAX_R))) {
					switch(MAX_R){
						case(100):
								SC.dacSet.SetRangeResistor(RANGE_100R);
							break;
						case(1000):
								SC.dacSet.SetRangeResistor(RANGE_1K);
							break;
						case(10000):
								SC.dacSet.SetRangeResistor(RANGE_10K);
							break;
						case(100000):
								SC.dacSet.SetRangeResistor(RANGE_100K);
							break;
						case(1000000):
								SC.dacSet.SetRangeResistor(RANGE_1M);
							break;
						default:
							SC.dacSet.SetRangeResistor(RANGE_100R);
							break;
					}
			}	else {
				if (Z < 3) {
					SC.dacSet.SetRangeResistor(RANGE_1R);
				}	else if((Z > 3)&(Z<=30)) {
					SC.dacSet.SetRangeResistor(RANGE_10R);
				}	else if((Z > 30)&(Z<=300)) {
					SC.dacSet.SetRangeResistor(RANGE_100R);
				}	else if((Z > 300)&(Z<=3000)) {
					SC.dacSet.SetRangeResistor(RANGE_1K);
				}	else if((Z > 3000)&(Z<=30000)) {
					SC.dacSet.SetRangeResistor(RANGE_10K);
				}	else if((Z > 30000)&(Z<=300000)) {
					SC.dacSet.SetRangeResistor(RANGE_100K);
				}	else {
					SC.dacSet.SetRangeResistor(RANGE_1M);
				}
			}
			PGA_SET = 1;
		  }
		if(PGA_SET == 1) {
	    SC.adcSet.SetPGAGain(PGA_V, GAIN_1);
	    SC.adcSet.SetPGAGain(PGA_I, GAIN_1);
		SC.dacSet.AutoRangeSMPL(range_SampleSize);
		SC.dacSet.AutoRangeV(SC.dacSet.AR_VMax, SC.dacSet.AR_VMin);
		SC.dacSet.AutoRangeI_PGA(SC.dacSet.AR_IMax, SC.dacSet.AR_IMin);
//		SC.dacSet.AutoRangeSMPL(range_SampleSize);
//		SC.dacSet.AutoRangeV(SC.dacSet.AR_VMax, SC.dacSet.AR_VMin);
//		SC.dacSet.AutoRangeI_PGA(SC.dacSet.AR_IMax, SC.dacSet.AR_IMin);

	  }
}

uint8_t AutoRangeCheck(uint32_t smpl_f, uint32_t test_f) {
	int32_t IDiff = 0;
	int32_t VDiff = 0;
	uint8_t state = 0;
	CommPort.ResetComm();
	uint32_t range_SampleSize = 3*(smpl_f/test_f);
	float R_Range = 1;
	double IMaxGain = (1/((float)test_f))*(3000000000.0);
	//double IMaxGain = 2000000;
	SC.adcSet.SetSampleSize(range_SampleSize);
	SC.dacSet.AutoRangeSMPL(range_SampleSize);
	HAL_Delay(20);
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
			nextSample *= calPar.vmeas;
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
			nextSample *= calPar.imeas;
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
//		double angle = (2.0*M_PI * 400.0 * (double)nTimeIndex)/(double)DFT->set.NSampleSize;
		double angle = (2.0*M_PI * (double)DFT->set.kFrequencyIndex * (double)nTimeIndex)/(double)DFT->set.NSampleSize;
		fourierPartCoeff = (complexr){
			(double)inputSample * cos(angle*1.0),
			(double)inputSample * ((-1.0)* sin(angle))
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
//		ns_delay(50);
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
//		ns_delay(50);
		CommPort.set.PulseCLK();
//		ns_delay(50);
		CommPort.set.SetIOValue(data);
//		ns_delay(50);
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
//		ns_delay(50);
		CommPort.set.SetIOValue(addr);
//		ns_delay(50);
		CommPort.set.PulseCLK();
//		ns_delay(50);
		CommPort.set.SetRnW(READ);
		CommPort.set.SetIOMode(READ);
//		ns_delay(50);
		CommPort.set.PulseCLK();
//		ns_delay(50);
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

double PhaseCorrection(double phi, double frq, enum PGAGain vGain, enum PGAGain iGain) {
	phi += (frq/1000.0)*calPar.PhiCal.b_phi+calPar.PhiCal.a_phi;
	double phi_PGA = 0;
	double vLag = 0;
	double iLag = 0;
	double m_vBW = 0;
	double m_iBW = 0;
	switch(vGain) {
	case(GAIN_1):
		vLag = calPar.PhiCal.vLag_1;
		m_vBW = calPar.PhiCal.mBW_1;
		break;
	case GAIN_2:
		vLag = calPar.PhiCal.vLag_2;
		m_vBW = calPar.PhiCal.mBW_2;
		break;
	case GAIN_4:
		vLag = calPar.PhiCal.vLag_4;
		m_vBW = calPar.PhiCal.mBW_4;
		break;
	case GAIN_8:
		vLag = calPar.PhiCal.vLag_8;
		m_vBW = calPar.PhiCal.mBW_8;
		break;
	case GAIN_16:
		vLag = calPar.PhiCal.vLag_16;
		m_vBW = calPar.PhiCal.mBW_16;
		break;
	default:
		vLag = 0;
		break;
	}
	switch(iGain) {
	case(GAIN_1):
		iLag = calPar.PhiCal.iLag_1;
		m_iBW = calPar.PhiCal.mBW_1;
		break;
	case GAIN_2:
		iLag = calPar.PhiCal.iLag_2;
		m_iBW = calPar.PhiCal.mBW_2;
		break;
	case GAIN_4:
		iLag = calPar.PhiCal.iLag_4;
		m_iBW = calPar.PhiCal.mBW_4;
		break;
	case GAIN_8:
		iLag = calPar.PhiCal.iLag_8;
		m_iBW = calPar.PhiCal.mBW_8;
		break;
	case GAIN_16:
		iLag = calPar.PhiCal.iLag_16;
		m_iBW = calPar.PhiCal.mBW_16;
		break;
	default:
		iLag = 0;
		break;
	}

	if (SC.adcSet.CurrentPGA_V >= SC.adcSet.CurrentPGA_C) {
		phi_PGA = vLag+iLag+m_vBW+m_iBW;
	} else {
		phi_PGA = vLag+iLag-(m_vBW-m_iBW);
	}
	phi_PGA*= (frq/100000.0);
	phi+=phi_PGA;
	return(phi);
}

uint32_t smplTime(uint32_t smpl_f, uint32_t smpl_size) {
	uint32_t ms_time = ((smpl_size*1000)/smpl_f)+5;;
	if(ms_time <= 0) {
		ms_time = 5;
	}
	return(ms_time);
}


//TEMP

void tempPrint(uint16_t f_sampleSize, uint16_t testVar) {
	int16_t VMeas = 0;
	int16_t IMeas = 0;
	float max = 0;
	float min = 0;
	char str[25];
	uint8_t uartBuf[21];
	HAL_Delay(10);
	  CommPort.ResetComm();
	  SC.adcSet.SetSampleSize(f_sampleSize);
		CommPort.WriteData(0x8000, 7);
		HAL_Delay(100);

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
			float meas = calPar.vmeas*VMeas*(4.999/32768.0);
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
			meas = calPar.imeas*VMeas*(4.999/32768.0);

			sprintf(str, "%.6f\r\n", (meas));
			strcpy((char*)uartBuf, str);
			HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//
//
			if (meas < min) {
				min = meas;
			}
			if (meas > max) {
				max = meas;
			}



			HAL_Delay(1);
			}

//			sprintf(str, "%.6f\r\n", ((max-min)/2.82843));
//			strcpy((char*)uartBuf, str);
//			HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
//			HAL_Delay(1500);

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
	DUT.cal.get_Z = get_Z;
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
	SC.adcSet.smplTime = smplTime;
	SC.dacSet.SetRangeResistor = SetRangeResistor;
	SC.dacSet.SetDACFrequency = SetDACFrequency;
	SC.dacSet.AutoRangeV = AutoRangeV;
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
	calPar.PhiCal.CorrectPhi = PhaseCorrection;
//	calPar.PhiCal.a_phi = -0.0479;
	calPar.PhiCal.a_phi = -0.00;
	calPar.PhiCal.b_phi = -0.0074;
	calPar.PhiCal.iLag_1 = 0.09;
	calPar.PhiCal.iLag_2 = 0.02;
	calPar.PhiCal.iLag_4 = 0.0;
	calPar.PhiCal.iLag_8 = 0.09;
	calPar.PhiCal.iLag_16 =  0.33;
	calPar.PhiCal.vLag_1 = -0.17;
	calPar.PhiCal.vLag_2 = -0.05;
	calPar.PhiCal.vLag_4 = 0.0;
	calPar.PhiCal.vLag_8 = -0.1;
	calPar.PhiCal.vLag_16 = -0.36;
	calPar.PhiCal.mBW_1 = -0.03;
	calPar.PhiCal.mBW_2 = -0.02;
	calPar.PhiCal.mBW_4 = 0.0;
	calPar.PhiCal.mBW_8 = 0.0;
	calPar.PhiCal.mBW_16 = 0.04;


	//Calibration Constants:
	calPar.vmeas = 1.0003864;	//Voltage Calibration Constant
	calPar.imeas = 1.0030089;
	calPar.r_Relay[0] = 0.0521;
	calPar.r_Relay[1] = 0.0478;
	calPar.r_Relay[2] = 0.0641;
	calPar.r_Relay[3] = 1.12;
	calPar.r_Relay[4] = 4.6;
	calPar.r_Relay[5] = -60.0;
	calPar.r_Relay[6] = -119.8;

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
	double phaseCorrection = 0;


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

  TestParameters testPar = (TestParameters){1000, 100000, 500, 1};
//  for(int i=0; i < 7; i++) {
//	  calPar.r_Relay[i] = 0.06;
//  }

//  HAL_Delay(10000);
  CommPort.ResetComm();
  SC.adcSet.SetSampleSize(testPar.sampleSize);
  SC.adcSet.SetADCSampleFrequency(testPar.sampleFrequency);
  SC.dacSet.SetDACFrequency(testPar.testFrequency);
  //
  DFTSet.set.NSampleSize = testPar.sampleSize;
  DFTSet.set.DFTres = DFTSet.get.CalDFTResolution(testPar.sampleSize, testPar.sampleFrequency); //Lav gets til disse
  DFTSet.set.kFrequencyIndex = DFTSet.get.GetkFrequencyIndex(testPar.testFrequency, DFTSet.set.DFTres);
  SC.adcSet.SetPGAGain(PGA_V, GAIN_16);
  SC.adcSet.SetPGAGain(PGA_I, GAIN_16);
  SC.dacSet.TestLevel(LVL_2, HIGH);

//  SC.dacSet.AutoRange(testPar.sampleFrequency, testPar.testFrequency);

  calPar.OS_Cal(testPar.sampleFrequency, testPar.testFrequency, (uint32_t)testPar.sampleSize, 0.0);

  CommPort.ResetComm();
  SC.adcSet.SetSampleSize(testPar.sampleSize);
  SC.dacSet.SetRangeResistor(RANGE_10K);
  SC.adcSet.SetPGAGain(PGA_V, GAIN_4);
  SC.adcSet.SetPGAGain(PGA_I, GAIN_4);
//  SC.dacSet.TestLevel(LVL_2, HIGH);
  phaseCorrection = calPar.PhiCal.CorrectPhi(0, (double)testPar.testFrequency, SC.adcSet.CurrentPGA_V, SC.adcSet.CurrentPGA_C);
  complexp avg;
  while (1)
  {
//	  tempPrint(200, testVar);
//	  if(SC.dacSet.AutoRangeCheck(testPar.sampleFrequency, testPar.testFrequency) == 1) {
//		  SC.dacSet.AutoRange(testPar.sampleFrequency, testPar.testFrequency);
//		  phaseCorrection = calPar.PhiCal.CorrectPhi(0, (double)testPar.testFrequency, SC.adcSet.CurrentPGA_V, SC.adcSet.CurrentPGA_C);
//	  }
	  for(int i = 0; i < 5; i++) {
	  SC.dacSet.AutoRange(testPar.sampleFrequency, testPar.testFrequency);
	  SC.adcSet.SetSampleSize(testPar.sampleSize);
	  SC.adcSet.StartSampling();
	  HAL_Delay(SC.adcSet.smplTime(testPar.sampleFrequency, (uint32_t)testPar.sampleSize));
	  DUT.cal.get_Z();
	  DUT.param.z.argDeg-= phaseCorrection;
	  DUT.param.y = cmplxmath.pol.PolarToRectangular(DUT.param.z);
	  DUT.param.z = calPar.CorrectDUT(DUT.param.y, SC.dacSet.CurrentRangeIndicator, testPar.testFrequency);
	  avg.mod += DUT.param.z.mod;
	  avg.argDeg += DUT.param.z.argDeg;
	  HAL_Delay(1);
	  }
	  avg.mod /= 5.0;
	  avg.argDeg /= 5.0;
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
//
////

	  sprintf(str, "Impedance MAG : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  switch(SC.dacSet.CurrentRangeIndicator) {
		  case(1):
			  sprintf(str, "%.4f", (avg.mod));
		  	  strcpy((char*)uartBuf, str);
		  	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
			  sprintf(str, " Ohm ");
			  strcpy((char*)uartBuf, str);
			  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
			  break;
	  	  case(10):
			  sprintf(str, "%.3f", (avg.mod));
		  	  strcpy((char*)uartBuf, str);
		  	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
			  sprintf(str, " Ohm ");
			  strcpy((char*)uartBuf, str);
			  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
			  break;
	  	  case(100):
			  sprintf(str, "%.2f", (avg.mod));
		  	  strcpy((char*)uartBuf, str);
		  	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
			  sprintf(str, " Ohm ");
			  strcpy((char*)uartBuf, str);
			  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
			  break;
	  	  case(1000):
			  avg.mod/=1000.0;
	  	  	  sprintf(str, "%.4f", (avg.mod));
	  		  strcpy((char*)uartBuf, str);
	  		  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  		  sprintf(str, " kOhm ");
	  		  strcpy((char*)uartBuf, str);
	  		  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  	  	  break;
	  	  case(10000):
			  avg.mod/=1000.0;
	  	  	  sprintf(str, "%.3f", (avg.mod));
	  		  strcpy((char*)uartBuf, str);
	  		  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  		  sprintf(str, " kOhm ");
	  		  strcpy((char*)uartBuf, str);
	  		  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  	  	  break;
	  	  case(100000):
			  avg.mod/=1000.0;
	  	  	  sprintf(str, "%.2f", (avg.mod));
	  		  strcpy((char*)uartBuf, str);
	  		  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  		  sprintf(str, " kOhm ");
	  		  strcpy((char*)uartBuf, str);
	  		  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  	  	  break;
	  	  case(1000000):
			  avg.mod/=1000000.0;
	  	  	  sprintf(str, "%.1f", (avg.mod));
	  		  strcpy((char*)uartBuf, str);
	  		  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  		  sprintf(str, " MOhm ");
	  		  strcpy((char*)uartBuf, str);
	  		  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  	  	  break;
	  }


//	  sprintf(str, "%.4f\n", (3.0));

////
////
////
	  sprintf(str, "PHI : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.3f\n", (avg.argDeg));
//	  sprintf(str, "%.4f\n", (3.0));
//	  sprintf(str, "%.4f\n", (phaseCorrection));
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);


	  sprintf(str, "Range : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.4f\n", (SC.dacSet.CurrentRangeResistor));
//	  sprintf(str, "%.4f\n", (3.0));
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);

	  sprintf(str, "PGA_V : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.2f\n", (SC.adcSet.VoltagePGAGain));
//	  sprintf(str, "%.4f\n", (3.0));
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);


	  sprintf(str, "PGA_I : ");
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  sprintf(str, "%.2f\n", (SC.adcSet.CurrentPGAGain));
//	  sprintf(str, "%.4f\n", (3.0));
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);


	  avg.mod = 0;
	  avg.argDeg = 0;

	  HAL_Delay(10);


	//}

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
