//+------------------------------------------------------------------+
//|                                  AlertMessageOnEquityReached.mq5 |
//|                                Copyright 2018, InvestDataSystems |
//|                 https://tradingbot.wixsite.com/robots-de-trading |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, InvestDataSystems"
#property link      "https://tradingbot.wixsite.com/robots-de-trading"
#property version   "1.00"
#include <Trade\Trade.mqh>
#include <Trade\PositionInfo.mqh>
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }

CTrade trade;
CPositionInfo positionInfo;
CDealInfo cdealInfo;
double profit;
input double profitToReach=1;
bool done=false;
int x=0;
double equity = 0;
input double equityToReach = 510;
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   if(done==false)
     {
      equity = AccountInfoDouble(ACCOUNT_EQUITY);
      if (equity >= equityToReach)
      {  
         SendNotification("Equity >= " + DoubleToString(equityToReach));
         SendNotification("Equity = " + DoubleToString(equity));
         done = true;
      }
     }
  }
//+------------------------------------------------------------------+

void checkProfit()
  {
   printf("Numbers of opened positions : %G",PositionsTotal());
   for(x=0;x<PositionsTotal();x++)
     {
      printf("Index of the position %G",x);
      printf("Symbol of the selected position : %s",PositionGetSymbol(x));
      printf("Profit on the selected position : %G",PositionGetDouble(POSITION_PROFIT));
      printf("Position profit = " + PositionGetDouble(POSITION_PROFIT));
      cdealInfo.SelectByIndex(x);
      printf("commission = " + cdealInfo.Commission());
     }
  }
//+------------------------------------------------------------------+



