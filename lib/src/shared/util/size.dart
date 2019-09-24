import 'package:flutter/material.dart';


  double widthPercent(String percent, BuildContext context, {double max = 0.0, double min = 0.0})
  {
    double percentDecimal = _getPercentFromString(percent);
    
    Size size = _getContextSize(context);
    
    double width = size.width * percentDecimal;

    if(max > 0 && max < width)
      return max;

    if(min > 0 && min > width)
      return min;

    return width;
}

 double heightPercent(String percent, BuildContext context, {double max = 0.0, double min = 0.0 })
 {
  double percentDecimal = _getPercentFromString(percent);

  Size size = _getContextSize(context);

  double height = size.height * percentDecimal;

  if(max > 0 && max < height)
    return max;

  if(min > 0 && min > height)
    return min;

  return height;
}

double _getPercentFromString(String percent)
{
  
  percent = percent.replaceAll("%", "");

  return double.parse(percent) /100;
}


_getContextSize(BuildContext context)
{
  return MediaQuery.of(context).size;
}