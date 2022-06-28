/*The RandomColor class provides backend functionality to the ColorGame application. The goal for this
class is to use C++ with QML and succesfully connect them to produce an application. This class will
generate a random number between 1 - 10 and it will look at the indexed colors with the number as index,
then it will attempt to emit a signal with the hexidesimal value of the color to the QML front end.*/
#ifndef RANDOMCOLOR_H
#define RANDOMCOLOR_H

#include <QObject>
#include <QVariant>
#include <QRandomGenerator>
#include <QList>

class RandomColor : public QObject
{
    Q_OBJECT
public:
    explicit RandomColor(QObject *parent = nullptr);

signals:
    void randColor(QVariant hexColor, QVariant colorName);

public slots:
    void generateRandomColor();

private:
    //hexColors & colorNames are parallel to each other
    QList<QString> hexColors{};
    QList<QString> colorNames{};

};

#endif // RANDOMCOLOR_H
