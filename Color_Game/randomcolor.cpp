#include "randomcolor.h"

RandomColor::RandomColor(QObject *parent)
    : QObject{parent}
{
    //Loading ten different colors loaded on to the vectors.
    hexColors.append("#FF0000");
    colorNames.append("Red");
    hexColors.append("#808080");
    colorNames.append("Gray");
    hexColors.append("#000000");
    colorNames.append("Black");
    hexColors.append("#FFFF00");
    colorNames.append("Yellow");
    hexColors.append("#008000");
    colorNames.append("Green");
    hexColors.append("#00FFFF");
    colorNames.append("Aqua");
    hexColors.append("#0000FF");
    colorNames.append("Blue");
    hexColors.append("#800080");
    colorNames.append("Purple");
    hexColors.append("#FFC0CB");
    colorNames.append("Pink");
    hexColors.append("#FFA500");
    colorNames.append("Orange");
}

void RandomColor::generateRandomColor()
{
    int randNum = QRandomGenerator::global()->bounded(10);

    emit randColor(QVariant(hexColors[randNum]), QVariant(colorNames[randNum]));
}
