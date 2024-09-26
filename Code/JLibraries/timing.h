/*
 * timing.h
 *
 *  Created on: Sep 23, 2024
 *      Author: JRIX
 */

#ifndef TIMING_H_
#define TIMING_H_

enum __Purpose{
	DelayUS,
	Undefined
};
enum __TimerSetup{
	OK = 1,
	FAIL = 0
};

enum __TimerSetup TimingInit(uint8_t setTimerID, TIM_HandleTypeDef *setTmrHandle, uint32_t setTmrTickFreq, enum __Purpose purpose);

void TimingDelayUS(uint32_t us);

#endif /*ENDIF TIMING_H_ */
