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
#include "string.h"
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
//Declares specific modes, here we can either read or write.
//Enum is essentially a special type that represents a group of constants,
//Here the IOMode can take two constants, either READ or WRITE.
enum IOMode{
	READ = 0,
	WRITE = 1
};
int8_t SetGPIOMode(enum IOMode mode);
int8_t SetIOValue(uint16_t IOvalue);
int8_t GetIOValue(uint16_t *result);
int8_t SetRnW(enum IOMode mode);

struct CommunicationPort{
	struct Control{
		struct CommunicationPort *selfAddr;
		uint16_t LowBytePins[8];
		GPIO_TypeDef *LowBytePort;
		uint16_t HighBytePins[8];
		GPIO_TypeDef *HighBytePort;
		uint16_t RWPin, CLKPin;
		GPIO_TypeDef *RWport, *CLKport;
		enum IOMode CurrentMode;
	}ctrl;
	struct Set{
		int8_t (*SetIOMode)(enum IOMode);
		int8_t (*SetIOValue)(uint16_t);
		int8_t (*GetIOValue)(uint16_t*);
		int8_t (*SetRnW)(enum IOMode);
	}set;

}CommPort;



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
			for(uint8_t i = 0; i < 16; i++){
			/*Load pins*/
			GPIO_InitStruct_HighByte.Pin |= cp->ctrl.HighBytePins[i];
			GPIO_InitStruct_LowByte.Pin |= cp->ctrl.LowBytePins[i];
			}
			GPIO_InitStruct_HighByte.Pin &= 0b0000000011111111;
			GPIO_InitStruct_LowByte.Pin &= 0b0000000011111111;
			/*Set pins mode*/
			GPIO_InitStruct_HighByte.Mode = GPIO_MODE_INPUT;
			GPIO_InitStruct_LowByte.Mode = GPIO_MODE_INPUT;
		/*Disable pullup/down*/
			GPIO_InitStruct_HighByte.Pull = GPIO_PULLUP;
			GPIO_InitStruct_LowByte.Pull = GPIO_PULLUP;
			cp->ctrl.CurrentMode = READ;
			break;
		case WRITE: /*Set all I/O to Output mode*/
			for(uint8_t i = 0; i < 16; i++){
				/*Load pins*/
				GPIO_InitStruct_HighByte.Pin |= cp->ctrl.HighBytePins[i];
				GPIO_InitStruct_LowByte.Pin |= cp->ctrl.LowBytePins[i];
			}
			GPIO_InitStruct_HighByte.Pin &= 0b0000000011111111;
			GPIO_InitStruct_LowByte.Pin &= 0b0000000011111111;
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
		lowByte = IOvalue & 0x00ff;
		highByte = (IOvalue >> 8) & 0xff;
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
		if ((cp -> ctrl.LowBytePort == GPIOB) && cp -> ctrl.HighBytePort == GPIOC) {
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
			HAL_GPIO_WritePin(cp->ctrl.RWport, cp->ctrl.RWPin, 0);
		}
		else if (mode == WRITE) {
			HAL_GPIO_WritePin(cp->ctrl.RWport, cp->ctrl.RWPin, 1);
		}
		return(status);
	}
	else {
		status = -1;
		return(status);
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
	CommPort.set.SetIOMode = SetGPIOMode;
	CommPort.set.SetIOValue = SetIOValue;
	CommPort.set.GetIOValue = GetIOValue;
	CommPort.set.SetRnW = SetRnW;
	CommPort.ctrl.selfAddr = &CommPort;
	CommPort.ctrl.RWPin = DB_RW_Pin;
	CommPort.ctrl.LowBytePort = GPIOB;
	CommPort.ctrl.HighBytePort = GPIOC;
	CommPort.ctrl.RWport = GPIOB;
	CommPort.ctrl.CLKport = GPIOC;
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
	uint16_t testVar = 0;
	char str[16];

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

  while (1)
  {
//	  GPIOC -> ODR = 0xffff;
//	  GPIOC -> ODR = 0;
	  CommPort.set.SetIOMode(READ);
	  CommPort.set.GetIOValue(&testVar);
	  sprintf(str, "%d\r\n", testVar);
	  strcpy((char*)uartBuf, str);
	  HAL_UART_Transmit(&huart2, uartBuf, strlen((char*)uartBuf), HAL_MAX_DELAY);
	  HAL_Delay(10);
	  CommPort.set.SetRnW(WRITE);
	  CommPort.set.SetIOMode(WRITE);
	  CommPort.set.SetIOValue(0);
	  HAL_Delay(10);
	  CommPort.set.SetRnW(READ);
//	  CommPort.set.SetIOMode(WRITE);
//	  HAL_Delay(10);
//	  CommPort.set.SetIOValue(0xFFFF);
//	  HAL_Delay(1000);
//	  CommPort.set.SetIOMode(READ);
//	  HAL_Delay(10);
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
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE3);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 16;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV4;
  RCC_OscInitStruct.PLL.PLLQ = 2;
  RCC_OscInitStruct.PLL.PLLR = 2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
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
  huart2.Init.BaudRate = 115200;
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

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOC, DB8_Pin|DB9_Pin|DB10_Pin|DB11_Pin
                          |DB12_Pin|DB13_Pin|DB15_Pin|DB_CLK_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, DB0_Pin|DB1_Pin|DB2_Pin|DB3_Pin
                          |DB4_Pin|DB5_Pin|DB6_Pin|DB7_Pin
                          |DB_RW_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : B1_Pin */
  GPIO_InitStruct.Pin = B1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(B1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : DB8_Pin DB9_Pin DB10_Pin DB11_Pin
                           DB12_Pin DB13_Pin DB15_Pin DB_CLK_Pin */
  GPIO_InitStruct.Pin = DB8_Pin|DB9_Pin|DB10_Pin|DB11_Pin
                          |DB12_Pin|DB13_Pin|DB15_Pin|DB_CLK_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

  /*Configure GPIO pin : LD2_Pin */
  GPIO_InitStruct.Pin = LD2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LD2_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : DB0_Pin DB1_Pin DB2_Pin DB3_Pin
                           DB4_Pin DB5_Pin DB6_Pin DB7_Pin
                           DB_RW_Pin */
  GPIO_InitStruct.Pin = DB0_Pin|DB1_Pin|DB2_Pin|DB3_Pin
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
