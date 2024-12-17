/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define B1_Pin GPIO_PIN_13
#define B1_GPIO_Port GPIOC
#define DB8_Pin GPIO_PIN_0
#define DB8_GPIO_Port GPIOC
#define DB9_Pin GPIO_PIN_1
#define DB9_GPIO_Port GPIOC
#define DB10_Pin GPIO_PIN_2
#define DB10_GPIO_Port GPIOC
#define DB11_Pin GPIO_PIN_3
#define DB11_GPIO_Port GPIOC
#define DB_RESET_Pin GPIO_PIN_0
#define DB_RESET_GPIO_Port GPIOA
#define V_PGA_A0_Pin GPIO_PIN_1
#define V_PGA_A0_GPIO_Port GPIOA
#define USART_TX_Pin GPIO_PIN_2
#define USART_TX_GPIO_Port GPIOA
#define USART_RX_Pin GPIO_PIN_3
#define USART_RX_GPIO_Port GPIOA
#define RANGE_SER_DATA_Pin GPIO_PIN_4
#define RANGE_SER_DATA_GPIO_Port GPIOA
#define LD2_Pin GPIO_PIN_5
#define LD2_GPIO_Port GPIOA
#define RANGE_SER_CLK_Pin GPIO_PIN_6
#define RANGE_SER_CLK_GPIO_Port GPIOA
#define RANGE_SER_LATCH_Pin GPIO_PIN_7
#define RANGE_SER_LATCH_GPIO_Port GPIOA
#define DB12_Pin GPIO_PIN_4
#define DB12_GPIO_Port GPIOC
#define DB13_Pin GPIO_PIN_5
#define DB13_GPIO_Port GPIOC
#define DB0_Pin GPIO_PIN_0
#define DB0_GPIO_Port GPIOB
#define DB1_Pin GPIO_PIN_1
#define DB1_GPIO_Port GPIOB
#define DB2_Pin GPIO_PIN_2
#define DB2_GPIO_Port GPIOB
#define V_PGA_A1_Pin GPIO_PIN_10
#define V_PGA_A1_GPIO_Port GPIOB
#define V_PGA_A2_Pin GPIO_PIN_12
#define V_PGA_A2_GPIO_Port GPIOB
#define I_PGA_A0_Pin GPIO_PIN_13
#define I_PGA_A0_GPIO_Port GPIOB
#define I_PGA_A1_Pin GPIO_PIN_14
#define I_PGA_A1_GPIO_Port GPIOB
#define I_PGA_A2_Pin GPIO_PIN_15
#define I_PGA_A2_GPIO_Port GPIOB
#define DB14_Pin GPIO_PIN_6
#define DB14_GPIO_Port GPIOC
#define DB15_Pin GPIO_PIN_7
#define DB15_GPIO_Port GPIOC
#define DB_IX_Pin GPIO_PIN_8
#define DB_IX_GPIO_Port GPIOC
#define DB_CLK_Pin GPIO_PIN_9
#define DB_CLK_GPIO_Port GPIOC
#define Test_Input_Pin GPIO_PIN_8
#define Test_Input_GPIO_Port GPIOA
#define DAC_RANGE_A0_Pin GPIO_PIN_9
#define DAC_RANGE_A0_GPIO_Port GPIOA
#define DAC_RANGE_A1_Pin GPIO_PIN_10
#define DAC_RANGE_A1_GPIO_Port GPIOA
#define DAC_RANGE_EN_Pin GPIO_PIN_11
#define DAC_RANGE_EN_GPIO_Port GPIOA
#define TMS_Pin GPIO_PIN_13
#define TMS_GPIO_Port GPIOA
#define TCK_Pin GPIO_PIN_14
#define TCK_GPIO_Port GPIOA
#define TimerPin_Pin GPIO_PIN_10
#define TimerPin_GPIO_Port GPIOC
#define DB3_Pin GPIO_PIN_3
#define DB3_GPIO_Port GPIOB
#define DB4_Pin GPIO_PIN_4
#define DB4_GPIO_Port GPIOB
#define DB5_Pin GPIO_PIN_5
#define DB5_GPIO_Port GPIOB
#define DB6_Pin GPIO_PIN_6
#define DB6_GPIO_Port GPIOB
#define DB7_Pin GPIO_PIN_7
#define DB7_GPIO_Port GPIOB
#define DB_RW_Pin GPIO_PIN_9
#define DB_RW_GPIO_Port GPIOB

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
