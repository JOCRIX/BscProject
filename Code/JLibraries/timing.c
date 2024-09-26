#include "stm32f4xx_hal.h"
#include "timing.h"
#include <stdint.h>
static uint8_t __TimingWipeTimers();
static void TimingUpdateTimerPurposes();

static enum __VerifiedTimers{
	Unsupported = 0,
	TMR14 = 1
};

static enum __VerifiedTimers __supTmr[14] = {Unsupported,Unsupported,Unsupported,
								  Unsupported,Unsupported,Unsupported,
								  Unsupported,Unsupported,Unsupported,
								  Unsupported,Unsupported,Unsupported,
								  Unsupported, TMR14};
static struct __tmr{
	TIM_HandleTypeDef *tmrHandle;
	uint32_t tmrTickFreq;
	struct config{
		enum __Purpose purpose;
	}config;
}__TMR[14];
static uint8_t __timersWiped = 0;

static TIM_HandleTypeDef *__timingDelayUSTmrID = NULL;

void TimingDelayUS(uint32_t us) {
	if (us == 1) {
		__HAL_TIM_SET_COUNTER(__timingDelayUSTmrID, 0);
		while (__HAL_TIM_GET_COUNTER(__timingDelayUSTmrID) != 1);
	} else {
		__HAL_TIM_SET_COUNTER(__timingDelayUSTmrID, 0);
		while (__HAL_TIM_GET_COUNTER(__timingDelayUSTmrID) != us);
	}
}

static void TimingUpdateTimerPurposes(){
	for(int i = 0; i < sizeof(__TMR);i++){
		switch(__TMR[i].config.purpose){
		case DelayUS:
			__timingDelayUSTmrID = __TMR[i].tmrHandle;
		break;
		default:

		}
	}
}

enum __TimerSetup TimingInit(uint8_t setTimerID, TIM_HandleTypeDef *setTmrHandle, uint32_t setTmrTickFreq, enum __Purpose purpose) {
	enum __TimerSetup state;
	if (__timersWiped == 0) {
		__timersWiped = __TimingWipeTimers();
	} else {
		if(setTimerID == __supTmr[setTimerID - 1]){
			__TMR[setTimerID - 1].config.purpose = purpose;
			__TMR[setTimerID - 1].tmrHandle = setTmrHandle;
			__TMR[setTimerID - 1].tmrTickFreq = setTmrTickFreq;
			state = OK;
			TimingUpdateTimerPurposes();
		}else{
			state = FAIL;
		}
	}
	return state;
}

static uint8_t __TimingWipeTimers(){
	for(int i = 0; i < sizeof(__TMR); i++){
		__TMR[i].tmrHandle = 0;
		__TMR[i].tmrTickFreq = 0;
		__TMR[i].config.purpose = Undefined;
	}
	return 1;
}
