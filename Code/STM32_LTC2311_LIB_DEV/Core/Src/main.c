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

#include <stdio.h>
#include <string.h>

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
SPI_HandleTypeDef hspi2;

TIM_HandleTypeDef htim14;

UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_SPI2_Init(void);
static void MX_TIM14_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */




uint8_t FloatToString(float input, char *output){
	uint8_t stringSize = sprintf(output, "\r\n%f", input);
	return stringSize;
}

float ConvertADCVoltage(uint16_t rawADC){
	//Resolution = (VREFOUT * 2)/2^16 = 0.000125
	//float res = 0.000125;
	//With 5V supply Resolution = 0.000250
	//float res = 0.00025;
	//With 5V Supply and 5V external reference on REFOUT && REFIN grounded res = 0.0003055
	float res = 0.0003055;
	return (res * rawADC);
}

void TimingDelayUS(uint32_t us) {
	if (us == 1) {
		__HAL_TIM_SET_COUNTER(&htim14, 0);
		while (__HAL_TIM_GET_COUNTER(&htim14) != 1);
	} else {
		__HAL_TIM_SET_COUNTER(&htim14, 0);
		while (__HAL_TIM_GET_COUNTER(&htim14) != us);
	}
}

uint16_t BytesToWord(uint8_t highByte, uint8_t lowByte){
	uint16_t resultWord = 0;
	resultWord = (highByte << 8) + lowByte;
	return resultWord;
}
/* uint8_t *ToBinaryArray(uint8_t highByte, uint8_t lowByte)
 * The function take two bytes, where they are assumed to form a single 16 bit value. One is the
 * upper 8 bits, the other is the lower 8 bits. The function will convert the two bytes into a single
 * array where the max array index is the MSB of the 16 bit value. The resulting binary array is locally
 * stored in the function.
 * Input: (uint8_t highByte, uint8_t lowByte)
 * Output: (uint8_t *binaryArray (pointer))
 * */
uint8_t *ToBinaryArray(uint8_t highByte, uint8_t lowByte){
	static uint8_t binaryArray[16];

	for (int i = 0; i < 8; i++) {
		if(((highByte) & (1 << i)) >= 1){
			binaryArray[i + 8] = 1;
		}else{
			binaryArray[i + 8] = 0;
		}
		if(((lowByte) & (1 << i)) >= 1){
			binaryArray[i] = 1;
		}else{
			binaryArray[i] = 0;
		}
	}
	return &binaryArray[0];
}
/*	int8_t IntToASCII(uint8_t integer)
 *The function takes a (uint8_t) integer value and converts it to the corresponding ASCII value.
 *Input: (uint8_t) value
 *Output: (int8_t) ASCII
 * */
int8_t IntToASCII(uint8_t integer){
	return integer + '0';
}
/*	uint8_t FlipArray(uint8_t *arr)
 * 	The function take a pointer to a uint8_t array of size 16 and will flip it over,
 * 	this means that the source arrays LSB will be MSB in destination array, and vice versa.
 * 	Input: (uint8_t *) pointer to source array. Max array length 16.
 * 	Output: (uint8_t *) pointer to destination array. Max array length is 16. The array is local
 * 	to the function and will be overwritten on function call.
 * */
uint8_t * FlipArray(uint8_t *arr){

	static uint8_t newArray[16];
	for(uint8_t i = 16; i > 0; i--){
		newArray[i - 1] = *arr;
		arr++;
	}
	return &newArray[0];
}
/* void ADCTXBinary(UART_HandleTypeDef *uartHandle, uint8_t highByte, uint8_t lowByte)
 * Transmits the contents of the SPI Buffer in a binary format over UART.
 * Input: (UART_HandleTypeDef *uartHandle) - Handle for UART module
 * Input: (uint8_t highByte) - bits 15-8of SPI Buffer
 * Input: (uint8_t lowByte) - bits 7- 0 of SPI buffer
 * Output: void
 * */
void ADCTxBinary(UART_HandleTypeDef *uartHandle, uint8_t highByte, uint8_t lowByte){
	uint8_t *ptrBinArr = NULL; //Local array size is 16
	uint8_t *ptrFlippedBinArr = NULL; //Local array size is 16
	char termStrLineFeed[] = "\r\n\0"; //Generate return carriage, line feed and message terminator
	char bitString[25];

	ptrBinArr = ToBinaryArray(highByte, lowByte); //Convert SPI Buffer values to a array holding a total of 16 bits
	ptrFlippedBinArr = FlipArray(ptrBinArr); //Flip the array around to MSB is in the max array index.

	for (int i = 0; i < 16; i++){ //Generate a string of 1's and 0's bases on the flipped array.
		//leftJustBinArray[i] = *ptrFlippedBinArr;
		//stringTest[i] = IntegerToASCII(binaryArray[i]);
		bitString[i] = IntToASCII(*ptrFlippedBinArr);
		ptrFlippedBinArr++;
	}
	//HAL_UART_Transmit(&huart2, (uint8_t*)ASCIIString, 16, HAL_MAX_DELAY);
	HAL_UART_Transmit(uartHandle, (uint8_t*)bitString, 16, HAL_MAX_DELAY);
	HAL_UART_Transmit(uartHandle, (uint8_t*)termStrLineFeed, 3, HAL_MAX_DELAY);

}

void ADCTxVoltage(UART_HandleTypeDef *uartHandle, float voltage){
	char ADCVoltageString[10];
	uint8_t size = sprintf(ADCVoltageString, "%f\r\n", voltage);
	HAL_UART_Transmit(uartHandle, (uint8_t*)ADCVoltageString, size, HAL_MAX_DELAY);
}

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */
	uint8_t SPIBuf[2];
	SPIBuf[0] = 0;
	SPIBuf[1] = 0;
	uint16_t SPIWord = 0;
	float ADCVoltage = 0;
	uint8_t size;

	char *floatval;

	char testString[25];
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
  MX_SPI2_Init();
  MX_TIM14_Init();
  /* USER CODE BEGIN 2 */

  //Start counting on timer 14 - HUSK!!
  HAL_TIM_Base_Start(&htim14);
  //TimingInit(14, &htim14, uint32_t setTmrTickFreq, enum __Purpose purpose)
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
		HAL_GPIO_WritePin(GPIOA, CNV_Pin, GPIO_PIN_SET);
		TimingDelayUS(1);
		HAL_GPIO_WritePin(GPIOA, CNV_Pin, GPIO_PIN_RESET);
		HAL_SPI_Receive(&hspi2, (uint8_t*) SPIBuf, 2, 100);
		//ADCTxBinary(&huart2, SPIBuf[0], SPIBuf[1]); //UART TX the contents of SPI Buffer in binary
		SPIWord = BytesToWord(SPIBuf[0], SPIBuf[1]);
		ADCVoltage = ConvertADCVoltage(SPIWord);
		ADCTxVoltage(&huart2, ADCVoltage);

		//HAL_Delay(100);


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
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 180;
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
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV8;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief SPI2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_SPI2_Init(void)
{

  /* USER CODE BEGIN SPI2_Init 0 */

  /* USER CODE END SPI2_Init 0 */

  /* USER CODE BEGIN SPI2_Init 1 */

  /* USER CODE END SPI2_Init 1 */
  /* SPI2 parameter configuration*/
  hspi2.Instance = SPI2;
  hspi2.Init.Mode = SPI_MODE_MASTER;
  hspi2.Init.Direction = SPI_DIRECTION_2LINES_RXONLY;
  hspi2.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi2.Init.CLKPolarity = SPI_POLARITY_HIGH;
  hspi2.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi2.Init.NSS = SPI_NSS_SOFT;
  hspi2.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_256;
  hspi2.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi2.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi2.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi2.Init.CRCPolynomial = 10;
  if (HAL_SPI_Init(&hspi2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN SPI2_Init 2 */

  /* USER CODE END SPI2_Init 2 */

}

/**
  * @brief TIM14 Initialization Function
  * @param None
  * @retval None
  */
static void MX_TIM14_Init(void)
{

  /* USER CODE BEGIN TIM14_Init 0 */

  /* USER CODE END TIM14_Init 0 */

  /* USER CODE BEGIN TIM14_Init 1 */

  /* USER CODE END TIM14_Init 1 */
  htim14.Instance = TIM14;
  htim14.Init.Prescaler = 45-1;
  htim14.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim14.Init.Period = 65536 - 1;
  htim14.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim14.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_Base_Init(&htim14) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN TIM14_Init 2 */

  /* USER CODE END TIM14_Init 2 */

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
  HAL_GPIO_WritePin(GPIOA, LD2_Pin|CNV_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(FDelayTestPin_GPIO_Port, FDelayTestPin_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : B1_Pin */
  GPIO_InitStruct.Pin = B1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(B1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : LD2_Pin */
  GPIO_InitStruct.Pin = LD2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LD2_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : FDelayTestPin_Pin */
  GPIO_InitStruct.Pin = FDelayTestPin_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  HAL_GPIO_Init(FDelayTestPin_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : CNV_Pin */
  GPIO_InitStruct.Pin = CNV_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  HAL_GPIO_Init(CNV_GPIO_Port, &GPIO_InitStruct);

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
